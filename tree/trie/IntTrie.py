#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import print_function

class IntTrieNode:
    def __init__(self):
        self.left = self.right = None
        self.value = None

def trie_insert(t, key, value = None):
    if t is None:
        t = IntTrieNode()
    p = t
    while key != 0:
        if key & 1 == 0:
            if p.left is None:
                p.left = IntTrieNode()
            p = p.left
        else:
            if p.right is None:
                p.right = IntTrieNode()
            p = p.right
        key = key >> 1
    p.value = value
    return t
