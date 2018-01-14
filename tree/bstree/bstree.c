#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include <string.h>
#include <assert.h>
#include "bstree.h"

struct _bstree {
    struct _node*   root;
    int             size;
};

struct _node {
    struct _node*   left;
    struct _node*   right;
    struct _node*   parent;
    char*           key;
    void*           data;
};

// 创建新的节点
static inline struct _node* 
bstree_create_node( char* key, void* data )
{
    struct _node *node = (struct _node*)malloc( sizeof( struct _node ));
    if( NULL == node )
        return NULL;

    node->left = node->right = node->parent =  NULL;
    node->key = key;
    node->data = data;

    return node;
}

// 释放节点
static inline void 
bstree_free_node( struct _node *node )
{
    if( NULL == node )
        return;

    free( node->key );
    free( node->data );
    free( node );
}

// 获得第一个节点
static inline struct _node*
bstree_get_first_node( struct _node* root ) 
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
bstree_get_last_node( struct _node* root )
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
bstree_get_prev_node( struct _node* node )
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
    
    return bstree_get_last_node( node->left );
}

// 获得后继节点
static inline struct _node*
bstree_get_next_node( struct _node* node )
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

    return bstree_get_first_node( node->right );
}

// 根据key值寻找节点
static inline struct _node*
bstree_find_node_by_key( struct _node* root, char* key )
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

BSTree* 
bstree_create()
{
    BSTree* tree = (BSTree*)malloc( sizeof( BSTree ) );
    if( NULL == tree )
        return NULL;
    
    tree->root = NULL;
    tree->size = 0;

    return tree;
}

int bstree_insert( BSTree* tree, char* key, void* data )
{
    if( NULL == tree )
        return -1;

    if( NULL == tree->root ) {
        tree->root = bstree_create_node( key, data );
        if( NULL == tree->root )
            return -1;
        ++tree->size;
        return 0;
    }

    struct _node *node = tree->root;
    while( 1 ) {
        int c = strcmp( key, node->key );
        if( 0 == c ) {
            free( node->key );
            free( node->data );
            node->key = key;
            node->data = data;
            return 0;
        } else if( 0 < c ) {
            if( NULL != node->right ) {
                node = node->right;
                continue;
            }

            node->right = bstree_create_node( key, data );
            node->right->parent = node;
            ++tree->size;
            return 0;
        } else {
            if( NULL != node->left ) {
                node = node->left;
                continue;
            }

            node->left = bstree_create_node( key, data );
            node->left->parent = node;
            ++tree->size;
            return 0;
        }
    }

    return -1;
}

int bstree_remove( BSTree *tree, char *key )
{
    if( NULL == tree && NULL == tree->root )
        return -1;

    struct _node* node = bstree_find_node_by_key( tree->root, key );
    if( NULL == node )
        return -1;

    if( 1 == tree->size  ) {
        assert( tree->root == node );
        bstree_free_node( tree->root );
        tree->root = NULL;
        --tree->size;
        return 0;
    }

    struct _node* p = node->parent;

    if( NULL == node->left) { // 先判断左子树空
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
    } else if( NULL == node->right ) { // 右子树为空
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
    } else { // 左右子树都不为空
        struct _node* tmp = bstree_get_next_node( node );
        assert( tmp->parent != NULL );

        // 这个节点不可能存在左子树。
        if( tmp->parent->left == tmp ) {  // 在左子树上
            tmp->parent->left = tmp->right;
            if( NULL != tmp->right ) // 右子树不为空
                tmp->right->parent = tmp->parent;
            tmp->left = node->left;
            tmp->left->parent = tmp;
            tmp->right = node->right;
            tmp->right->parent = tmp;
            tmp->parent = p;
        } else { // 在右子树上，只能是带删除节点的右子树。
            tmp->left = node->left;
            tmp->parent = p;
        }

        if( NULL == p )
            tree->root = tmp;
    }

    bstree_free_node( node );
    --tree->size;
    return 0;
}

void* bstree_find_by_key( BSTree* tree, char* key ) 
{
    if( NULL == tree )
        return NULL;

    struct _node* node = bstree_find_node_by_key( tree->root, key );
    if( NULL == node )
        return NULL;

    return node->data;
}

int bstree_get_size( BSTree* tree )
{
    if( NULL == tree ) 
        return -1;

    return tree->size;
}

char* bstree_get_first_key( BSTree* tree ) 
{
    if( NULL == tree )
        return NULL;
    
    struct _node* node = bstree_get_first_node( tree->root );
    if( NULL == node )
        return NULL;
    
    return node->key;
}

char* bstree_get_last_key( BSTree* tree )
{
    if( NULL == tree )
        return NULL;

    struct _node* node = bstree_get_last_node( tree->root );
    if( NULL == node )
        return NULL;

    return node->key;
}

int main( int argc, char* argv[] )
{
    BSTree *tree = bstree_create();
    bstree_insert( tree, strdup("5"), strdup("五") );
    bstree_insert( tree, strdup("2"), strdup("二") );
    bstree_insert( tree, strdup("1"), strdup("一") );
    bstree_insert( tree, strdup("4"), strdup("四") );
    bstree_insert( tree, strdup("3"), strdup("三") );
    bstree_insert( tree, strdup("9"), strdup("九") );
    bstree_insert( tree, strdup("7"), strdup("七") );
    bstree_insert( tree, strdup("8"), strdup("八") );
    bstree_insert( tree, strdup("6"), strdup("六") );
    printf( "node count: %d\n", bstree_get_size( tree ) );
    printf( "first key is: %s\n", bstree_get_first_key( tree ) );
    printf( "last key is: %s\n", bstree_get_last_key( tree ) );

    struct _node* node = bstree_get_first_node( tree->root );
    while( NULL != node ) {
        printf( "key: %s, data: %s\n", node->key, (char*)node->data );
        node = bstree_get_next_node( node );
    }

    void* data = bstree_find_by_key( tree, "3" );
    printf( "key=3 and data is: %s\n", (char*)data );

    printf( "--------------------------------\n" );

    bstree_insert( tree, strdup("5"), strdup("五") );
    bstree_insert( tree, strdup("8"), strdup("八") );
    printf( "node count: %d\n", bstree_get_size( tree ) );
    printf( "first key is: %s\n", bstree_get_first_key( tree ) );
    printf( "last key is: %s\n", bstree_get_last_key( tree ) );

    node = bstree_get_first_node( tree->root );
    while( NULL != node ) {
        printf( "key: %s, data: %s\n", node->key, (char*)node->data );
        node = bstree_get_next_node( node );
    }

    printf( "--------------------------------\n" );
    bstree_remove( tree, "5" );
    node = bstree_get_first_node( tree->root );
    while( NULL != node ) {
        printf( "key: %s, data: %s\n", node->key, (char*)node->data );
        node = bstree_get_next_node( node );
    }

    printf( "--------------------------------\n" );
    bstree_remove( tree, "6" );
    node = bstree_get_first_node( tree->root );
    while( NULL != node ) {
        printf( "key: %s, data: %s\n", node->key, (char*)node->data );
        node = bstree_get_next_node( node );
    }

    printf( "--------------------------------\n" );
    bstree_remove( tree, "9" );
    node = bstree_get_first_node( tree->root );
    while( NULL != node ) {
        printf( "key: %s, data: %s\n", node->key, (char*)node->data );
        node = bstree_get_next_node( node );
    }

    return 0;
}