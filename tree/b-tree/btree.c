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
#include <assert.h>
#include "btree.h"

#ifndef TRUE
#define TRUE -1
#endif

#ifndef FALSE
#define FALSE 0
#endif

struct _btree {
    struct _node *root;
    int           size;
    int           heigh;
    int           degree;
};

struct _node {
    void         **keys;
    int            k_count;
    struct _node **children;
    int            c_count;
};

// Create a new node.
static inline struct _node *btree_create_node(int degree)
{
    int s = 2 * degree;

    struct _node *node = (struct _node *)malloc(sizeof(struct _node));
    if (!node) return NULL;

    node->keys = (void **)malloc(sizeof(void *) * (s - 1));
    if (!node->keys) {
        free(node);
        return NULL;
    }

    node->children = (struct _node **)malloc(sizeof(struct _node *) * s);
    if (!node->children) {
        free(node->keys);
        free(node);
        return NULL;
    }

    for (int i = 0; i < s - 1; ++i) {
        node->keys[i]     = NULL;
        node->children[i] = NULL;
    }
    node->children[s] = NULL;
    node->k_count     = 0;
    node->c_count     = 0;
    
    return node;
}

// Free a node.
static inline void btree_free_node(struct _node *node)
{
    if (!node) return;

    if (node->keys) {
        for (int i = 0; i < node->k_count; ++i) free(node->keys[i]);
        free(node->keys);
    }

    if (node->children) {
        for (int i = 0; i < node->c_count; ++i) free(node->children[i]);
        free( node->children );
    }

    free( node );
}

// Ordered insert a key into node.
static inline void btree_node_insert(struct _node *node, int i, 
                            char *key, int ci, struct _node *n)
{
    memmove(node->keys + i + 1, node->keys + i, 
        sizeof(void *) * (node->k_count - i));
    
    if (n) { // With child.
        memmove(node->children + ci + 1, node->children + ci, 
                sizeof(void *) * (node->c_count - ci));
        node->children[ci] = n;
        node->c_count++;
    }

    node->keys[i] = key;
    node->k_count++;
}

// Ordered remove a key from node.
static inline void btree_node_remove(struct _node *node, int i, int ci)
{
    free(node->keys[i]);
    node->keys[i] = NULL;
    node->k_count--;
    memmove(node->keys + i, node->keys + i + 1, 
        sizeof(void *) * (node->k_count - i));
    node->keys[node->k_count] = NULL;
    
    if (node->c_count > 0) {
        node->children[ci] = NULL;
        node->c_count--;
        memmove(node->children + ci, node->children + ci + 1, 
            sizeof(void *) * (node->c_count - ci));
        node->children[node->c_count] = NULL;
    }
}

/* 
 * Split child node.
 *
 *      ------------------------------------------
 *     | K[1] | K[2] | ... | K[d] | ... | k[2d-1] |
 *      ------------------------------------------
 *      /      /        /     |          \         \
 *   ----  ----      -----   ------       -------   ------
 *  |C[1]||C[2]|    | C[d]| |C[d+1]|     |C[2d-1]| | C[2d]|
 *   ----  ----      -----   ------       -------   ------       
 *                            |
 *                            |
 *                            V
 *                    ------------------
 *                   |...| | K[d] | |...|
 *                    ------------------
 *                          /    \
 *      ----------------------   --------------------
 *     |K[1]| |K[2]|...|K[d-1]| |K[d+1]| ... |K[2d-1]|
 *      ----------------------   --------------------                 
 *     /      /          |        |          |        \
 *   ----   ----        ----     ------      -------   -----
 *  |C[1]| |C[2]|      |C[d]|   |C[d+1]|    |C[2d-1]| |C[2d]|
 *   ----   ----        ----     ------      -------   -----
 */
static inline void btree_split_child(struct _node *r, int i, int d)
{
    struct _node *c = r->children[i];
    struct _node *n = btree_create_node( d );
    size_t m = c->k_count / 2;

    btree_node_insert(r, i, c->keys[m], i, n);

    memmove(n->keys, c->keys, sizeof(void *) * m);
    memmove(c->keys, c->keys + m + 1, sizeof(void *) * m);
    memset(c->keys + m, 0, sizeof(void *) * (m + 1));
    n->k_count = m;
    c->k_count = m;

    if (c->c_count > 0) { // Non-leaf
        memmove(n->children, c->children, sizeof(void *) * d);
        memmove(c->children, c->children + d, 
                sizeof(void *) * (c->c_count - d));
        memset(c->children + d, 0, sizeof(void *) * d);
        n->c_count = d;
        c->c_count = c->c_count - d;
    }
}

