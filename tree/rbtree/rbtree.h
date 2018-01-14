/*
 * 版权所有 Jagen Zhao (2018)
 * 本代码仅供学习参考，不得用于任何商业用途。
 */

#ifndef __rbtree_H__
#define __rbtree_H__

#ifdef __cplusplus
extern "C" {
#endif

/** 红黑树数据类型。 */
typedef struct _rbtree RBTree;

/** 
 * 迭代器回调函数定义。 
 * 
 * @param key   访问到的键值。
 * @param data  与键值对应的数据。
 */
typedef void (*rbtree_foreach_callback)( char *key, void *data, void *udata );

/**
 * 创建一颗红黑树。
 * 
 * @return 成功返回新创建的红黑树对象，否则返回NULL。
 */
RBTree* rbtree_create();

/**
 * 销毁一颗红黑树。
 * 
 * @param tree  要销毁的红黑树对象。
 */
void rbtree_destory( RBTree* tree );

/**
 * 获取红黑树的节点数。
 * 
 * @param tree  要获取节点数的红黑树对象。
 * @return      返回具体的节点数。
 */
int rbtree_get_size( RBTree* tree );

/**
 * 向一颗红黑树中插入数据。
 * 红黑树会自己回收键值与数据的内存使用，插入数据前要复制键值和其对应的数据给红黑树。
 * 
 * @param key   要插入的键值。
 * @param data  与要插入的键值对应的数据。
 * @return      成功返回0，失败返回-1。
 */
int rbtree_insert( RBTree* tree, char* key, void* data );

/**
 * 从一颗红黑树上删除数据。
 * 红黑树会自己回收删除的键值和其对应的数据所占用的内存。
 * 
 * @param key   要插入删除的键值。
 * @return      成功返回0，失败返回-1。
 */
int rbtree_remove( RBTree* tree, char* key );

/**
 * 获取红黑树中最小的键值。
 * 
 * @param tree  要操作的红黑树对象。
 * @return      成功则返回最小的键值，失败则返回NULL，通常是因为给定的红黑树是空的。
 */
char* rbtree_get_first_key( RBTree* tree );

/**
 * 获取红黑树中最大的键值。
 * 
 * @param tree  要操作的红黑树对象。
 * @return      成功则返回最大的键值，失败则返回NULL，通常是因为给定的红黑树是空的。
 */
char* rbtree_get_last_key( RBTree* tree );

/**
 * 根据键值获取数据。
 * 
 * @param tree  要操作的红黑树对象。
 * @param key   要获取数据的键值。
 * @return      成功则返回给定键值所对应的数据，失败则返回NULL。
 *              失败通常是因为给定的红黑树是空的或无法找到给定的键值。
 */
void* rbtree_find_by_key( RBTree* tree, char* key );

/**
 * 迭代访问给定的红黑树中的每一个节点。中序遍历。
 * 
 * @param tree  要操作的红黑树对象。
 * @param fun   迭代器回调函数。
 * @param udata 附带的数据，会直接传递回调函数。
 */
void rbtree_foreach( RBTree* tree, rbtree_foreach_callback fun, void *udata );

#ifdef __cplusplus
}
#endif

#endif