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
#include <memory.h>
#include <string.h>
#include <assert.h>
#include "rbtree.h"

#ifndef TRUE
#define TRUE -1
#endif

#ifndef FALSE
#define FALSE 0
#endif

#define RED     0
#define BLACK   1
#define D_BLACK 2

/*
 * A red-black tree(RBT) is a binary search tree that satisfies 
 * the following red-black properties:
 * 1. Every node has a color that is either red or black.
 * 2. Every leaf is black.
 * 3. If a node is red, both children are black.
 * 4. Every path from a given node down to any descendant leaf contains 
 *    the same number of black nodes. The number of black nodes on souch
 *    a path (not including the inital node but includeing leaves) is 
 *    called the black-height (bh) of the node.
 * 5. The root of the tree is black (not a CLRS property, but should be).
 */

struct _rbtree {
    struct _node   *root;
    int             size;
};

struct _node {
    struct _node   *left;
    struct _node   *right;
    struct _node   *parent;
    int             color;
    char           *key;
    void           *data;
};

/*
 * Create a new node.
 */
static inline struct _node * 
rbtree_create_node( char *key, void *data )
{
    struct _node *node = (struct _node *)malloc( sizeof( struct _node ));
    if( NULL == node ) return NULL;

    node->left = node->right = node->parent =  NULL;
    node->color = RED;
    node->key   = key;
    node->data  = data;

    return node;
}

/*
 * Free node.
 */
static inline void 
rbtree_free_node( struct _node *node )
{
    if( NULL == node )
        return;

    free( node->key );
    free( node->data );
    free( node );
}

/*
 * Gets sibling node.
 */
static inline struct _node * 
rbtree_get_sibling_node( struct _node *node )
{
    if( NULL == node ) return NULL;

    struct _node *p = node->parent;
    if( NULL == p ) return NULL;

    return p->left == node ? p->right : p->left;
}

/*
 * Gets grandparent node.
 */
static inline struct _node *
rbtree_get_grandparent_node( struct _node *node )
{
    if( NULL == node ) return NULL;
    struct _node *p = node->parent;
    return NULL == p ? NULL : p->parent;
}

/*
 * Gets uncle node.
 */
static inline struct _node *
rbtree_get_uncle_node( struct _node *node )
{
    if( NULL == node ) return NULL;
    return rbtree_get_sibling_node( node->parent );
}

/*
 * Gets first node in middle order.
 */
static inline struct _node *
rbtree_get_first_node( struct _node *root ) 
{
    struct _node *node = root;
    if( NULL == node ) return NULL;

    while( NULL != node->left )
        node = node->left;

    return node;
}

/*
 * Gets last node in middle order.
 */
static inline struct _node *
rbtree_get_last_node( struct _node *root )
{   
    struct _node *node = root;
    if( NULL == node ) return NULL;

    while( NULL != node->right )
        node = node->right;

    return node;
}

/*
 * Gets predecessor node.
 */
static inline struct _node *
rbtree_get_prev_node( struct _node *node )
{
    if( NULL == node ) return NULL;
    
    if( NULL == node->left ) {
        while( NULL != node->parent ) {
            struct _node *p = node->parent;
            if( p->left == node ) {
                node = p;
                continue;
            } else return p;
        }
        return NULL;
    }
    
    return rbtree_get_last_node( node->left );
}

/* 
 * Left rotate
 *         x                y
 *        / \              / \
 *       a   y     ==>    x   c
 *          / \          / \
 *         b   c        a   b
 */
static inline struct _node *
rbtree_left_rotate( struct _node *root, struct _node *x )
{
    assert( NULL != x );
    assert( NULL != x->right );

    struct _node *y = x->right;

    x->right  = y->left;
    if( NULL != x->right )
        x->right->parent = x;
    y->left   = x;
    y->parent = x->parent;
    x->parent = y;

    if( root == x ) 
        root = y;
    else {
        if( y->parent->left == x )
            y->parent->left = y;
        else 
            y->parent->right = y;
    }

    return root;
}