/* 
 * Merge children nodes.
 *    
 *                      ------------------
 *                     |...| | K[i] | |...|
 *                      ------------------
 *                            /    \
 *        ----------------------   --------------------
 *       |K[1]| |K[2]|...|K[d-1]| |K[d+1]| ... |K[2d-1]|
 *        ----------------------   --------------------                 
 *       /      /          |        |          |        \
 *     ----   ----        ----     ------      -------   -----
 *    |C[1]| |C[2]|      |C[d]|   |C[d+1]|    |C[2d-1]| |C[2d]|
 *     ----   ----        ----     ------      -------   -----
 *                              |
 *                              |
 *                              V
 *      ----------------------------------------------------
 *     | K[1]|  ...  |K[d-1]| K[i] |K[d+1]|  ...  | k[2d-1] |
 *      ----------------------------------------------------
 *      /      /        /          |          \         \
 *   ----  ----      -----        ------       -------   ------
 *  |C[1]||C[2]|    | C[d]|      |C[d+1]|     |C[2d-1]| | C[2d]|
 *   ----  ----      -----        ------       -------   ------   
 */
static inline int btree_merge_children(struct _node *r, int i)
{
    struct _node *y = r->children[i];
    struct _node *z = r->children[i + 1];

    int ret = 0;
    void *key = r->keys[i];
    r->keys[i] = NULL;
    btree_node_remove(r, i, i);

    if (r->k_count== 0) { 
        // If root node is empty, 
        // we would merge children to it to lower the tree.
        memcpy(r->keys, y->keys, sizeof(void *) * y->k_count);
        memset(y->keys, 0, sizeof(void *) * y->k_count);
        r->keys[y->k_count] = key;
        memcpy(r->keys + y->k_count + 1, z->keys, sizeof(void *) * z->k_count);
        memset(z->keys, 0, sizeof(void *) * z->k_count);
        r->k_count = y->k_count + z->k_count + 1;

        if (y->c_count > 0) {
            memcpy(r->children, y->children, sizeof(void *) * y->c_count);
            memset(y->children, 0, sizeof(void *) * y->c_count);
            memcpy(r->children + y->c_count, z->children,
                    sizeof(void *) * z->c_count);
            memset(z->children, 0, sizeof(void *) * z->c_count);
            r->c_count = y->c_count + z->c_count;
        }
        
        ret = y->k_count;
        btree_free_node(y);
        btree_free_node(z);
    } else {
        memmove(z->keys + y->k_count + 1, z->keys, 
                sizeof(void *) * z->k_count);
        memmove(z->keys, y->keys, sizeof(void *) * y->k_count);
        memset(y->keys, 0, sizeof(void *) * y->k_count);
        z->keys[y->k_count] = key;
        z->k_count += y->k_count + 1;

        if (z->c_count > 0) {
            memmove(z->children + y->c_count, z->children, 
                sizeof(void *) * z->c_count);
            memmove(z->children, y->children, sizeof(void *) * y->c_count);
            memset(y->children, 0, sizeof(void *) * y->c_count);
            z->c_count += y->c_count;
        }

        ret = y->k_count;
        btree_free_node(y);
    }

    return ret;
}

// Get last node in a sub tree.
static inline struct _node *btree_node_get_last(struct _node *r)
{
    while (r->c_count > 0) r = r->children[r->c_count - 1];
    return r;
}

// Get fisrt node in a sub tree.
static inline struct _node *btree_node_get_first(struct _node *r) 
{
    while (r->c_count >0) r = r->children[0];
    return r;
}

// Binary search in node.
static inline int btree_node_binary_search(struct _node *n, char *key)
{
    int m, l = 0, h = n->k_count - 1;
    while (l <= h) {
        m = l + ((h - l) >> 1);
        int c = strcmp(key, (char *)n->keys[m]);
        if (c == 0) return m;
        else if (c < 0) h = m - 1;
        else l = m + 1;
    }
    return l;
}

// Create a new b-tree object.
BTree *btree_create(int degree) 
{
    BTree *bt = (BTree *)malloc(sizeof(BTree));
    if( !bt ) return NULL;

    bt->degree = degree;
    bt->size   = 0;
    bt->heigh  = 0;
    bt->root   = NULL;

    return bt;
}

