#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "trie.h"

struct _trie
{
    struct _node *root;
    int           size;
};

struct _node 
{
    struct _node *left;
    struct _node *right;
    void         *data;
};

static inline struct _node *
trie_create_node()
{
    struct _node *n = (struct _node *)malloc( sizeof( struct _node ) );
    if( NULL == n ) return NULL;
    
    n->left = n->right = NULL;
    n->data = NULL;

    return n;
}

void
trie_free_node( struct _node *n )
{
    if( NULL == n ) return ;

    if( NULL != n->data )
        free( n->data );

    free( n );
}

Trie *
trie_create()
{
    Trie *t = (Trie *)malloc( sizeof( Trie ) );
    if( NULL == t ) return NULL;

    t->root = trie_create_node();
    if( NULL == t->root ) {
        free( t );
        return NULL;
    }
    t->size = 0;

    return t;
}

int
trie_insert( Trie *trie, int key, void* data )
{
    if( NULL == trie )
        return -1;

    struct _node *n = trie->root;
    
    while( key != 0 ) {
        if( key & 1 ) {
            if( NULL == n->right ) {
                if( ( n->right = trie_create_node() ) == NULL )
                    return -1;
            }
            n = n->right;
        } else {
            if( NULL == n->left ) {
                if( ( n->left = trie_create_node() ) == NULL )
                    return -1;
            }
            n = n->left;
        }
        key = key >> 1;
    }

    if( NULL != n )
        ++trie->size;
        
    free(n->data);
    n->data = data;

    return 0;
}

void *
trie_find( Trie *trie, int key )
{
    if( NULL == trie )
        return NULL;
    
    struct _node *n = trie->root;

    while( key != 0 ) {
        if( key & 1 )
            n = n->right;
        else 
            n = n->left;
        key = key >> 1;
    }

    return n->data;
}

int
main()
{
    Trie *trie = trie_create();
    trie_insert( trie, 1, strdup("a") );
    trie_insert( trie, 4, strdup("b") );
    trie_insert( trie, 5, strdup("c") );
    trie_insert( trie, 9, strdup("d") );

    printf( "find 5 is : %s \n", (char*)trie_find( trie, 5 ) );

    return 0;
}