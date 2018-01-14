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

struct _rbtree {
    struct _node*   root;
    int             size;
};

struct _node {
    struct _node*   left;
    struct _node*   right;
    struct _node*   parent;
    int             color;
    char*           key;
    void*           data;
};

// 创建新的节点
static inline struct _node* 
rbtree_create_node( char* key, void* data )
{
    struct _node *node = (struct _node*)malloc( sizeof( struct _node ));
    if( NULL == node )
        return NULL;

    node->left = node->right = node->parent =  NULL;
    node->color = RED;
    node->key = key;
    node->data = data;

    return node;
}

// 释放节点
static inline void 
rbtree_free_node( struct _node *node )
{
    if( NULL == node )
        return;

    free( node->key );
    free( node->data );
    free( node );
}

// 获取兄弟节点
static inline struct _node* 
rbtree_get_sibling_node( struct _node* node )
{
    if( NULL == node ) return NULL;

    struct _node* p = node->parent;
    if( NULL == p ) return NULL;

    return p->left == node ? p->right : p->right;
}

// 获得祖父节点
static inline struct _node*
rbtree_get_grandparent_node( struct _node* node )
{
    if( NULL == node ) return NULL;
    struct _node* p = node->parent;
    return NULL == p ? NULL : p->parent;
}

// 获得叔叔节点
static inline struct _node*
rbtree_get_uncle_node( struct _node* node )
{
    if( NULL == node ) return NULL;
    return rbtree_get_sibling_node( node->parent );
}

// 获得第一个节点
static inline struct _node*
rbtree_get_first_node( struct _node* root ) 
{
    struct _node* node = root;
    if( NULL == node )
        return NULL;

    while(node->left) {
        node = node->left;
    }
    return node;
}

// 获得最后一个节点
static inline struct _node*
rbtree_get_last_node( struct _node* root )
{   
    struct _node* node = root;
    if( NULL == node )
        return NULL;

    while( node->right ) {
        node = node->right;
    }
    return node;
}

// 获得前继节点
static inline struct _node*
rbtree_get_prev_node( struct _node* node )
{
    if( NULL == node )
        return NULL;
    
    if( NULL == node->left ) {
        while( NULL != node->parent ) {
            struct _node *p = node->parent;
            if( p->left == node ) {
                node = p;
                continue;
            } else {
                return p;
            }
        }
        return NULL;
    }
    
    return rbtree_get_last_node( node->left );
}

// 获得后继节点
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

// 根据key值寻找节点
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

