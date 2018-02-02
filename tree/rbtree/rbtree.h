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

#ifndef __rbtree_H__
#define __rbtree_H__

#ifdef __cplusplus
extern "C" {
#endif

/** rb-tree type define。 */
typedef struct _rbtree RBTree;

/** 
 * Iterator callback function.
 * 
 * @param key   A key of a rb-tree node.
 * @param data  The data corresponding to the key.
 * @param udata User data passed to @see rbtree_foreach().
 */
typedef void (*rbtree_foreach_callback)(char *key, void *data, void *udata);

/**
 * Create a new rb-tree.
 * 
 * @return Successed return a new rb-tree object, otherwise return NULL.
 */
RBTree *rbtree_create();

/**
 * Destroy a rb-tree, removes all keys and datas.
 * 
 * @param tree  rb-tree object.
 */
void rbtree_destory(RBTree *tree);

/**
 * Gets the number of nodes in a rb-tree.
 * 
 * @param tree  A rb-tree object.
 * @return      The number of nodes in rb-tree.
 */
int rbtree_get_size(RBTree *tree);

/**
 * Inserts a key/value pair into a rb-tree.
 * This function would maintain the memory which used by key and value,
 * so you must dump them befor passed.
 * 
 * @param tree  A rb-tree object.
 * @param key   The key to insert.
 * @param data  The data corresponding to the key.
 * @return      Successful return 0, otherwise return -1.
 */
int rbtree_insert(RBTree *tree, char *key, void *data);

/**
 * Removes a key/value pair from a rb-tree.
 * This function would free the memory which used for key and data.
 * 
 * @param tree  A rb-tree object.
 * @param key   The key to remove.
 * @return      Successful return 0, otherwise return -1.
 */
int rbtree_remove(RBTree *tree, char *key);

/**
 * Gets minimal key in rb-tree.
 * 
 * @param tree  A rb-tree object。
 * @return      Successful return the minimal key, otherwise return NULL 
 *              because the rb-tree was empty usually.
 */
char *rbtree_get_first_key(RBTree *tree);

/**
 * Gets maximal key in rb-tree.
 * 
 * @param tree  A rb-tree object.
 * @return      Successful return the maximal key, otherwise return NULL
 *              because the rb-tree was empty usually.
 */
char *rbtree_get_last_key(RBTree *tree);

/**
 * Looikng for data corresponding to the key.
 * 
 * @param tree  A rb-tree object.
 * @param key   The key to search.
 * @return      Successful return the data corresponding to the key.
 *              Otherwise return NULL.
 */
void *rbtree_find_by_key(RBTree *tree, char *key);

/**
 * Accesses all nodes in rb-tree in middle order.
 * 
 * @param tree  A rb-tree object.
 * @param fun   Iteraotr callback function.
 * @param udata User data to passed to function.
 */
void rbtree_foreach(RBTree *tree, rbtree_foreach_callback fun, void *udata);

#ifdef __cplusplus
}
#endif

#endif