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
#ifndef __B_TREE_H__
#define __B_TREE_H__

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _btree BTree;

/**
 * Create a new B-Tree object.
 * 
 * @param degreem   Minimum number of children of every non-leaf node，
 *                  except for root node.
 */
BTree * btree_create( int degree );

/**
 * Insert a new key into the B-Tree obejct.
 * This function would maintain the memory which used by key,
 * so you must dump it befor passed.
 * 
 * @param tree  The B-Tree object.
 * @return      Successful return 0, otherwise return -1.
 */
int btree_insert( BTree *tree, char *key );

/**
 * Remove a key from the B-Tree object.
 * This function would free the memory which used by key.
 * 
 * @param tree  The B-Tree object.
 * @return      Successful return 0, otherwise return -1;
 */
int btree_remove( BTree *tree, char *key );

/**
 * Find key in the B-Tree object.
 * 
 * @param tree  The B-Tree object.
 * @return      If the key exist in the B-Tree would return 0, 
 *              otherwise return -1.
 */
int btree_search( BTree *tree, char *key );

#ifdef __cplusplus
}
#endif

#endif