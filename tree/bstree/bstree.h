#ifndef __BSTREE_H__
#define __BSTREE_H__

#ifdef __cplusplus
extern "C" {
#endif

struct bs_tree *bstree_create();
void bstree_destory(struct bs_tree* tree);
int bstree_insert(struct bs_tree *tree, int key);
int bstree_insert_recursion(struct bs_tree *tree, int key);
int bstree_remove(struct bs_tree *tree, int key);
int bstree_find_by_key(const struct bs_tree *tree, int key);
struct bs_node *bstree_get_first(const struct bs_tree *tree);
struct bs_node *bstree_get_last(const struct bs_tree *tree);
struct bs_node *bstree_get_next(const struct bs_node *node);
struct bs_node *bstree_get_prev(const struct bs_node *node);
int bstree_get_node_key(const struct bs_node *node);

#define bstree_for_each(tree, node)     \
    for (node = bstree_get_first(tree); \
         node;                          \
         node = bstree_get_next(node))

#ifdef __cplusplus
}
#endif

#endif