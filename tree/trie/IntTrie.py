#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import print_function

class IntTrie:
    class __IntTrieNode:
        '''
        IntTrie node datatype
        '''
        def __init__(self):
            self.left = self.right = None
            self.value = None

    def __init__(self):
        self.__root = None

    def insert(self, key, value = None):
        '''
        Insert data into trie.
        '''
        if self.__root is None:
            self.__root = self.__IntTrieNode()

        r = self.__root
        while key != 0:
            if key & 1 == 0:
                if r.left is None:
                    r.left = self.__IntTrieNode()
                r = r.left
            else:
                if r.right is None:
                    r.right = self.__IntTrieNode()
                r = r.right
            key = key >> 1
            
        r.value = value


    def __insert_r(self, r, key, value = None):
        if key == 0:
            r.value = value
            return

        if key & 1 == 0:
            if r.left is None: r.left = self.__IntTrieNode()
            self.__insert_r(r.left, key>>1, value)
        else:
            if r.right is None: r.right = self.__IntTrieNode()
            self.__insert_r(r.right, key>>1, value)
        
    def insert_r(self, key, value = None):
        '''
        Insert a new data by recursion method.
        '''
        if self.__root is None: self.__root = self.__IntTrieNode()
        return self.__insert_r(self.__root, key, value)            

    def lookup(self, key):
        '''
        lookup data by key.
        '''
        if self.__root is None:
            return None

        r = self.__root
        while (key != 0) and (r is not None):
            if key & 1 == 0:
                r = r.left
            else:
                r = r.right
            key = key >> 1

        if r is None:
            return None
        else:
            return r.value

    def __lookup_r(self, r, key):
        if r is None: return None
        if key == 0: return r.value
        if key & 1 == 0:
            return self.__lookup_r(r.left, key>>1)
        else:
            return self.__lookup_r(r.right, key>>1)

    def lookup_r(self, key):
        '''
        lookup data by key by recursion method.
        '''
        return self.__lookup_r(self.__root, key)

if __name__ == '__main__':
    trie = IntTrie()
    trie.insert_r(1, 'a')
    trie.insert_r(4, 'b')
    trie.insert_r(5, 'c')
    trie.insert_r(9, 'd')
    print('find {k} is: {d}'.format(k = 5, d=trie.lookup_r(5)))