/* 
 * Right rotate
 *          y              x
 *         / \            / \
 *        x   c    ==>   a   y
 *       / \                / \
 *      a   b              b   c
 */
static inline struct _node*
rbtree_right_rotate( struct _node* root, struct _node* y )
{
    assert( NULL != y );
    assert( NULL != y->left );

    struct _node *x = y->left;

    y->left   = x->right;
    if( NULL != y->left )
        y->left->parent = y;
    x->right  = y;
    x->parent = y->parent;
    y->parent = x;

    if( root == y ) 
        root = x;
    else {
        if( x->parent->left == y )
            x->parent->left = x;
        else 
            x->parent->right = x;
    }

    return root;
}

/*
 * Gets successor node.
 */
static inline struct _node*
rbtree_get_next_node( struct _node* node )
{
    if( NULL == node )
        return NULL;

    if( NULL == node->right ) {
        while( NULL != node->parent ) {
            struct _node* p = node->parent;
            if( p->right == node ) {
                node = p;
                continue;
            } else {
                return p;
            }
        }
        return NULL;
    }

    return rbtree_get_first_node( node->right );
}

/*
 * Find node by key.
 */
static inline struct _node*
rbtree_find_node_by_key( struct _node* root, char* key )
{
    if( NULL == root )
        return NULL;

    struct _node* node = root;
    while( NULL != node ) {
        int c = strcmp( key, node->key );
        if( c == 0 )
            return node;
        else if( c < 0 )
            node = node->left;
        else 
            node = node->right;
    }
    return NULL;
}

/*
 * Implementation of rb-tree inserting balance algorithm by CLRS.
 * This algorithm is more efficient.
 * None recursion
 */
static inline struct _node *
rbtree_insert_balance_by_CLRS( struct _node *root, struct _node *new_node )
{
    struct _node *n = new_node;
    struct _node *g = NULL;

    while( (g=rbtree_get_grandparent_node( n ) ) != NULL ) {
        struct _node *p = n->parent;
        struct _node *u = rbtree_get_uncle_node( n );
        if( n->color == RED && p->color == RED ) {
            /*
             *      *g           g           *g           g            
             *      / \         / \          / \         / \  
             *     p   b  ==> *p  *b  or    p   b  ==> *p  *b  
             *    / \         / \          / \         / \    
             *   n  *a       n  *a       *a   n      *a   n 
             *                        or 
             *    *g            g          *g            g     
             *    / \          / \         / \          / \    
             *   a   p   ==> *a  *p   or  a   p  ==>  *a  *p    
             *      / \          / \         / \          / \   
             *    *b   n       *b   n       n  *b       *n  *b   
             */
            if( NULL != u && u->color == RED ) {
                u->color = BLACK;
                p->color = BLACK;
                g->color = RED;
                n = g;
            }
            /* 
             *           *g
             *           / \
             *         p    D    RR        *p
             *        / \        ==>       / \
             *      n    C               n     g
             *     / \                  / \   / \
             *    A   B                A   B C   D
             */             
            else if( p->left == n && g->left == p ) {
                root = rbtree_right_rotate( root, g );
                p->color = BLACK;
                g->color = RED;
                break;
            }
            /*
             *       *g                *g
             *       / \               / \
             *      A   p      RR     A   n      LR         *n
             *         / \     ==>       / \     ==>        / \
             *        n   D             B   p             g     p
             *       / \                   / \           / \   / \
             *      B   C                 C   D         A   B C   D
             */             
            else if( p->left == n && g->right == p ) {
                rbtree_right_rotate( root, p );
                root = rbtree_left_rotate( root, g );
                n->color = BLACK;
                g->color = RED;
                break;
            }
            /* 
             *     *g
             *     / \
             *    A   p        LR          *p
             *       / \       ==>         / \
             *      B   n                g     n
             *         / \              / \   / \
             *        C   D            A   B C   D
             */             
            else if( p->right == n && g->right == p ) {
                root = rbtree_left_rotate( root, g );
                p->color = BLACK;
                g->color = RED;
                break;
            }
            /* 
             *       *g                  *g
             *       / \                 / \
             *      p   D      LR       n   D    RR        *n
             *     / \         ==>     / \       ==>       / \
             *    A   n               p   C              p     g
             *       / \             / \                / \   / \
             *      B   C           A   B              A   B C   D
             */ 
            else if( p->right == n && g->left == p ) {
                rbtree_left_rotate( root, p );
                root = rbtree_right_rotate( root, g );
                n->color = BLACK;
                g->color = RED;
                break;
            }            
        } else return root;
    }

    return root;
}

