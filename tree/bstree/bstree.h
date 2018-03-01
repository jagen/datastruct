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
struct bs_node *bstree_get_first_postorder(const struct bs_tree *tree);
struct bs_node *bstree_get_next_postorder(const struct bs_node *node);
int bstree_get_node_key(const struct bs_node *node);

#define bstree_for_each(tree, node)     \
    for (node = bstree_get_first(tree); \
         node;                          \
         node = bstree_get_next(node))

#define bstree_for_each_reverse(tree, node) \
    for (node = bstree_get_last(tree);      \
         node;                              \
         node = bstree_get_prev(node))

#define bstree_postorder_for_each(tree, node)       \
    for (node = bstree_get_first_postorder(tree);   \
         node;                                      \
         node = bstree_get_next_postorder(node))
        
#define bstree_postorder_for_each_reverse(tree, node)   \
    for (node = tree->root;                             \
         node;                                          \
         node = bstree_get_prev_postorder(node))

#ifdef __cplusplus
}
#endif

#endif