// Insert a new key into the B-Tree obejct.
int btree_insert(BTree *tree, char *key) 
{
    if (!tree) return -1;

    int max = tree->degree * 2 - 1;
    int min = tree->degree - 1;
    struct _node *r = tree->root;

    if (!r) {
        r = btree_create_node( tree->degree );
        if(!r) return -1;
        
        r->keys[0] = key;
        r->k_count = 1;
        tree->root = r;
        tree->size++;
        tree->heigh= 1;
        return 0;
    }

    if (r->k_count == max) {  // tree grow.
        struct _node *s = btree_create_node(tree->degree);
        s->children[0] = r;
        s->c_count     = 1;
        btree_split_child(s, 0, tree->degree);
        tree->heigh++;
        tree->root = r = s;
    }

    while (TRUE) {
        int i = 0;
        if (r->c_count == 0) {
            i = btree_node_binary_search(r, key);
            if (i < r->k_count) {
                int c = strcmp(key, (char *)r->keys[i]);
                if (c == 0) {
                    free(r->keys[i]);
                    r->keys[i] = key;
                    return 0;
                }
            }
            btree_node_insert(r, i, key, i, NULL);
            tree->size++;
            return 0;
        } else {
            i = btree_node_binary_search(r, key);
            if (r->children[i]->k_count == max) {
                btree_split_child(r, i, tree->degree);
                int c = strcmp(key, (char *)r->keys[i]);
                if (c == 0) {
                    free(r->keys[i]);
                    r->keys[i] = key;
                    return 0;
                } else if (c > 0) i++;
            }
            r = r->children[i];
        }
    }

    return 0;
}

// Remove a key from the B-Tree object.
int btree_remove(BTree *tree, char *key)
{
    if (!tree) return -1;

    struct _node *r = tree->root;
    struct _node *n = NULL;

    int i = 0;
    while (r) {
        i = btree_node_binary_search(r, key);
        if (i < r->k_count) {
            int c = strcmp(key, (char *)r->keys[i]);
            if (c < 0) n = r->children[i];
            else if (c > 0) n = r->children[++i];
            else {
                if (r->c_count == 0) {
                    btree_node_remove(r, i, i);
                    tree->size--;
                    return 0;
                } else {
                    struct _node *y = r->children[i];
                    struct _node *z = r->children[i + 1];
                    key = r->keys[i];
                    if (y->k_count >= tree->degree) {
                        struct _node *l = btree_node_get_last(y);
                        r->keys[i] = l->keys[l->k_count - 1];
                        l->keys[l->k_count - 1] = key;
                        n = y;
                    } else if (z->k_count >= tree->degree) {
                        struct _node *f = btree_node_get_first(z);
                        r->keys[i] = f->keys[0];
                        f->keys[0] = key;
                        n = z;
                    } else {
                        (r->k_count == 1) ? (n = r) : (n = z);
                        i = btree_merge_children(r, i);
                    }
                }
            }
        } else n = r->children[i];

        if (n && n->k_count < tree->degree) {
            struct _node *sl = i > 0 ? r->children[i - 1] : NULL;
            struct _node *sr = i < tree->degree * 2 - 1 ? 
                                r->children[i + 1] : NULL;
            if (sl && sl->k_count >= tree->degree) {
                btree_node_insert(n, 0, r->keys[i - 1], 
                                    0, sl->children[sl->k_count]);
                r->keys[i - 1] = sl->keys[sl->k_count - 1];
                sl->keys[sl->k_count - 1] = NULL;
                btree_node_remove(sl, sl->k_count - 1, sl->k_count);
            } else if (sr && sr->k_count >= tree->degree) {
                btree_node_insert(n, n->k_count, r->keys[i], 
                                    n->k_count + 1, sr->children[0]);
                r->keys[i] = sr->keys[0];
                sr->keys[0] = NULL;
                btree_node_remove(sr, 0, 0);
            } else {
                btree_merge_children(r, (i < r->k_count) ? i : i - 1);
                continue;
            }
        }
        r = n;
    }

    return -1; // Not find.
}

// Find key in the B-Tree object.
int btree_search(BTree *tree, char *key)
{
    if (!tree) return -1;

    struct _node *r = tree->root;
    while (r) {
        int i = btree_node_binary_search(r, key);
        if (i < r->k_count) {
            int c = strcmp(key, (char *)r->keys[i]);
            if (c == 0) return 0;
            else if (c < 0) r = r->children[i];
            else r = r->children[i+1];
        } else r = r->children[i];
    }

    return -1;
}