/*
 * Implementation of rb-tree inserting balance algorithm by pattern.
 * None recursion.
 */
static inline struct _node*
rbtree_insert_balance_by_pattern( struct _node *root, struct _node *new_node )
{
    struct _node *n = new_node;
    struct _node *g = NULL;

    while( ( g = rbtree_get_grandparent_node( n ) ) != NULL) {
        struct _node *p = n->parent;
        if( n->color == RED && p->color == RED ) {
            /* 
             *           *g
             *           / \
             *         p    D    RR         p
             *        / \        ==>       / \
             *      n    C              *n    *g
             *     / \                  / \   / \
             *    A   B                A   B C   D
             */
            if( p->left == n && g->left == p ) {
                root = rbtree_right_rotate( root, g );
                n->color    = BLACK;
                n = p;
            }
            /*
             *       *g                *g
             *       / \               / \
             *      A   p      RR     A   n      LR          n
             *         / \     ==>       / \     ==>        / \
             *        n   D             B   p            *g    *p
             *       / \                   / \           / \   / \
             *      B   C                 C   D         A   B C   D
             */            
            else if( p->left == n && g->right == p ) { 
                rbtree_right_rotate( root, p );
                root = rbtree_left_rotate( root, g );
                p->color    = BLACK;
            }
            /* 
             *     *g
             *     / \
             *    A   p        LR           p
             *       / \       ==>         / \
             *      B   n               *g    *n
             *         / \              / \   / \
             *        C   D            A   B C   D
             */            
            else if( p->right == n && g->right == p ) {
                root = rbtree_left_rotate( root, g );
                n->color    = BLACK;
                n = p;
            }
            /* 
             *       *g                  *g
             *       / \                 / \
             *      p   D      LR       n   D    RR         n
             *     / \         ==>     / \       ==>       / \
             *    A   n               p   C             *p    *g
             *       / \             / \                / \   / \
             *      B   C           A   B              A   B C   D
             */             
            else {
                rbtree_left_rotate( root, p );
                root = rbtree_right_rotate( root, g );
                p->color    = BLACK;
            }
            root->color = BLACK;
        } else return root;
    }
    
    return root;
}

/*
 * Implementation of rb-tree deleting balance algorithm by pattern.
 * None recursion.
 */
