# Copyright (C) Jagen Zhao (2018)
CC		:= clang
LD		:= clang
CFLAGS	:= -g -W -std=c99 -c
LDFLAGS :=

all:btree

btree:test.o btree.o bptree-linuxlike.o bptree.o
	$(LD) $(LDFLAGS) $^ -o $@

%.o:%.c
	$(CC) $(CFLAGS) -o $@ $<