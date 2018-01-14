# 版权所有 Jagen Zhao (2018)
# 本代码仅供学习参考，不得用于任何商业用途。

CC		:= clang
LD		:= clang
CFLAGS	:= -g -W -std=c99 -c
LDFLAGS :=

all:rbtree

rbtree:test.o rbtree.o
	$(LD)	$(LDFLAGS) $^ -o $@

%.o:%.c
	$(CC) $(CFLAGS) -o $@ $<
