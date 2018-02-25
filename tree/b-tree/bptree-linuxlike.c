/*
 * Copyrigth (C) Jagen Zhao (2018) jagen.zhao@gmail.com
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This porgram is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of 
 * MERCHANTABILITY of FITNESS FOR A PARTICULAR PURPOSE. See the 
 * GNU General Public License for more details.
 * 
 * You should hava received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/license/>.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bptree-linuxlike.h"

#define NODESIZE 128

struct bptree_geo {
    int keylen;
    int no_pairs;
    int no_longs;
};

struct bptree_geo bptree_geo64 = {
    .keylen = 64 / ( sizeof(long) * 8 ),
    .no_pairs = NODESIZE / sizeof(long) / 2,
    .no_longs = NODESIZE / sizeof(long) / 2,
};

static unsigned long *bptree_node_alloc(struct bptree_head *head)
{
    unsigned long *node;
    node = (unsigned long *)malloc( NODESIZE );
    memset(node, 0, NODESIZE);

    return node;
}

static int longcmp(const unsigned long *l1, const unsigned long *l2, size_t n)
{
    size_t i;

    for (i = 0; i < n; i++) {
        if (l1[i] < l2[i])
            return -1;
        if (l1[i] > l2[i])
            return 1;
    }
    return 0;
}

static unsigned long *longcpy(unsigned long *dest, const unsigned long *src, size_t n)
{
    size_t i;
    
    for (i = 0; i < n; i++)
        dest[i] = src[i];
    return dest;
}

static unsigned long *longset(unsigned long *s, unsigned long c, size_t n)
{
    size_t i;

    for (i = 0; i < n; i++) 
        s[i] = c;
    return s;
}

static void dec_key(struct bptree_geo *geo, unsigned long *key)
{
    unsigned long val;
    int i;

    for (i = geo->keylen - 1; i >=0; i--) {
        val = key[i];
        key[i] = val - 1;
        if (val)
            break;
    }
}

static unsigned long *bkey(struct bptree_geo *geo, unsigned long *node, int n)
{
    return &node[n * geo->keylen];
}

static void *bval(struct bptree_geo *geo, unsigned long *node, int n)
{
    return (void *)node[geo->no_longs + n];
}

static void setKey(struct bptree_geo *geo, unsigned long *node, int n, unsigned long *key)
{
    longcpy(bkey(geo, node, n), key, geo->keylen);
}

static void setVal(struct bptree_geo *geo, unsigned long *node, int n, void *val)
{
    node[geo->no_longs + n] = (unsigned long)val;
}

static void clearpair(struct bptree_geo *geo, unsigned long *node, int n)
{
    longset(bkey(geo, node, n), 0, geo->keylen);
    node[geo->no_longs + n] = 0;
}

static inline void __bptree_init(struct bptree_head *head)
{
    head->node = NULL;
    head->height = 0;
}

int bptree_init(struct bptree_head *head) 
{
    __bptree_init(head);
    return 0;
}

void btree_destroy(struct bptree_head *head) 
{

}

static int keycmp(struct bptree_geo *geo, unsigned long *node, int pos, unsigned long *key)
{
    return longcmp(bkey(geo, node, pos), key, geo->keylen);
}

static int keyzero(struct bptree_geo *geo, unsigned long *key)
{
    int i;

    for (i = 0; i < geo->keylen; i++) {
        if (key[i])
            return 0;
    }
    return 1;
}

void *btree_lookup(struct bptree_head *head, struct bptree_geo *geo, unsigned long *key)
{
    int i, height = head->height;
    unsigned long *node = head->node;

    if (height == 0)
        return NULL;
    
    for ( ; height > 1; height--) {
        for (i = 0; i < geo->no_pairs; i++) {
            if (keycmp(geo, node, i, key) <= 0)
                break;
        }
        if (i == geo->no_pairs)
            return NULL;
        node = bval(geo, node, i);
        if (!node)
            return NULL;
    }

    if (!node)
        return NULL;
    
    for (i = 0; i < geo->no_pairs; i++) {
        if (keycmp(geo, node, i, key) == 0)
            return bval(geo, node, i);
    }
    return NULL;
}

static int getpos(struct bptree_geo *geo, unsigned long *node, unsigned long *key)
{
    int i;

    for (i = 0; i < geo->no_pairs; i++) {
        if (keycmp(geo, node, i, key) <= 0)
            break;
    }

    return i;
}

static int getfill(struct bptree_geo *geo, unsigned long *node, int start) 
{
    int i;

    for (i = start; i < geo->no_pairs; i++)
        if (!bval(geo, node, i))
            break;
    return i;
}

static unsigned long *find_level(struct bptree_head *head, struct bptree_geo *geo, unsigned long *key, int level)
{
    unsigned long *node = head->node;
    int i, height;

    for (height = head->height; height > level; height--) {
        for (i = 0; i < geo->no_pairs; i++)
            if (keycmp(geo, node, i, key) <= 0)
                break;
        
        if ((i == geo->no_pairs) || !bval(geo, node, i)) {
            i--;
            setKey(geo, node, i, key);
        }
        node = bval(geo, node, i);
    }
    return node;
}

static int bptree_grow(struct bptree_head *head, struct bptree_geo *geo)
{
    unsigned long *node;
    int fill;

    node = bptree_node_alloc(head);
    if (!node)
        return -1;

    if (head->node) {
        fill = getfill(geo, head->node, 0);
        setKey(geo, node, 0, bkey(geo, head->node, fill - 1));
        setVal(geo, node, 0, head->node);
    }
    head->node = node;
    head->height++;
    return 0;
}

static void bptree_shrink(struct bptree_head *head, struct bptree_geo *geo)
{
    unsigned long *node;
    int fill;

    if (head->height <= 1)
        return;
    
    node = head->node;
    fill = getfill(geo, node, 0);
    head->node = bval(geo, node, 0);
    head->height--;
    free(node);
}

static int bptree_insert_level(struct bptree_head *head, struct bptree_geo *geo, unsigned long *key, void *val, int level)
{
    unsigned long *node;
    int i, pos, fill, err;

    if (head->height < level) {
        err = bptree_grow(head, geo);
        if (err)
            return err;
    }

retry:
    node = find_level(head, geo, key, level);
    pos = getpos(geo, node, key);
    fill = getfill(geo, node, pos);

    if (fill == geo->no_pairs) {
        unsigned long *new;

        new = bptree_node_alloc(head);
        if (!new)
            return -1;
        err = bptree_insert_level(head, geo, bkey(geo, node, fill / 2 -1), new, level + 1);
        if(err) {
            free(new);
            return err;
        }
        for (i = 0; i < fill / 2; i++) {
            setKey(geo, new, i, bkey(geo, node, i));
            setVal(geo, new, i, bval(geo, node, i));
            setKey(geo, node, i, bkey(geo, node, i + fill / 2));
            setVal(geo, node, i, bval(geo, node, i + fill / 2));
            clearpair(geo, node, i + fill / 2);
        }
        if (fill & 1) {
            setKey(geo, node, i, bkey(geo, node, fill - 1));
            setVal(geo, node, i, bval(geo, node, fill - 1));
            clearpair(geo, node, fill - 1);
        }
        goto retry;
    }

    for (i = fill; i > pos; i--) {
        setKey(geo, node, i, bkey(geo, node, i - 1));
        setVal(geo, node, i, bval(geo, node, i - 1));
    }
    setKey(geo, node, pos, key);
    setVal(geo, node, pos, val);

    return 0;
}

int bptree_insert(struct bptree_head *head, struct bptree_geo *geo, unsigned long key, void *val)
{
    unsigned long k = key;
    return bptree_insert_level(head, geo, &k, val, 1);
}