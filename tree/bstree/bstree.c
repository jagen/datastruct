#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include <string.h>
#include <assert.h>
#include "bstree.h"

struct bstree {
    struct bsnode*  root;
};

struct bsnode {
    struct bsnode   *left;
    struct bsnode   *right;
    struct bsnode   *parent;
    int             key;
};

// Create a new node.
static inline struct bsnode *bstree_create_node(int key)
{
    struct bsnode *node = (struct bsnode *)malloc(sizeof(struct bsnode));
    if (!node)
        return NULL;

    node->left = node->right = node->parent =  NULL;
    node->key = key;

    return node;
}

// Free a node
static inline void bstree_free_node(struct bsnode *node)
{
    free( node );
}

// Get the first node with in-order traversal.
static struct bsnode *__bstree_get_first(const struct bsnode *root)
{
    if (!root)
        return NULL;
    while (root->left)
        root = root->left;
    return (struct bsnode *)root;
}

// Get the last node with in-order traversal.
static struct bsnode *__bstree_get_last(const struct bsnode *root)
{   
    if (!root)
        return NULL;
    while (root->right)
        root = root->right;
    return (struct bsnode *)root;
}

// Get the prev node with in-order traversal.
static struct bsnode *__bstree_get_prev(const struct bsnode *node)
{
    if (!node)
        return NULL;
    
    if (!node->left) {
        struct bsnode *p = NULL;
        while ((p = node->parent) && node == p->left)
            node = p;
        return p;
    }

    return __bstree_get_last(node->left);
}

// Get the next node with in-order traversal.
static struct bsnode *__bstree_get_next(const struct bsnode *node)
{
    if (!node)
        return NULL;

    if (!node->right) {
        struct bsnode *p = NULL;
        while ((p = node->parent) && node == p->right)
            node = p;
        return p;
    }
    return __bstree_get_first(node->right);
}

// Insert a new node by recursion method.
static int __bstree_insert_r(struct bsnode **node, struct bsnode *p, int key)
{
    if (!*node) {
        *node = bstree_create_node(key);
        (*node)->parent = p;
        return 0;
    }

    if (key < (*node)->key)
        return __bstree_insert_r(&(*node)->left, *node, key);
    else if (key > (*node)->key)
        return __bstree_insert_r(&(*node)->right, *node, key);

    return -1;
}

// Insert a new node by iteration method.
static int __bstree_insert_i(struct bsnode **root, struct bsnode *new)
{
    if (!new) return -1;

    struct bsnode *parent = NULL;
    int key = new->key;

    while (*root) {
        parent = *root;
        if (key < parent->key)
            root = &parent->left;
        else if(key > parent->key)
            root = &parent->right;
        else return -1;
    }

    new->parent = parent;
    *root = new;

    return 0;
};   

// Find a node by key.
static struct bsnode *__bstree_find_by_key(const struct bsnode *root, int key)
{
    if (!root)
        return NULL;

    while (root) {
        if (key < root->key)
            root = root->left;
        else if (key > root->key)
            root = root->right;
        else 
            return (struct bsnode *)root;
    }
    return NULL;
}

void pre_order_traversal(struct bsnode *root)
{
    if (!root) 
        return;
    printf( "key = %d\n", root->key);
    pre_order_traversal(root->left);
    pre_order_traversal(root->right);
}

void in_order_traversal(struct bsnode *root)
{
    if (!root) 
        return;
    in_order_traversal(root->left);
    printf("key = %d\n", root->key);
    in_order_traversal(root->right);
}

void post_order_traversal(struct bsnode *root)
{
    if (!root) 
        return;
    post_order_traversal(root->left);
    post_order_traversal(root->right);
    printf("key = %d\n", root->key);
}

struct bstree *bstree_create()
{
    struct bstree *tree = (struct bstree *)malloc(sizeof(struct bstree));
    if (!tree)
        return NULL;
    tree->root = NULL;
    return tree;
}

int bstree_insert_recursion(struct bstree *tree, int key)
{
    if (!tree)
        return -1;
    return __bstree_insert_r(&tree->root, NULL, key);
}

int bstree_insert(struct bstree *tree, int key)
{
    if (!tree) 
        return -1;
    return __bstree_insert_i(&tree->root, bstree_create_node(key));
}

struct bsnode *bstree_get_first(const struct bstree *tree)
{
    if (!tree)
        return NULL;
    return __bstree_get_first(tree->root);
}

