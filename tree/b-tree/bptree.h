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
#ifndef __BP_TREE__
#define __BP_TREE__

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _bptree bplus_tree_t;
typedef int (*cmp_func)(const void *a, const void *b);
typedef void (*destroy_func)(void *data);

bplus_tree_t *bplus_tree_create(int          max_children,
                                cmp_func     key_cmp_func, 
                                destroy_func key_destroy_func, 
                                destroy_func data_destroy_func);

void bplus_tree_destroy(bplus_tree_t *tree);
int bplus_tree_insert(bplus_tree_t *tree, void *key, void *data);
void *bplus_tree_remove(bplus_tree_t *tree, const void *key);
void *bplus_tree_lookup(bplus_tree_t *tree, const void *key);
void *bplus_tree_lookup_range(bplus_tree_t *tree, 
                              void *from_key, void *to_key, void **data_set);

#ifdef __cplusplus
}
#endif

#endif