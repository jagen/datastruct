#include <stdio.h>
#include <string.h>
#include "rbtree.h"

static void
foreach_callback( char* key, void* data )
{
    printf( "key: %s, data: %s\n", key, (char*)data );
}

int main() 
{
    RBTree *tree = rbtree_create();
    rbtree_insert( tree, strdup("1"), strdup("一") );
    rbtree_insert( tree, strdup("2"), strdup("二") );
    rbtree_insert( tree, strdup("3"), strdup("三") );
    rbtree_insert( tree, strdup("4"), strdup("四") );
    rbtree_insert( tree, strdup("5"), strdup("五") );
    rbtree_insert( tree, strdup("6"), strdup("六") );
    rbtree_insert( tree, strdup("7"), strdup("七") );
    rbtree_insert( tree, strdup("b"), strdup("B") );
    rbtree_insert( tree, strdup("c"), strdup("C") );
    rbtree_insert( tree, strdup("0"), strdup("零") );
    rbtree_insert( tree, strdup("a"), strdup("A") );
    rbtree_insert( tree, strdup("e"), strdup("E") );
    rbtree_insert( tree, strdup("k"), strdup("K") );
    rbtree_insert( tree, strdup("v"), strdup("V") );
    rbtree_insert( tree, strdup("d"), strdup("D") );
    rbtree_insert( tree, strdup("w"), strdup("W") );
    rbtree_insert( tree, strdup("x"), strdup("X") );
    rbtree_insert( tree, strdup("o"), strdup("O") );
    rbtree_insert( tree, strdup("j"), strdup("J") );
    rbtree_insert( tree, strdup("y"), strdup("Y") );
    rbtree_insert( tree, strdup("z"), strdup("Z") );   
    rbtree_insert( tree, strdup("l"), strdup("L") );
    rbtree_insert( tree, strdup("m"), strdup("M") );
    rbtree_insert( tree, strdup("p"), strdup("P") );
    rbtree_insert( tree, strdup("q"), strdup("Q") );
    rbtree_insert( tree, strdup("r"), strdup("R") );
    rbtree_insert( tree, strdup("8"), strdup("八") );
    rbtree_insert( tree, strdup("f"), strdup("F") );
    rbtree_insert( tree, strdup("g"), strdup("G") );
    rbtree_insert( tree, strdup("h"), strdup("H") );
    rbtree_insert( tree, strdup("9"), strdup("九") );
    rbtree_insert( tree, strdup("i"), strdup("I") );
    rbtree_insert( tree, strdup("n"), strdup("N") );
    rbtree_insert( tree, strdup("s"), strdup("S") );
    rbtree_insert( tree, strdup("t"), strdup("T") );
    rbtree_insert( tree, strdup("u"), strdup("U") );
 
    printf( "node count: %d\n", rbtree_get_size( tree ) );
    printf( "first key is: %s\n", rbtree_get_first_key( tree ) );
    printf( "last key is: %s\n", rbtree_get_last_key( tree ) );
    rbtree_foreach( tree, foreach_callback );

    void* data = rbtree_find_by_key( tree, "3" );
    printf( "key=3 and data is: %s\n", (char*)data );

    printf( "--------------------------------\n" );

    rbtree_insert( tree, strdup("5"), strdup("五") );
    rbtree_insert( tree, strdup("8"), strdup("八") );
    printf( "node count: %d\n", rbtree_get_size( tree ) );
    printf( "first key is: %s\n", rbtree_get_first_key( tree ) );
    printf( "last key is: %s\n", rbtree_get_last_key( tree ) );
    rbtree_foreach( tree, foreach_callback );
    printf( "--------------------------------\n" );

    rbtree_remove( tree, "3" );
    rbtree_foreach( tree, foreach_callback );
    return 0;
}