static inline struct _node * 
rbtree_delete_belance_by_pattern( struct _node *root, struct _node *node ) 
{
    struct _node *d = node;

    if( d->color == BLACK )
        d->color = D_BLACK;

    while( d->color == D_BLACK ) {
        struct _node *p = node->parent;
        struct _node *s = rbtree_get_sibling_node( d );
        assert( NULL != s );

        if( NULL == p ) {
            d->color = BLACK;
            break;
        }

        if( p->left == d ) { 
            /*      *p                 *s      
             *      / \       LR       / \     
             *   **d    s     ==>     p   *c    
             *         / \           / \   
             *       *b   *c      **d   *b  
             */                
            if( s->color == RED ) {
                root = rbtree_left_rotate( root, s );
                p->color    = RED;
                s->color    = BLACK;
            }
            /*
             *       p               p       
             *      / \             / \                      l
             *   **d  *s    RR   **d   l       LR         / \
             *        / \   ==>        / \     ==>       *p   *s
             *       l   a            c  *s              / \  / \
             *      / \                  / \           *d   c b  a 
             *     c   b                b   a
             */
            else if( s->left != NULL && s->left->color == RED ) {
                rbtree_right_rotate( root, s );
                root = rbtree_left_rotate( root, p );
                d->color    = BLACK;
                p->color    = BLACK;
            }
            /*
             *       p              
             *      / \               s
             *   **d  *s    LR       / \
             *        / \   ==>    *p   *r
             *       c   r         / \  / \
             *          / \      *d   c b   a 
             *         b   a
             */  
            else if( s->right != NULL && s->right->color == RED ) {
                root = rbtree_left_rotate( root, p );
                d->color        = BLACK;
                p->color        = BLACK;
                s->right->color = BLACK;               
            }
            /*       p                *p      
             *      / \               / \     
             *   **d   *s     ==>   *d    s    
             *        /  \               / \   
             *      *b   *c            *b   *c  
             */
            else {
                d->color = BLACK;
                if( p->color == RED )
                    p->color = BLACK;
                else 
                    p->color = D_BLACK;
                s->color = RED;
                d = p;
            }
        } else {
            /*
             *          *p              *s
             *          / \      RR     / \
             *         s  **d    ==>  *a    p   
             *        / \                  / \
             *      *a  *b               *b  **d 
             */
            if( s->color == RED ) {
                root = rbtree_right_rotate( root, p );
                p->color = RED;
                s->color = BLACK;
            }
            /*
             *         p                   
             *        / \                s
             *      *s  **d   RR        / \
             *      / \       ==>     *l    *p
             *     l   c              / \   / \
             *    / \                a   b c   *d 
             *   a   b
             */              
            else if( s->left != NULL && s->left->color == RED ) {
                root = rbtree_right_rotate( root, p );
                d->color       = BLACK;              
                p->color       = BLACK;
                s->left->color = BLACK;
            }
            /*
             *         p                  p         
             *        / \                / \               r
             *      *s  **d   LR        r  **d  RR        / \
             *      / \       ==>      / \      ==>    *s    *p
             *     a   r             *s   c            / \   / \
             *        / \            / \              a   b c   *d 
             *       b   c          a   b
             */              
            else if( s->right != NULL && s->right->color == RED ) {
                rbtree_left_rotate( root, s );
                root = rbtree_right_rotate( root, p );
                d->color = BLACK;
                p->color = BLACK;
            }
            /*
             *           p              *p
             *          / \             / \
             *        *s  **d    ==>   s   *d
             *        / \             / \
             *      *a  *b          *a  *b 
             */            
            else {
                d->color = BLACK;
                if( p->color == RED )
                    p->color = BLACK;
                else 
                    p->color = D_BLACK;
                s->color = RED;
                d = p;
            }
        }
        root->color = BLACK;
    }
    return root;
}

/*
 * Destorys a tree.
 */
static inline void
rbtree_destory_internal( struct _node *node ) {
    if( NULL == node ) {
        return;
    }

    rbtree_destory_internal( node->left );
    rbtree_destory_internal( node->right );
    
    rbtree_free_node( node );
}

RBTree *  
rbtree_create()
{
    RBTree *tree = (RBTree *)malloc( sizeof( RBTree ) );
    if( NULL == tree )
        return NULL;
    
    tree->root = NULL;
    tree->size = 0;

    return tree;
}

void
rbtree_destory( RBTree *tree ) {
    if( NULL == tree )
        return;
    rbtree_destory_internal( tree->root );

    free( tree );
}

