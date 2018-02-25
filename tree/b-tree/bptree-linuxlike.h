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
#ifndef __BPLUS_TREE_LINUXLIKE__
#define __BPLUS_TREE_LINUXLIKE__

#ifdef __cplusplus
extern "C" {
#endif

struct bptree_head {
    unsigned long *node;
    int height;
};

extern struct bptree_geo bptree_geo64;

int bptree_init(struct bptree_head *head);
void bptree_destroy(struct bptree_head *head);

void *bptree_lookup(struct bptree_head *head, struct bptree_geo *gen, 
                        unsigned long *key);
int bptree_insert(struct bptree_head *head, struct bptree_geo *geo, 
                        unsigned long key, void *val);
void *bptree_remove(struct bptree_head *head, struct bptree_geo *geo, 
                        unsigned long *key);

#ifdef __cplusplus
}
#endif

#endif