// 按照模式匹配方式进行插入时的红黑树平衡算法
// 非递归方式实现
static inline struct _node*
rbtree_insert_balance_by_pattern( struct _node* root, struct _node* new_node )
{
    struct _node *x = NULL, *y = NULL, *z = NULL;

    while( new_node->parent != NULL && new_node->parent->parent != NULL) {
        struct _node *p = new_node->parent;
        if( p->left == new_node ) { // 在左子树插入
            /* 
             *           *z
             *           / \
             *         y    D               y
             *        / \        ==>       / \
             *      x    C              *x    *z
             *     / \                  / \   / \
             *    A   B                A   B C   D
             */
            if( p->parent->left == p ) { 
                x = new_node;
                y = p;
                z = p->parent;
                if( z->color == BLACK && x->color == RED && y->color == RED ) {
                    y->parent = z->parent;
                    z->parent = y;
                    z->left   = y->right;
                    y->right  = z;
                    if( z->left != NULL )
                        z->left->parent = z;
                    x->color  = BLACK;
                    if( NULL == y->parent ) { //调整结束，需要变更根节点
                        y->color = BLACK;
                        return y;
                    } else {
                        if( y->parent->left == z )
                            y->parent->left = y;
                        else 
                            y->parent->right = y;
                    }
                } else return root;
            }
            /*
             *       *x
             *       / \      
             *      A    z                  y
             *          / \      ==>       / \
             *        y    D            *x    *z
             *       / \                / \   / \
             *      B   C              A   B C   D
             */
            else {
                y = new_node;
                z = p;
                x = p->parent;
                if( x->color == BLACK && y->color == RED && z->color == RED ) {
                    y->parent = x->parent;
                    x->parent = y;
                    x->right  = y->left;
                    if( x->right != NULL )
                        x->right->parent = x;
                    y->left   = x;
                    z->parent = y;
                    z->left   = y->right;
                    if( z->left != NULL )
                        z->left->parent = z;
                    y->right  = z;
                    z->color  = BLACK;
                    if( NULL == y->parent ) {
                        y->color = BLACK;
                        return y;
                    } else {
                        if( y->parent->left == x ) 
                            y->parent->left = y;
                        else
                            y->parent->right = y;
                    }
                } else return root;
            }
        } else { 
            /* 
             *     *x
             *     / \
             *    A   y                     y
             *       / \         ==>       / \
             *      B   z               *x    *z
             *         / \              / \   / \
             *        C   D            A   B C   D
             */
            if( p->parent->right == p ) {
                z = new_node;
                y = p;
                x = p->parent;
                if( x->color == BLACK && y->color == RED && z->color == RED ) {
                    y->parent = x->parent;
                    x->parent = y;
                    x->right  = y->left;
                    if( x->right != NULL )
                        x->right->parent = x;
                    y->left   = x;
                    z->color  = BLACK;
                    if( NULL == y->parent ) {
                        y->color = BLACK;
                        return y;
                    } else {
                        if( y->parent->left == x )
                            y->parent->left = y;
                        else 
                            y->parent->right = y;
                    }
                } else return root;
            }
            /* 
             *       *z
             *       / \
             *      x   D                   y
             *     / \           ==>       / \
             *    A   y                 *x    *z
             *       / \                / \   / \
             *      B   C              A   B C   D
             */
            else {
                y = new_node;
                x = p;
                z = p->parent;
                if( z->color == BLACK && x->color == RED && y->color == RED ) {
                    y->parent = z->parent;
                    z->parent = y;
                    z->left   = y->right;
                    if( z->left != NULL )
                        z->left->parent = z;
                    y->right  = z;
                    x->right  = y->left;
                    if( x->right != NULL )
                        x->right->parent = x;
                    y->left   = x;
                    x->parent = y;
                    x->color  = BLACK;
                    if( NULL == y->parent ) {
                        y->color = BLACK;
                        return y;
                    } else {
                        if( y->parent->left == z )
                            y->parent->left = y;
                        else 
                            y->parent->right = y;
                    }
                } else return root;
            }
        }

        new_node = y; // 继续调整
    }
    
    return root;
}