int 
rbtree_insert( RBTree *tree, char *key, void *data )
{
    if( NULL == tree )
        return -1;

    if( NULL == tree->root ) {
        tree->root = rbtree_create_node( key, data );
        if( NULL == tree->root )
            return -1;
        tree->root->color = BLACK;
        ++tree->size;
        return 0;
    }

    struct _node *node = tree->root;
    while( TRUE ) {
        int c = strcmp( key, node->key );
        if( 0 == c ) {
            free( node->key );
            free( node->data );
            node->key = key;
            node->data = data;
            break;
        } else if( 0 < c ) {
            if( NULL != node->right ) {
                node = node->right;
                continue;
            }

            node->right = rbtree_create_node( key, data );
            node->right->parent = node;
            ++tree->size;
            node = node->right;
            break;
        } else {
            if( NULL != node->left ) {
                node = node->left;
                continue;
            }

            node->left = rbtree_create_node( key, data );
            node->left->parent = node;
            ++tree->size;
            node = node->left;
            break;
        }
    }

    tree->root = rbtree_insert_balance_by_CLRS( tree->root, node );
    return 0;
}

int 
rbtree_remove( RBTree *tree, char *key )
{
    if( NULL == tree && NULL == tree->root )
        return -1;

    struct _node *node = rbtree_find_node_by_key( tree->root, key );
    if( NULL == node )
        return -1;

    if( 1 == tree->size  ) {
        assert( tree->root == node );
        rbtree_free_node( tree->root );
        tree->root = NULL;
        --tree->size;
        return 0;
    }

    while( TRUE ) {
        struct _node *p = node->parent;
        if( NULL == node->left) { 

            tree->root = rbtree_delete_belance_by_pattern( tree->root, node );

            if( NULL == node->right ) { 
                assert( p != NULL );
                if( p->left == node )
                    p->left = NULL;
                else
                    p->right = NULL;
            } else {
                if( NULL == p ) { 
                    tree->root = node->right;
                    tree->root->parent = NULL;
                } else if( p->left == node ) {
                    p->left = node->right;
                    p->left->parent = p;
                } else {
                    p->right = node->right;
                    p->right->parent = p;
                }
            }
            break;
        } else if( NULL == node->right ) {

            tree->root = rbtree_delete_belance_by_pattern( tree->root, node );

            if( NULL == p ) { 
                tree->root = node->left;
                tree->root->parent = NULL;
            } else if( p->left == node ) {
                p->left = node->left;
                p->left->parent = p;
            } else {
                p->right = node->left;
                p->right->parent = p;
            }
            rbtree_free_node( node );
            break;
        } else {
            struct _node *tmp = rbtree_get_next_node( node );
            assert( tmp->parent != NULL );
            free( node->key );
            free( node->data );
            node->key  = tmp->key;
            node->data = tmp->data;
            tmp->key   = NULL;
            tmp->data  = NULL;
            node       = tmp;
        }
    }

    rbtree_free_node( node );
    --tree->size;
    return 0;
}

void * 
rbtree_find_by_key( RBTree *tree, char *key ) 
{
    if( NULL == tree )
        return NULL;

    struct _node *node = rbtree_find_node_by_key( tree->root, key );
    if( NULL == node )
        return NULL;

    return node->data;
}

int 
rbtree_get_size( RBTree *tree )
{
    if( NULL == tree ) 
        return -1;

    return tree->size;
}

char * 
rbtree_get_first_key( RBTree *tree ) 
{
    if( NULL == tree )
        return NULL;
    
    struct _node *node = rbtree_get_first_node( tree->root );
    if( NULL == node )
        return NULL;
    
    return node->key;
}

char * 
rbtree_get_last_key( RBTree *tree )
{
    if( NULL == tree )
        return NULL;

    struct _node *node = rbtree_get_last_node( tree->root );
    if( NULL == node )
        return NULL;

    return node->key;
}

void 
rbtree_foreach( RBTree *tree, rbtree_foreach_callback fun, void *udata )
{
    struct _node *node = rbtree_get_first_node( tree->root );
    while( node != NULL ) {
        fun( node->key, node->data, udata );
        node = rbtree_get_next_node( node );
    }
}