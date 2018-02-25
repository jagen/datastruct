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
#include "bptree.h"

#ifndef TRUE
#define TRUE -1
#endif

#ifndef FALSE
#define FALSE 0
#endif

struct _bptree {
    int                 max_children;
    size_t              size;
    size_t              height;
    cmp_func            key_cmp_func;
    destroy_func        key_destroy_func;
    destroy_func        data_destroy_func;
    struct _bptree_node *root;
    struct _bptree_node *next;
};

struct _bptree_node {
    void                **keys;
    int                 k_count;
    union _bptree_data  *d;
    int                 d_count;
    int                 is_leaf;
};

union _bptree_data {
    struct _bptree_node *child;
    void                *data;
};

// Create a B+Tree inner node.
static struct _bptree_node *__bplus_tree_create_node(int max_children)
{
    struct _bptree_node *node = NULL;

    node = (struct _bptree_node *)calloc(sizeof(struct _bptree_node), 1);
    if (!node)
        return NULL;

    node->keys = (void *)calloc(sizeof(void *), max_children - 1);
    if (!node->keys) {
        free(node);
        return NULL;
    }

    node->d = (union _bptree_data *)calloc(sizeof(union _bptree_data),
                                            max_children);
    if (!node->d) {
        free(node->keys);
        free(node);
        return NULL;
    }

    node->is_leaf = FALSE;

    return node;
}

// Create a B+Tree leaf node.
static inline struct _bptree_node *__bplus_tree_create_leaf(int max_keys)
{
    struct _bptree_node *leaf = __bplus_tree_create_node(max_keys + 1);
    if (!leaf) return NULL;

    leaf->is_leaf = TRUE;

    return leaf;
}

// Free a B+Tree inner node.
static void __bplus_tree_free_node(bplus_tree_t *tree, struct _bptree_node *n)
{
    if (!n) return;

    for (int i = 0; i < n->k_count; i++)
        tree->key_destroy_func(n->keys[i]);
    free(n->keys);
    
    for (int i = 0; i < n->d_count; i++)
        free(n->d[i].child);
    free(n->d);

    free(n);
}

// Free a B+Tree leaf node.
static void __bplus_tree_free_leaf(bplus_tree_t *tree, struct _bptree_node *l)
{
    if (!l) return;

    for (int i = 0; i < l->k_count; i++)
        tree->key_destroy_func(l->keys[i]);
    free(l->keys);
    
    for (int i = 0; i < l->d_count; i++)
        tree->data_destroy_func(l->d[i].data);
    free(l->d);

    free(l);
}

// Create a new B+Tree object.
static bplus_tree_t *__bplus_tree_create(int          max_children,
                                         cmp_func     key_cmp_func, 
                                         destroy_func key_destroy_func, 
                                         destroy_func data_destroy_func)
{
    bplus_tree_t *bptree = NULL;

    bptree = (bplus_tree_t *)calloc(sizeof(bptree), 1);
    if (bptree)
        return NULL;
    
    bptree->max_children = max_children;
    bptree->key_cmp_func = key_cmp_func;
    bptree->key_destroy_func = key_destroy_func;
    bptree->data_destroy_func = data_destroy_func;

    return bptree;
}

// Binary search in node.
static int __bptree_node_binary_search(bplus_tree_t *tree, 
                                        struct _bptree_node *n, void *key)
{
    int m, l = 0, h = n->k_count - 1;
    while (l <= h) {
        m = l + ((h - l) >> 1);
        int c = tree->key_cmp_func(key, n->keys[m]);
        if (c == 0) return m;
        else if (c < 0) h = m - 1;
        else l = m + 1;
    }
    return l;
}

// Insert data into B+Tree.
static int __bplus_tree_insert(bplus_tree_t *tree, void *key, void *data)
{
    struct _bptree_node *r = tree->root;
    if (!r) {
        r = __bplus_tree_create_leaf(tree->max_children - 1);
        r->keys[0] = key;
        r->d[0].data = data;
        tree->size++;
        tree->height++;
        tree->next = r;
        tree->root = r;
        return 0;
    }

    struct _bptree_node *pstack[tree->height]; // parent stack
    struct _bptree_node *l = r;
    int i, h = 0;

    while(!l->is_leaf) { // find leaf
        pstack[h++] = l;
        i = __bptree_node_binary_search(tree, l, key);
        l = l->d[i].child;
    }

    assert(tree->height == h);

    int c = tree->key_cmp_func(key, l->keys[i]);
    if (c == 0) return -1; // Not allowed same key.

    struct _bptree_node *n = l;
    while(pstack[h--]->k_count == tree->max_children - 1) {

    }
    
    return 0;
}

bplus_tree_t *bplus_tree_create(int          max_children,
                                cmp_func     key_cmp_func, 
                                destroy_func key_destroy_func, 
                                destroy_func data_destroy_func)
{


    return __bplus_tree_create( max_children, key_cmp_func, 
                                key_destroy_func, data_destroy_func);
}

void bplus_tree_destroy(bplus_tree_t *tree)
{

}

int bplus_tree_insert(bplus_tree_t *tree, void *key, void *data)
{
    return __bplus_tree_insert(tree, key, data);
}