// 按照模式匹配方式进行删除时的红黑树平衡算法
// 非递归方式实现
static inline struct _node* 
rbtree_delete_belance_by_pattern( struct _node* root, struct _node* node ) 
{
    struct _node *x = NULL, *y = NULL, *z = NULL;

    if( node->color == BLACK )
        node->color = D_BLACK;

    while( node->color == D_BLACK ) {
        struct _node *p = node->parent;

        if( NULL == p) { // 达到根节点，调整完毕
            node->color = BLACK;
            break;
        }

        if( p->left == node && p->right != NULL ) {
            x = p; 
            y = x->right;

            if( (y->left == NULL || y->left->color == BLACK)
                && (y->right == NULL || y->right->color == BLACK ) ) {
                /*       x                *x      
                 *      / \               / \     
                 *   **a   *y     ==>    *a   y    
                 *        /  \               / \   
                 *      *b   *c            *b   *c  
                 */
                if( y->color == BLACK ) {
                    node->color = BLACK;
                    if( x->color == RED ) 
                        x->color = BLACK;
                    else {
                        x->color = D_BLACK;
                        node = x;
                    }
                    y->color = RED;
                }                 
                /*      *x                 *y      
                 *      / \                / \     
                 *   **a    y     ==>     x   *c    
                 *         / \           / \   
                 *       *b   *c      **a   *b  
                 */                
                else {
                    x->right  = y->left;
                    if( x->right != NULL )
                        x->right->parent = x;
                    y->left   = x;
                    y->parent = x->parent;
                    y->color  = BLACK;
                    x->parent = y;
                    x->color  = RED;
                    if( y->parent != NULL ) {
                        if( y->parent->left == x )
                            y->parent->left = y;
                        else
                            y->parent->right = y;
                    } else 
                        root = y;
                }
            }
            /*
             *       x                   
             *      / \                   y
             *   **a  *z                 / \
             *        / \     ==>     *x    *z
             *       y   d            / \   / \
             *      / \             *a   b c   d 
             *     b   c
             */ 
            else if( y->left != NULL && y->left->color == RED ) {
                z = y;
                y = z->left;

                node->color = BLACK;
                x->right  = y->left;
                if( x->right != NULL )
                    x->right->parent = x;
                y->right  = x;
                y->parent = x->parent;
                x->color  = BLACK;
                z->left   = y->right;
                if( z->left != NULL )
                    z->left->parent = z;
                y->right  = z;
                z->parent = y;
                if( y->parent != NULL ) {
                    if( y->parent->left == x )
                        y->parent->left = y;
                    else
                        y->parent->right = y;
                } else 
                    root = y;
            }
            /*
             *       x                   
             *      / \                   y
             *   **a  *y                 / \
             *        / \     ==>      *x    *z
             *       b   z            / \   / \
             *          / \         *a   b c   d 
             *         c   d
             */             
            else if( y->right != NULL && y->right->color == RED ) {
                z = y->right;

                node->color = BLACK;
                x->right = y->left;
                if( x->right != NULL )
                    x->right->parent = x;
                y->left   = x;
                y->parent = x->parent;
                x->parent = y;
                z->color  = BLACK;
                x->color  = BLACK;
                if( y->parent != NULL ) {
                    if( y->parent->left == x )
                        y->parent->left = y;
                    else 
                        y->parent->right = y;
                } else 
                    root = y;
            }
        }
        else if( p->right == node && p->left != NULL ) {
            y = p;
            x = y->left;
            if( ( x->left == NULL || x->left->color == BLACK )
                && ( x->right == NULL || x->right->color == BLACK ) ) {
                /*
                 *           y              *y
                 *          / \             / \
                 *        *x  **c    ==>   x   *c
                 *        / \             / \
                 *      *a  *b          *a  *b 
                 */
                if( x->color == BLACK ) {
                    node->color = BLACK;
                    if( y->color == RED ) {
                        y->color = BLACK;
                    } else {
                        y->color = D_BLACK;
                        node = x;
                    }
                    x->color = RED;
                } 
                /*
                 *          *y              *x
                 *          / \             / \
                 *         x  **c    ==>  *a    y   
                 *        / \                  / \
                 *      *a  *b               *b  **c 
                 */
                else {
                    y->left   = x->right;
                    if( y->left != NULL )
                        y->left->parent = y;
                    x->right  = y;
                    x->parent = y->parent;
                    y->parent = x;
                    y->color  = RED;
                    x->color  = BLACK;
                    if( x->parent != NULL ) {
                        if( x->parent->left == y )
                            x->parent->left = x;
                        else
                            x->parent->right = x;
                    } else
                        root = x;
                }
            } 
            /*
             *         z                   
             *        / \                 y
             *      *x  **d              / \
             *      / \       ==>      *x    *z
             *     a   y              / \   / \
             *        / \            a   b c   *d 
             *       b   c
             */              
            else if ( x->right != NULL && x->right->color == RED  ) {
                z = y;
                y = x->right;
                
                node->color = BLACK;
                y->parent = z->parent;
                z->left   = y->right;
                if( z->left != NULL )
                    z->left->parent = z;
                z->parent = y;
                z->color  = BLACK;
                y->right  = z;
                x->right  = y->left;
                if( x->right != NULL )
                    x->right->parent = x;
                x->parent = y;
                y->left   = x;

                if( y->parent != NULL ) {
                    if( y->parent->left == z )
                        y->parent->left = y;
                    else 
                        y->parent->right = y;
                } else 
                    root = y;
            } 
            /*
             *         z                   
             *        / \                y
             *      *y  **d             / \
             *      / \       ==>     *x    *z
             *     x   c              / \   / \
             *    / \                a   b c   *d 
             *   a   b
             */  
            else if ( x->left != NULL && x->left->color == RED ) {
                z = y;
                y = x;
                x = y->left;

                node->color = BLACK;
                y->parent = z->parent;
                z->left   = y->right;
                if( z->left != NULL )
                    z->left->parent = z;
                z->parent = y;
                y->right  = z;
                z->color  = BLACK;
                x->color  = BLACK;

                if( y->parent != NULL ) {
                    if( y->parent->left == z )
                        y->parent->left = y;
                    else 
                        y->parent->right = y;
                } else 
                    root = y;
            }
        }
    }
    return root;
}

