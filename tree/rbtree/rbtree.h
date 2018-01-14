#ifndef __rbtree_H__
#define __rbtree_H__

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _rbtree RBTree;
typedef void (*rbtree_foreach_callback)( char* key, void* data );

RBTree* rbtree_create();
void rbtree_destory( RBTree* tree );
int rbtree_get_size( RBTree* tree );
int rbtree_insert( RBTree* tree, char* key, void* data );
int rbtree_remove( RBTree* tree, char* key );
char* rbtree_get_first_key( RBTree* tree );
char* rbtree_get_last_key( RBTree* tree );
void* rbtree_find_by_key( RBTree* tree, char* key );
void rbtree_foreach( RBTree* tree, rbtree_foreach_callback fun );

#ifdef __cplusplus
}
#endif

#endif