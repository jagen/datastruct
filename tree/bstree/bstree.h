#ifndef __BSTREE_H__
#define __BSTREE_H__

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _bstree BSTree;

BSTree* bstree_create();
void bstree_destory( BSTree* tree );
int bstree_get_size( BSTree* tree );
int bstree_insert( BSTree* tree, char* key, void* data );
int bstree_remove( BSTree* tree, char* key );
char* bstree_get_first_key( BSTree* tree );
char* bstree_get_last_key( BSTree* tree );
void* bstree_find_by_key( BSTree* tree, char* key );

#ifdef __cplusplus
}
#endif

#endif