RBTree* 
rbtree_create()
{
    RBTree* tree = (RBTree*)malloc( sizeof( RBTree ) );
    if( NULL == tree )
        return NULL;
    
    tree->root = NULL;
    tree->size = 0;

    return tree;
}

int rbtree_insert( RBTree* tree, char* key, void* data )
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

    tree->root = rbtree_insert_balance_by_pattern( tree->root, node );
    return 0;
}

int rbtree_remove( RBTree *tree, char *key )
{
    if( NULL == tree && NULL == tree->root )
        return -1;

    struct _node* node = rbtree_find_node_by_key( tree->root, key );
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
        struct _node* p = node->parent;
        if( NULL == node->left) { // 先判断左子树空
            // 先调整平衡性
            tree->root = rbtree_delete_belance_by_pattern( tree->root, node );

            if( NULL == node->right ) { // 这是一个页节点
                assert( p != NULL );
                if( p->left == node )
                    p->left = NULL;
                else
                    p->right = NULL;
            } else {
                if( NULL == p ) { // 这是根节点
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
        } else if( NULL == node->right ) { // 右子树为空
            // 先调整平衡性
            tree->root = rbtree_delete_belance_by_pattern( tree->root, node );

            if( NULL == p ) { // 这是根节点
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
        } else { // 左右子树都不为空
            struct _node* tmp = rbtree_get_next_node( node );
            assert( tmp->parent != NULL );
            free( node->key );
            free( node->data );
            node->key = tmp->key;
            node->data = tmp->data;
            tmp->key = NULL;
            tmp->data = NULL;
            node = tmp;
        }
    }

    rbtree_free_node( node );
    --tree->size;
    return 0;
}

void* rbtree_find_by_key( RBTree* tree, char* key ) 
{
    if( NULL == tree )
        return NULL;

    struct _node* node = rbtree_find_node_by_key( tree->root, key );
    if( NULL == node )
        return NULL;

    return node->data;
}

int rbtree_get_size( RBTree* tree )
{
    if( NULL == tree ) 
        return -1;

    return tree->size;
}

char* rbtree_get_first_key( RBTree* tree ) 
{
    if( NULL == tree )
        return NULL;
    
    struct _node* node = rbtree_get_first_node( tree->root );
    if( NULL == node )
        return NULL;
    
    return node->key;
}

char* rbtree_get_last_key( RBTree* tree )
{
    if( NULL == tree )
        return NULL;

    struct _node* node = rbtree_get_last_node( tree->root );
    if( NULL == node )
        return NULL;

    return node->key;
}

void rbtree_foreach( RBTree* tree, rbtree_foreach_callback fun )
{
    struct _node *node = rbtree_get_first_node( tree->root );
    while( node != NULL ) {
        fun( node->key, node->data );
        node = rbtree_get_next_node( node );
    }
}