struct bsnode *bstree_get_last(const struct bstree *tree)
{
    if (!tree)
        return NULL;
    return __bstree_get_last(tree->root);
}

struct bsnode *bstree_get_prev(const struct bsnode *node)
{
    return __bstree_get_prev(node);
}

struct bsnode *bstree_get_next(const struct bsnode *node)
{
    return __bstree_get_next(node);
}

int bstree_remove(struct bstree *tree, int key)
{
    if (NULL == tree && NULL == tree->root)
        return -1;

    struct bsnode* node = __bstree_find_by_key(tree->root, key);
    if (NULL == node)
        return -1;
    struct bsnode* p = node->parent;

    if (NULL == node->left) { // 先判断左子树空
        if (NULL == node->right) { // 这是一个页节点
            assert(p != NULL);
            if (p->left == node)
                p->left = NULL;
            else
                p->right = NULL;
        } else {
            if (NULL == p) { // 这是根节点
                tree->root = node->right;
                tree->root->parent = NULL;
            } else if (p->left == node) {
                p->left = node->right;
                p->left->parent = p;
            } else {
                p->right = node->right;
                p->right->parent = p;
            }
        }
    } else if (NULL == node->right) { // 右子树为空
        if (NULL == p) { // 这是根节点
            tree->root = node->left;
            tree->root->parent = NULL;
        } else if (p->left == node) {
            p->left = node->left;
            p->left->parent = p;
        } else {
            p->right = node->left;
            p->right->parent = p;
        }
    } else { // 左右子树都不为空
        struct bsnode* tmp = __bstree_get_next(node);
        assert(tmp->parent != NULL);

        // 这个节点不可能存在左子树。
        if (tmp->parent->left == tmp) {  // 在左子树上
            tmp->parent->left = tmp->right;
            if(NULL != tmp->right) // 右子树不为空
                tmp->right->parent = tmp->parent;
            tmp->left = node->left;
            tmp->left->parent = tmp;
            tmp->right = node->right;
            tmp->right->parent = tmp;
            tmp->parent = p;
        } else { // 在右子树上，只能是带删除节点的右子树。
            tmp->left = node->left;
            tmp->parent = p;
        }

        if (NULL == p)
            tree->root = tmp;
    }

    bstree_free_node(node);
    return 0;
}

int bstree_find_by_key(const struct bstree *tree, int key)
{
    if (!tree)
        return -1;
    if (__bstree_find_by_key(tree->root, key))
        return 0;
    return -1;
}

int main( int argc, char* argv[] )
{
    struct bstree *tree = bstree_create();
    bstree_insert(tree, 7);
    bstree_insert(tree, 8);
    bstree_insert(tree, 9);
    bstree_insert(tree, 4);
    bstree_insert(tree, 3);
    bstree_insert(tree, 6);
    bstree_insert(tree, 5);
    bstree_insert(tree, 1);
    bstree_insert(tree, 2);
    printf("first key is: %d\n", bstree_get_first(tree)->key);
    printf("last key is: %d\n", bstree_get_last(tree)->key);

    struct bsnode* node = NULL;
    bstree_for_each(tree, node) {
        printf( "key: %d\n", node->key);
    }
    
    printf("key=1  %d\n", bstree_find_by_key(tree, 1));

    printf("--------------------------------\n");

    bstree_insert(tree, 5);
    bstree_insert(tree, 8);
    printf("first key is: %d\n", bstree_get_first(tree)->key );
    printf("last key is: %d\n", bstree_get_last(tree)->key );

    bstree_for_each(tree, node) {
        printf( "key: %d\n", node->key);
    }

    printf("-----------pre-order traversal---------------------\n");
    pre_order_traversal(tree->root);

    printf("-----------in-order traversal----------------------\n");
    in_order_traversal(tree->root);

    printf("-----------post-order traversal--------------------\n");
    post_order_traversal(tree->root);

    printf("--------------------------------\n");
    bstree_remove( tree, 5 );
    bstree_for_each(tree, node)
        printf( "key: %d\n", node->key);

    printf("--------------------------------\n");
    bstree_remove(tree, 6);
    node = bstree_get_first(tree);
    while (NULL != node) {
        printf( "key: %d\n", node->key);
        node = bstree_get_next(node);
    }

    printf("--------------------------------\n");
    bstree_remove(tree, 9);
    node = bstree_get_first(tree);
    while( NULL != node ) {
        printf("key: %d\n", node->key);
        node = bstree_get_next(node);
    }

    return 0;
}