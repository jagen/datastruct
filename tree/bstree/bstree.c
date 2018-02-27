#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include <string.h>
#include <assert.h>
#include "bstree.h"

struct bs_tree {
    struct bs_node*  root;
};

struct bs_node {
    struct bs_node  *left;
    struct bs_node  *right;
    struct bs_node  *parent;
    int             key;
};

// Create a new node.
static inline struct bs_node *bstree_create_node(int key)
{
    struct bs_node *node = (struct bs_node *)malloc(sizeof(struct bs_node));
    if (!node)
        return NULL;

    node->left = node->right = node->parent =  NULL;
    node->key = key;

    return node;
}

// Free a node
static inline void bstree_free_node(struct bs_node *node)
{
    free( node );
}

// Get the first node with in-order traversal.
static struct bs_node *__bstree_get_first(const struct bs_node *root)
{
    while (root->left)
        root = root->left;
    return (struct bs_node *)root;
}

// Get the last node with in-order traversal.
static struct bs_node *__bstree_get_last(const struct bs_node *root)
{   
    while (root->right)
        root = root->right;
    return (struct bs_node *)root;
}

// Get the prev node with in-order traversal.
static struct bs_node *__bstree_get_prev(const struct bs_node *node)
{    
    if (!node->left) {
        struct bs_node *p = NULL;
        while ((p = node->parent) && node == p->left)
            node = p;
        return p;
    }
    return __bstree_get_last(node->left);
}

// Get the next node with in-order traversal.
static struct bs_node *__bstree_get_next(const struct bs_node *node)
{
    if (!node->right) {
        struct bs_node *p = NULL;
        while ((p = node->parent) && node == p->right)
            node = p;
        return p;
    }
    return __bstree_get_first(node->right);
}

// Get the first node with post-order traversal.
static struct bs_node *__bstree_get_first_postorder(const struct bs_node *node)
{
    for (;;) {
        if (node->left) 
            node = node->left;
        else if (node->right)
            node = node->right;
        else
            return (struct bs_node *)node;
    }
}

// Get the prev node with post-order traversal.
static struct bs_node *__bstree_get_prev_postorder(const struct bs_node *node)
{
    if (node->right)
        return (struct bs_node *)node->right;
    else if (node->left) 
        return (struct bs_node *)node->left;
    
    struct bs_node *p = node->parent;
    while (p) {
        if (p->left && node != p->left)
            return (struct bs_node *)p->left;
        node = p;
        p = p->parent;
    }
    return p;
}

// Get the next node with post-order traversal.
static struct bs_node *__bstree_get_next_postorder(const struct bs_node *node)
{    
    struct bs_node *p = node->parent;
    if (p && node == p->left && p->right) {
        return __bstree_get_first_postorder(p->right);
    }
    return p;
}

// Insert a new node by recursion method.
static int __bstree_insert_r(struct bs_node **node, struct bs_node *p, int key)
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
static int __bstree_insert_i(struct bs_node **root, struct bs_node *new)
{
    if (!new) 
        return -1;

    struct bs_node *parent = NULL;
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
static struct bs_node *__bstree_find_by_key(const struct bs_node *root, int key)
{
    if (!root)
        return NULL;

    while (root) {
        if (key < root->key)
            root = root->left;
        else if (key > root->key)
            root = root->right;
        else 
            return (struct bs_node *)root;
    }
    return NULL;
}

void pre_order_traversal(struct bs_node *root)
{
    if (!root) 
        return;
    printf( "key = %d\n", root->key);
    pre_order_traversal(root->left);
    pre_order_traversal(root->right);
}

void in_order_traversal(struct bs_node *root)
{
    if (!root) 
        return;
    in_order_traversal(root->left);
    printf("key = %d\n", root->key);
    in_order_traversal(root->right);
}

void post_order_traversal(struct bs_node *root)
{
    if (!root) 
        return;
    post_order_traversal(root->left);
    post_order_traversal(root->right);
    printf("key = %d\n", root->key);
}

struct bs_tree *bstree_create()
{
    struct bs_tree *tree = (struct bs_tree *)malloc(sizeof(struct bs_tree));
    if (!tree)
        return NULL;
    tree->root = NULL;
    return tree;
}

int bstree_insert_recursion(struct bs_tree *tree, int key)
{
    if (!tree)
        return -1;
    return __bstree_insert_r(&tree->root, NULL, key);
}

int bstree_insert(struct bs_tree *tree, int key)
{
    if (!tree) 
        return -1;
    return __bstree_insert_i(&tree->root, bstree_create_node(key));
}

struct bs_node *bstree_get_first(const struct bs_tree *tree)
{
    if (!tree || !tree->root)
        return NULL;
    return __bstree_get_first(tree->root);
}

struct bs_node *bstree_get_last(const struct bs_tree *tree)
{
    if (!tree || !tree->root)
        return NULL;
    return __bstree_get_last(tree->root);
}

struct bs_node *bstree_get_prev(const struct bs_node *node)
{
    if (!node)
        return NULL;
    return __bstree_get_prev(node);
}

struct bs_node *bstree_get_next(const struct bs_node *node)
{
    if (!node)
        return NULL;
    return __bstree_get_next(node);
}

struct bs_node *bstree_get_first_postorder(const struct bs_tree *tree)
{
    if (!tree || !tree->root)
        return NULL;
    return __bstree_get_first_postorder(tree->root);
}

struct bs_node *bstree_get_prev_postorder(const struct bs_node *node)
{
    if (!node)
        return NULL;
    return __bstree_get_prev_postorder(node);
}

struct bs_node *bstree_get_next_postorder(const struct bs_node *node)
{
    if (!node)
        return NULL;
    return __bstree_get_next_postorder(node);
}

int bstree_remove(struct bs_tree *tree, int key)
{
    if (NULL == tree && NULL == tree->root)
        return -1;

    struct bs_node* node = __bstree_find_by_key(tree->root, key);
    if (NULL == node)
        return -1;
    struct bs_node* p = node->parent;

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
        struct bs_node* tmp = __bstree_get_next(node);
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

int bstree_find_by_key(const struct bs_tree *tree, int key)
{
    if (!tree)
        return -1;
    if (__bstree_find_by_key(tree->root, key))
        return 0;
    return -1;
}

int main( int argc, char* argv[] )
{
    struct bs_tree *tree = bstree_create();
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

    struct bs_node* node = NULL;
    bstree_for_each(tree, node)
        printf( "%d ", node->key);
    printf("\n");

    bstree_for_each_reverse(tree, node)
        printf( "%d ", node->key);
    printf("\n");

    bstree_postorder_for_each(tree, node)
        printf( "%d ", node->key);
    printf("\n");

    bstree_postorder_for_each_reverse(tree, node)
        printf( "%d ", node->key);
    printf("\n");
    
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