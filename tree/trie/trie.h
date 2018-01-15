#ifndef __TRIE_H__
#define __TRIE_H__

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _trie Trie;

Trie * trie_create();
int trie_insert( Trie *trie, int key, void *data );
void * trie_find( Trie *trie, int key );

#ifdef __cplusplus
}
#endif

#endif