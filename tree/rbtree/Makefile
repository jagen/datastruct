# Copyright (C) Jagen Zhao (2018)

CC		:= clang
LD		:= clang
CFLAGS	:= -g -W -std=c99 -c
LDFLAGS :=

all:rbtree

rbtree:test.o rbtree.o
	$(LD)	$(LDFLAGS) $^ -o $@

%.o:%.c
	$(CC) $(CFLAGS) -o $@ $<
