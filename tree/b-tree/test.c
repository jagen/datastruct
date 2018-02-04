#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "btree.h"

int main()
{
    BTree *bt = btree_create(5);
    btree_insert(bt, strdup("G"));
    btree_insert(bt, strdup("M"));
    btree_insert(bt, strdup("P"));
    btree_insert(bt, strdup("X"));
    btree_insert(bt, strdup("A"));
    btree_insert(bt, strdup("C"));
    btree_insert(bt, strdup("D"));
    btree_insert(bt, strdup("E"));
    btree_insert(bt, strdup("J"));
    btree_insert(bt, strdup("K"));
    btree_insert(bt, strdup("N"));
    btree_insert(bt, strdup("O"));
    btree_insert(bt, strdup("R"));
    btree_insert(bt, strdup("S"));
    btree_insert(bt, strdup("T"));
    btree_insert(bt, strdup("U"));
    btree_insert(bt, strdup("V"));
    btree_insert(bt, strdup("Y"));
    btree_insert(bt, strdup("Z"));
    btree_insert(bt, strdup("B"));
    btree_insert(bt, strdup("F"));
    btree_insert(bt, strdup("H"));
    btree_insert(bt, strdup("I"));
    btree_insert(bt, strdup("W"));
    btree_insert(bt, strdup("L"));
    btree_insert(bt, strdup("Q"));
    btree_insert(bt, strdup("W"));

    printf("Q is in b-tree : %d\n", btree_search(bt, "Q"));
    printf("W is in b-tree : %d\n", btree_search(bt, "W"));
    printf("L is in b-tree : %d\n", btree_search(bt, "L"));
    printf("4 is in b-tree : %d\n", btree_search(bt, "4"));

    btree_remove(bt, strdup("P"));
    printf("P is in b-tree : %d\n", btree_search(bt, "P"));

    btree_remove(bt, strdup("I"));
    printf("I is in b-tree : %d\n", btree_search(bt, "I"));

    btree_remove(bt, strdup("W"));
    btree_remove(bt, strdup("Q"));
    btree_remove(bt, strdup("I"));
    btree_remove(bt, strdup("H"));
    btree_remove(bt, strdup("N"));
    btree_remove(bt, strdup("B"));

    printf("Q is in b-tree : %d\n", btree_search(bt, "Q"));
    printf("W is in b-tree : %d\n", btree_search(bt, "W"));
    printf("L is in b-tree : %d\n", btree_search(bt, "L"));
    printf("4 is in b-tree : %d\n", btree_search(bt, "4"));

    return 0;
}