#ifndef __BSTREE_H__
#define __BSTREE_H__

#ifdef __cplusplus
extern "C" {
#endif

struct bstree *bstree_create();
void bstree_destory(struct bstree* tree);
int bstree_insert(struct bstree *tree, int key);
int bstree_insert_recursion(struct bstree *tree, int key);
int bstree_remove(struct bstree *tree, int key);
int bstree_find_by_key(const struct bstree *tree, int key);
struct bsnode *bstree_get_first(const struct bstree *tree);
struct bsnode *bstree_get_last(const struct bstree *tree);
struct bsnode *bstree_get_next(const struct bsnode *node);
struct bsnode *bstree_get_prev(const struct bsnode *node);
int bstree_get_node_key(const struct bsnode *node);

#define bstree_for_each(tree, node)     \
    for (node = bstree_get_first(tree); \
         node;                          \
         node = bstree_get_next(node))

#ifdef __cplusplus
}
#endif

#endif