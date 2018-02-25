	.text
	.align 4,0x90
___bstree_insert_a:
LFB9:
	pushq	%rbx
LCFI0:
	subq	$16, %rsp
LCFI1:
	testq	%rdi, %rdi
	je	L9
	cmpl	%edx, 24(%rdi)
	movq	%rdi, %rbx
	jg	L10
	jl	L11
	addq	$16, %rsp
LCFI2:
	movq	%rbx, %rax
	popq	%rbx
LCFI3:
	ret
	.align 4,0x90
L9:
LCFI4:
	movl	$32, %edi
	movq	%rsi, (%rsp)
	movl	%edx, 12(%rsp)
	call	_malloc
	movq	(%rsp), %rsi
	testq	%rax, %rax
	movq	%rax, %rbx
	je	L3
	movl	12(%rsp), %edx
	movq	$0, 8(%rax)
	movq	$0, (%rax)
	movq	%rsi, 16(%rax)
	movl	%edx, 24(%rax)
	addq	$16, %rsp
LCFI5:
	movq	%rbx, %rax
	popq	%rbx
LCFI6:
	ret
	.align 4,0x90
L3:
LCFI7:
	movq	%rsi, 16
	ud2
	.align 4,0x90
L11:
	movq	8(%rdi), %rdi
	movq	%rbx, %rsi
	call	___bstree_insert_a
	movq	%rax, 8(%rbx)
	addq	$16, %rsp
LCFI8:
	movq	%rbx, %rax
	popq	%rbx
LCFI9:
	ret
	.align 4,0x90
L10:
LCFI10:
	movq	%rdi, %rsi
	movq	(%rdi), %rdi
	call	___bstree_insert_a
	movq	%rax, (%rbx)
	addq	$16, %rsp
LCFI11:
	movq	%rbx, %rax
	popq	%rbx
LCFI12:
	ret
LFE9:
	.align 4,0x90
_bstree_find_node_by_key.part.1:
LFB26:
	testq	%rdi, %rdi
	movq	%rdi, %rax
	je	L13
	movl	24(%rdi), %edx
	cmpl	%edx, %esi
	jne	L14
	jmp	L21
	.align 4,0x90
L16:
	movl	24(%rax), %edx
	cmpl	%esi, %edx
	je	L13
L14:
	movq	(%rax), %rcx
	cmpl	%edx, %esi
	cmovge	8(%rax), %rcx
	testq	%rcx, %rcx
	movq	%rcx, %rax
	jne	L16
L13:
	ret
	.align 4,0x90
L21:
	ret
LFE26:
	.align 4,0x90
	.globl _bstree_insert_recursion_a
_bstree_insert_recursion_a:
LFB11:
	pushq	%rbx
LCFI13:
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	movl	%esi, %edx
	xorl	%esi, %esi
	call	___bstree_insert_a
	movq	%rax, (%rbx)
	popq	%rbx
LCFI14:
	ret
LFE11:
	.align 4,0x90
	.globl _bstree_insert_recursion
_bstree_insert_recursion:
LFB12:
	pushq	%r12
LCFI15:
	movl	%esi, %r12d
	pushq	%rbp
LCFI16:
	xorl	%ebp, %ebp
	pushq	%rbx
LCFI17:
	movq	%rdi, %rbx
	jmp	L25
	.align 4,0x90
L26:
	cmpl	24(%rax), %r12d
	movq	%rax, %rbx
	jl	L29
	jle	L24
	leaq	8(%rax), %rbx
L29:
	movq	%rax, %rbp
L25:
	movq	(%rbx), %rax
	testq	%rax, %rax
	jne	L26
	movl	$32, %edi
	call	_malloc
	testq	%rax, %rax
	je	L27
	movq	$0, 8(%rax)
	movq	$0, (%rax)
	movl	%r12d, 24(%rax)
	movq	%rax, (%rbx)
	movq	%rbp, 16(%rax)
	movq	(%rbx), %rax
	jmp	L26
	.align 4,0x90
L27:
	movq	$0, (%rbx)
	movq	%rbp, 16
	ud2
	.align 4,0x90
L24:
	popq	%rbx
LCFI18:
	popq	%rbp
LCFI19:
	popq	%r12
LCFI20:
	ret
LFE12:
	.align 4,0x90
	.globl _bstree_create
_bstree_create:
LFB15:
	subq	$8, %rsp
LCFI21:
	movl	$16, %edi
	call	_malloc
	testq	%rax, %rax
	je	L32
	movq	$0, (%rax)
	movl	$0, 8(%rax)
L32:
	addq	$8, %rsp
LCFI22:
	ret
LFE15:
	.align 4,0x90
	.globl _bstree_insert_
_bstree_insert_:
LFB17:
	testq	%rdi, %rdi
	je	L52
	pushq	%rbp
LCFI23:
	movl	%esi, %ebp
	pushq	%rbx
LCFI24:
	movq	%rdi, %rbx
	movl	$32, %edi
	subq	$8, %rsp
LCFI25:
	call	_malloc
	testq	%rax, %rax
	je	L41
	movq	$0, 16(%rax)
	movq	%rbx, %rdi
	xorl	%ecx, %ecx
	movq	$0, 8(%rax)
	movq	$0, (%rax)
	movl	%ebp, 24(%rax)
	jmp	L42
	.align 4,0x90
L45:
	cmpl	24(%rdx), %ebp
	movq	%rdx, %rdi
	jl	L44
	jle	L41
	leaq	8(%rdx), %rdi
L44:
	movq	%rdx, %rcx
L42:
	movq	(%rdi), %rdx
	testq	%rdx, %rdx
	jne	L45
	movq	%rcx, 16(%rax)
	movq	%rax, (%rdi)
	addq	$8, %rsp
LCFI26:
	xorl	%eax, %eax
	popq	%rbx
LCFI27:
	popq	%rbp
LCFI28:
	ret
	.align 4,0x90
L41:
LCFI29:
	addq	$8, %rsp
LCFI30:
	movl	$-1, %eax
	popq	%rbx
LCFI31:
	popq	%rbp
LCFI32:
	ret
L52:
LCFI33:
	movl	$-1, %eax
	ret
LFE17:
	.align 4,0x90
	.globl _bstree_insert
_bstree_insert:
LFB18:
	testq	%rdi, %rdi
	je	L61
	pushq	%r12
LCFI34:
	movl	%esi, %r12d
	pushq	%rbp
LCFI35:
	movq	%rdi, %rbp
	pushq	%rbx
LCFI36:
	movq	(%rdi), %rbx
	testq	%rbx, %rbx
	je	L68
	cmpl	%r12d, 24(%rbx)
	je	L62
L70:
	jge	L57
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	L69
L58:
	movq	%rax, %rbx
	cmpl	%r12d, 24(%rbx)
	jne	L70
L62:
	popq	%rbx
LCFI37:
	xorl	%eax, %eax
	popq	%rbp
LCFI38:
	popq	%r12
LCFI39:
	ret
	.align 4,0x90
L57:
LCFI40:
	movq	(%rbx), %rax
	testq	%rax, %rax
	jne	L58
	movl	$32, %edi
	call	_malloc
	testq	%rax, %rax
	je	L60
	movq	$0, 8(%rax)
	movq	$0, (%rax)
	movl	%r12d, 24(%rax)
	movq	%rax, (%rbx)
	movq	%rbx, 16(%rax)
	xorl	%eax, %eax
	addl	$1, 8(%rbp)
L53:
	popq	%rbx
LCFI41:
	popq	%rbp
LCFI42:
	popq	%r12
LCFI43:
	ret
	.align 4,0x90
L69:
LCFI44:
	movl	$32, %edi
	call	_malloc
	testq	%rax, %rax
	je	L59
	movq	$0, 8(%rax)
	movq	$0, (%rax)
	movl	%r12d, 24(%rax)
	movq	%rax, 8(%rbx)
	movq	%rbx, 16(%rax)
	xorl	%eax, %eax
	addl	$1, 8(%rbp)
	popq	%rbx
LCFI45:
	popq	%rbp
LCFI46:
	popq	%r12
LCFI47:
	ret
	.align 4,0x90
L60:
LCFI48:
	movq	$0, (%rbx)
	movq	%rbx, 16
	ud2
	.align 4,0x90
L59:
	movq	$0, 8(%rbx)
	movq	%rbx, 16
	ud2
	.align 4,0x90
L68:
	movl	$32, %edi
	call	_malloc
	testq	%rax, %rax
	je	L71
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	addl	$1, 8(%rbp)
	movq	$0, (%rax)
	movl	%r12d, 24(%rax)
	movq	%rax, 0(%rbp)
	xorl	%eax, %eax
	popq	%rbx
LCFI49:
	popq	%rbp
LCFI50:
	popq	%r12
LCFI51:
	ret
	.align 4,0x90
L71:
LCFI52:
	movq	$0, 0(%rbp)
	movl	$-1, %eax
	jmp	L53
L61:
LCFI53:
	movl	$-1, %eax
	ret
LFE18:
	.cstring
lC0:
	.ascii "tree->root == node\0"
lC1:
	.ascii "bstree.c\0"
lC2:
	.ascii "p != NULL\0"
lC3:
	.ascii "tmp->parent != NULL\0"
	.text
	.align 4,0x90
	.globl _bstree_remove
_bstree_remove:
LFB19:
	testq	%rdi, %rdi
	je	L103
	movq	(%rdi), %r8
	testq	%r8, %r8
	je	L91
	pushq	%rbx
LCFI54:
	movq	%rdi, %rbx
	movq	%r8, %rdi
	call	_bstree_find_node_by_key.part.1
	testq	%rax, %rax
	je	L92
	cmpl	$1, 8(%rbx)
	je	L104
	movq	(%rax), %r8
	movq	16(%rax), %rsi
	movq	8(%rax), %rdi
	testq	%r8, %r8
	je	L105
	testq	%rdi, %rdi
	movq	%rdi, %rdx
	jne	L84
	jmp	L106
	.align 4,0x90
L94:
	movq	%rcx, %rdx
L84:
	movq	(%rdx), %rcx
	testq	%rcx, %rcx
	jne	L94
	movq	16(%rdx), %rcx
	testq	%rcx, %rcx
	je	L107
	cmpq	%rdx, (%rcx)
	je	L108
	movq	%r8, (%rdx)
	movq	%rsi, 16(%rdx)
L90:
	testq	%rsi, %rsi
	jne	L81
	movq	%rdx, (%rbx)
	jmp	L81
	.align 4,0x90
L104:
	cmpq	%rax, %r8
	jne	L109
	call	_free
	movq	$0, (%rbx)
	xorl	%eax, %eax
	subl	$1, 8(%rbx)
	popq	%rbx
LCFI55:
	ret
	.align 4,0x90
L103:
LCFI56:
	movq	0, %rax
	ud2
	.align 4,0x90
L106:
LCFI57:
	testq	%rsi, %rsi
	je	L110
	cmpq	%rax, (%rsi)
	je	L111
	movq	%r8, 8(%rsi)
	movq	%rsi, 16(%r8)
	jmp	L81
	.align 4,0x90
L105:
	testq	%rdi, %rdi
	je	L112
	testq	%rsi, %rsi
	je	L113
	cmpq	%rax, (%rsi)
	je	L114
	movq	%rdi, 8(%rsi)
	movq	%rsi, 16(%rdi)
L81:
	movq	%rax, %rdi
	call	_free
	xorl	%eax, %eax
	subl	$1, 8(%rbx)
	popq	%rbx
LCFI58:
	ret
	.align 4,0x90
L108:
LCFI59:
	movq	8(%rdx), %r8
	testq	%r8, %r8
	movq	%r8, (%rcx)
	je	L89
	movq	%rcx, 16(%r8)
L89:
	movq	(%rax), %rcx
	movq	%rcx, (%rdx)
	movq	%rdx, 16(%rcx)
	movq	%rdi, 8(%rdx)
	movq	%rdx, 16(%rdi)
	movq	%rsi, 16(%rdx)
	jmp	L90
	.align 4,0x90
L110:
	movq	%r8, (%rbx)
	movq	$0, 16(%r8)
	jmp	L81
	.align 4,0x90
L112:
	testq	%rsi, %rsi
	je	L115
	cmpq	%rax, (%rsi)
	je	L116
	movq	$0, 8(%rsi)
	jmp	L81
	.align 4,0x90
L116:
	movq	$0, (%rsi)
	jmp	L81
	.align 4,0x90
L111:
	movq	%r8, (%rsi)
	movq	%rsi, 16(%r8)
	jmp	L81
	.align 4,0x90
L113:
	movq	%rdi, (%rbx)
	movq	$0, 16(%rdi)
	jmp	L81
	.align 4,0x90
L109:
	leaq	lC0(%rip), %rcx
	movl	$263, %edx
	leaq	lC1(%rip), %rsi
	leaq	___func__.3697(%rip), %rdi
	call	___assert_rtn
	.align 4,0x90
L114:
	movq	%rdi, (%rsi)
	movq	%rsi, 16(%rdi)
	jmp	L81
	.align 4,0x90
L107:
	leaq	lC3(%rip), %rcx
	movl	$304, %edx
	leaq	lC1(%rip), %rsi
	leaq	___func__.3697(%rip), %rdi
	call	___assert_rtn
	.align 4,0x90
L91:
LCFI60:
	movl	$-1, %eax
	ret
L92:
LCFI61:
	movl	$-1, %eax
	popq	%rbx
LCFI62:
	ret
L115:
LCFI63:
	leaq	lC2(%rip), %rcx
	movl	$274, %edx
	leaq	lC1(%rip), %rsi
	leaq	___func__.3697(%rip), %rdi
	call	___assert_rtn
LFE19:
	.align 4,0x90
	.globl _bstree_find_by_key
_bstree_find_by_key:
LFB20:
	testq	%rdi, %rdi
	je	L120
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	L120
	call	_bstree_find_node_by_key.part.1
	testq	%rax, %rax
	sete	%al
	movzbl	%al, %eax
	negl	%eax
	ret
	.align 4,0x90
L120:
	movl	$-1, %eax
	ret
LFE20:
	.align 4,0x90
	.globl _bstree_get_size
_bstree_get_size:
LFB21:
	testq	%rdi, %rdi
	je	L123
	movl	8(%rdi), %eax
	ret
L123:
	movl	$-1, %eax
	ret
LFE21:
	.align 4,0x90
	.globl _bstree_get_first_key
_bstree_get_first_key:
LFB22:
	movq	(%rdi), %rdx
	testq	%rdx, %rdx
	jne	L126
	jmp	L130
	.align 4,0x90
L127:
	movq	%rax, %rdx
L126:
	movq	(%rdx), %rax
	testq	%rax, %rax
	jne	L127
	movl	24(%rdx), %eax
	ret
	.align 4,0x90
L130:
	movl	24, %eax
	ud2
LFE22:
	.align 4,0x90
	.globl _bstree_get_last_key
_bstree_get_last_key:
LFB23:
	movq	(%rdi), %rdx
	testq	%rdx, %rdx
	jne	L133
	jmp	L137
	.align 4,0x90
L134:
	movq	%rax, %rdx
L133:
	movq	8(%rdx), %rax
	testq	%rax, %rax
	jne	L134
	movl	24(%rdx), %eax
	ret
	.align 4,0x90
L137:
	movl	24, %eax
	ud2
LFE23:
	.cstring
lC4:
	.ascii "node count: %d\12\0"
lC5:
	.ascii "first key is: %d\12\0"
lC6:
	.ascii "last key is: %d\12\0"
lC7:
	.ascii "key: %d\12\0"
lC8:
	.ascii "key=3  %d\12\0"
	.align 3
lC9:
	.ascii "--------------------------------\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align 4
	.globl _main
_main:
LFB24:
	pushq	%r12
LCFI64:
	movl	$16, %edi
	pushq	%rbp
LCFI65:
	pushq	%rbx
LCFI66:
	call	_malloc
	testq	%rax, %rax
	je	L139
	movq	%rax, %rbx
	movl	$5, %esi
	movq	%rax, %rdi
	movq	$0, (%rax)
	movl	$0, 8(%rax)
	call	_bstree_insert_
	movl	$2, %esi
	movq	%rbx, %rdi
	call	_bstree_insert_
	movl	$1, %esi
	movq	%rbx, %rdi
	call	_bstree_insert_
	movl	$4, %esi
	movq	%rbx, %rdi
	call	_bstree_insert_
	movl	$3, %esi
	movq	%rbx, %rdi
	call	_bstree_insert_
	movl	$9, %esi
	movq	%rbx, %rdi
	call	_bstree_insert_
	movl	$7, %esi
	movq	%rbx, %rdi
	call	_bstree_insert_
	movl	$8, %esi
	movq	%rbx, %rdi
	call	_bstree_insert_
	movl	$6, %esi
	movq	%rbx, %rdi
	call	_bstree_insert_
	movl	8(%rbx), %esi
	xorl	%eax, %eax
	leaq	lC4(%rip), %rdi
	call	_printf
	movq	(%rbx), %rdx
	testq	%rdx, %rdx
	jne	L141
	jmp	L155
	.align 4
L185:
	movq	%rax, %rdx
L141:
	movq	(%rdx), %rax
	testq	%rax, %rax
	jne	L185
	movl	24(%rdx), %esi
	leaq	lC5(%rip), %rdi
	call	_printf
	movq	(%rbx), %rdx
	testq	%rdx, %rdx
	jne	L143
	jmp	L155
	.align 4
L186:
	movq	%rax, %rdx
L143:
	movq	8(%rdx), %rax
	testq	%rax, %rax
	jne	L186
	movl	24(%rdx), %esi
	leaq	lC6(%rip), %rdi
	call	_printf
	movq	(%rbx), %rbp
	testq	%rbp, %rbp
	jne	L144
	jmp	L152
	.align 4
L187:
	movq	%rax, %rbp
L144:
	movq	0(%rbp), %rax
	testq	%rax, %rax
	jne	L187
	leaq	lC7(%rip), %r12
	.align 4
L146:
	movl	24(%rbp), %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	_printf
	movq	8(%rbp), %rdx
	testq	%rdx, %rdx
	jne	L148
	jmp	L147
	.align 4
L188:
	movq	%rax, %rdx
L148:
	movq	(%rdx), %rax
	testq	%rax, %rax
	jne	L188
	movq	%rdx, %rbp
	jmp	L146
L237:
	movq	%rdx, %rbp
	.align 4
L147:
	movq	16(%rbp), %rdx
	testq	%rdx, %rdx
	je	L236
	cmpq	%rbp, 8(%rdx)
	je	L237
	movq	%rdx, %rbp
	jmp	L146
	.align 4
L155:
	movl	24, %eax
	ud2
	.align 4
L139:
	xorl	%edi, %edi
	movl	$5, %esi
	call	_bstree_insert_
	xorl	%edi, %edi
	movl	$2, %esi
	call	_bstree_insert_
	xorl	%edi, %edi
	movl	$1, %esi
	call	_bstree_insert_
	xorl	%edi, %edi
	movl	$4, %esi
	call	_bstree_insert_
	xorl	%edi, %edi
	movl	$3, %esi
	call	_bstree_insert_
	xorl	%edi, %edi
	movl	$9, %esi
	call	_bstree_insert_
	xorl	%edi, %edi
	movl	$7, %esi
	call	_bstree_insert_
	xorl	%edi, %edi
	movl	$8, %esi
	call	_bstree_insert_
	xorl	%edi, %edi
	movl	$6, %esi
	call	_bstree_insert_
	movl	$-1, %esi
	xorl	%eax, %eax
	leaq	lC4(%rip), %rdi
	call	_printf
	movq	0, %rax
	ud2
L236:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	L152
	movl	$3, %esi
	call	_bstree_find_node_by_key.part.1
	xorl	%esi, %esi
	testq	%rax, %rax
	sete	%sil
	negl	%esi
L145:
	leaq	lC8(%rip), %rdi
	xorl	%eax, %eax
	call	_printf
	leaq	lC9(%rip), %rdi
	call	_puts
	movl	$5, %esi
	movq	%rbx, %rdi
	call	_bstree_insert
	movl	$8, %esi
	movq	%rbx, %rdi
	call	_bstree_insert
	movl	8(%rbx), %esi
	xorl	%eax, %eax
	leaq	lC4(%rip), %rdi
	call	_printf
	movq	(%rbx), %rdx
	testq	%rdx, %rdx
	jne	L154
	jmp	L155
	.align 4
L189:
	movq	%rax, %rdx
L154:
	movq	(%rdx), %rax
	testq	%rax, %rax
	jne	L189
	movl	24(%rdx), %esi
	leaq	lC5(%rip), %rdi
	call	_printf
	movq	(%rbx), %rdx
	testq	%rdx, %rdx
	jne	L156
	jmp	L155
	.align 4
L190:
	movq	%rax, %rdx
L156:
	movq	8(%rdx), %rax
	testq	%rax, %rax
	jne	L190
	movl	24(%rdx), %esi
	leaq	lC6(%rip), %rdi
	call	_printf
	movq	(%rbx), %rbp
	testq	%rbp, %rbp
	jne	L157
	jmp	L165
	.align 4
L191:
	movq	%rax, %rbp
L157:
	movq	0(%rbp), %rax
	testq	%rax, %rax
	jne	L191
	leaq	lC7(%rip), %r12
	.align 4
L160:
	movl	24(%rbp), %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	_printf
	movq	8(%rbp), %rdx
	testq	%rdx, %rdx
	jne	L162
	jmp	L161
	.align 4
L192:
	movq	%rax, %rdx
L162:
	movq	(%rdx), %rax
	testq	%rax, %rax
	jne	L192
	movq	%rdx, %rbp
	jmp	L160
L238:
	movq	%rdx, %rbp
	.align 4
L161:
	movq	16(%rbp), %rdx
	testq	%rdx, %rdx
	je	L165
	cmpq	%rbp, 8(%rdx)
	je	L238
	movq	%rdx, %rbp
	jmp	L160
	.align 4
L165:
	leaq	lC9(%rip), %rdi
	call	_puts
	movl	$5, %esi
	movq	%rbx, %rdi
	call	_bstree_remove
	movq	(%rbx), %rbp
	testq	%rbp, %rbp
	jne	L159
	jmp	L158
	.align 4
L193:
	movq	%rax, %rbp
L159:
	movq	0(%rbp), %rax
	testq	%rax, %rax
	jne	L193
	leaq	lC7(%rip), %r12
	.align 4
L168:
	movl	24(%rbp), %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	_printf
	movq	8(%rbp), %rdx
	testq	%rdx, %rdx
	jne	L170
	jmp	L169
	.align 4
L194:
	movq	%rax, %rdx
L170:
	movq	(%rdx), %rax
	testq	%rax, %rax
	jne	L194
	movq	%rdx, %rbp
	jmp	L168
L239:
	movq	%rdx, %rbp
	.align 4
L169:
	movq	16(%rbp), %rdx
	testq	%rdx, %rdx
	je	L158
	cmpq	%rbp, 8(%rdx)
	je	L239
	movq	%rdx, %rbp
	jmp	L168
	.align 4
L158:
	leaq	lC9(%rip), %rdi
	call	_puts
	movl	$6, %esi
	movq	%rbx, %rdi
	call	_bstree_remove
	movq	(%rbx), %rbp
	testq	%rbp, %rbp
	jne	L167
	jmp	L166
	.align 4
L195:
	movq	%rax, %rbp
L167:
	movq	0(%rbp), %rax
	testq	%rax, %rax
	jne	L195
	leaq	lC7(%rip), %r12
	.align 4
L175:
	movl	24(%rbp), %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	_printf
	movq	8(%rbp), %rdx
	testq	%rdx, %rdx
	jne	L177
	jmp	L176
	.align 4
L196:
	movq	%rax, %rdx
L177:
	movq	(%rdx), %rax
	testq	%rax, %rax
	jne	L196
	movq	%rdx, %rbp
	jmp	L175
L240:
	movq	%rdx, %rbp
	.align 4
L176:
	movq	16(%rbp), %rdx
	testq	%rdx, %rdx
	je	L166
	cmpq	%rbp, 8(%rdx)
	je	L240
	movq	%rdx, %rbp
	jmp	L175
	.align 4
L166:
	leaq	lC9(%rip), %rdi
	call	_puts
	movq	%rbx, %rdi
	movl	$9, %esi
	call	_bstree_remove
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	L174
	jmp	L208
	.align 4
L197:
	movq	%rax, %rbx
L174:
	movq	(%rbx), %rax
	testq	%rax, %rax
	jne	L197
	leaq	lC7(%rip), %rbp
	.align 4
L180:
	movl	24(%rbx), %esi
	xorl	%eax, %eax
	movq	%rbp, %rdi
	call	_printf
	movq	8(%rbx), %rdx
	testq	%rdx, %rdx
	jne	L182
	jmp	L181
	.align 4
L198:
	movq	%rax, %rdx
L182:
	movq	(%rdx), %rax
	testq	%rax, %rax
	jne	L198
	movq	%rdx, %rbx
	jmp	L180
L241:
	movq	%rdx, %rbx
	.align 4
L181:
	movq	16(%rbx), %rdx
	testq	%rdx, %rdx
	je	L208
	cmpq	%rbx, 8(%rdx)
	je	L241
	movq	%rdx, %rbx
	jmp	L180
	.align 4
L208:
	popq	%rbx
LCFI67:
	xorl	%eax, %eax
	popq	%rbp
LCFI68:
	popq	%r12
LCFI69:
	ret
L152:
LCFI70:
	orl	$-1, %esi
	jmp	L145
LFE24:
	.const
	.align 3
___func__.3697:
	.ascii "bstree_remove\0"
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zR\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0x1
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB9-.
	.set L$set$2,LFE9-LFB9
	.quad L$set$2
	.byte	0
	.byte	0x4
	.set L$set$3,LCFI0-LFB9
	.long L$set$3
	.byte	0xe
	.byte	0x10
	.byte	0x83
	.byte	0x2
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0xa
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$6,LCFI3-LCFI2
	.long L$set$6
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$7,LCFI4-LCFI3
	.long L$set$7
	.byte	0xb
	.byte	0x4
	.set L$set$8,LCFI5-LCFI4
	.long L$set$8
	.byte	0xa
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$9,LCFI6-LCFI5
	.long L$set$9
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$10,LCFI7-LCFI6
	.long L$set$10
	.byte	0xb
	.byte	0x4
	.set L$set$11,LCFI8-LCFI7
	.long L$set$11
	.byte	0xa
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$12,LCFI9-LCFI8
	.long L$set$12
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$13,LCFI10-LCFI9
	.long L$set$13
	.byte	0xb
	.byte	0x4
	.set L$set$14,LCFI11-LCFI10
	.long L$set$14
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$15,LCFI12-LCFI11
	.long L$set$15
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE1:
LSFDE3:
	.set L$set$16,LEFDE3-LASFDE3
	.long L$set$16
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB26-.
	.set L$set$17,LFE26-LFB26
	.quad L$set$17
	.byte	0
	.align 3
LEFDE3:
LSFDE5:
	.set L$set$18,LEFDE5-LASFDE5
	.long L$set$18
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB11-.
	.set L$set$19,LFE11-LFB11
	.quad L$set$19
	.byte	0
	.byte	0x4
	.set L$set$20,LCFI13-LFB11
	.long L$set$20
	.byte	0xe
	.byte	0x10
	.byte	0x83
	.byte	0x2
	.byte	0x4
	.set L$set$21,LCFI14-LCFI13
	.long L$set$21
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE5:
LSFDE7:
	.set L$set$22,LEFDE7-LASFDE7
	.long L$set$22
LASFDE7:
	.long	LASFDE7-EH_frame1
	.quad	LFB12-.
	.set L$set$23,LFE12-LFB12
	.quad L$set$23
	.byte	0
	.byte	0x4
	.set L$set$24,LCFI15-LFB12
	.long L$set$24
	.byte	0xe
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.byte	0x4
	.set L$set$25,LCFI16-LCFI15
	.long L$set$25
	.byte	0xe
	.byte	0x18
	.byte	0x86
	.byte	0x3
	.byte	0x4
	.set L$set$26,LCFI17-LCFI16
	.long L$set$26
	.byte	0xe
	.byte	0x20
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.set L$set$27,LCFI18-LCFI17
	.long L$set$27
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$28,LCFI19-LCFI18
	.long L$set$28
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$29,LCFI20-LCFI19
	.long L$set$29
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE7:
LSFDE9:
	.set L$set$30,LEFDE9-LASFDE9
	.long L$set$30
LASFDE9:
	.long	LASFDE9-EH_frame1
	.quad	LFB15-.
	.set L$set$31,LFE15-LFB15
	.quad L$set$31
	.byte	0
	.byte	0x4
	.set L$set$32,LCFI21-LFB15
	.long L$set$32
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$33,LCFI22-LCFI21
	.long L$set$33
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE9:
LSFDE11:
	.set L$set$34,LEFDE11-LASFDE11
	.long L$set$34
LASFDE11:
	.long	LASFDE11-EH_frame1
	.quad	LFB17-.
	.set L$set$35,LFE17-LFB17
	.quad L$set$35
	.byte	0
	.byte	0x4
	.set L$set$36,LCFI23-LFB17
	.long L$set$36
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$37,LCFI24-LCFI23
	.long L$set$37
	.byte	0xe
	.byte	0x18
	.byte	0x83
	.byte	0x3
	.byte	0x4
	.set L$set$38,LCFI25-LCFI24
	.long L$set$38
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$39,LCFI26-LCFI25
	.long L$set$39
	.byte	0xa
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$40,LCFI27-LCFI26
	.long L$set$40
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$41,LCFI28-LCFI27
	.long L$set$41
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$42,LCFI29-LCFI28
	.long L$set$42
	.byte	0xb
	.byte	0x4
	.set L$set$43,LCFI30-LCFI29
	.long L$set$43
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$44,LCFI31-LCFI30
	.long L$set$44
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$45,LCFI32-LCFI31
	.long L$set$45
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$46,LCFI33-LCFI32
	.long L$set$46
	.byte	0xc3
	.byte	0xc6
	.align 3
LEFDE11:
LSFDE13:
	.set L$set$47,LEFDE13-LASFDE13
	.long L$set$47
LASFDE13:
	.long	LASFDE13-EH_frame1
	.quad	LFB18-.
	.set L$set$48,LFE18-LFB18
	.quad L$set$48
	.byte	0
	.byte	0x4
	.set L$set$49,LCFI34-LFB18
	.long L$set$49
	.byte	0xe
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.byte	0x4
	.set L$set$50,LCFI35-LCFI34
	.long L$set$50
	.byte	0xe
	.byte	0x18
	.byte	0x86
	.byte	0x3
	.byte	0x4
	.set L$set$51,LCFI36-LCFI35
	.long L$set$51
	.byte	0xe
	.byte	0x20
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.set L$set$52,LCFI37-LCFI36
	.long L$set$52
	.byte	0xa
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$53,LCFI38-LCFI37
	.long L$set$53
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$54,LCFI39-LCFI38
	.long L$set$54
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$55,LCFI40-LCFI39
	.long L$set$55
	.byte	0xb
	.byte	0x4
	.set L$set$56,LCFI41-LCFI40
	.long L$set$56
	.byte	0xa
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$57,LCFI42-LCFI41
	.long L$set$57
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$58,LCFI43-LCFI42
	.long L$set$58
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$59,LCFI44-LCFI43
	.long L$set$59
	.byte	0xb
	.byte	0x4
	.set L$set$60,LCFI45-LCFI44
	.long L$set$60
	.byte	0xa
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$61,LCFI46-LCFI45
	.long L$set$61
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$62,LCFI47-LCFI46
	.long L$set$62
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$63,LCFI48-LCFI47
	.long L$set$63
	.byte	0xb
	.byte	0x4
	.set L$set$64,LCFI49-LCFI48
	.long L$set$64
	.byte	0xa
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$65,LCFI50-LCFI49
	.long L$set$65
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$66,LCFI51-LCFI50
	.long L$set$66
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$67,LCFI52-LCFI51
	.long L$set$67
	.byte	0xb
	.byte	0x4
	.set L$set$68,LCFI53-LCFI52
	.long L$set$68
	.byte	0xe
	.byte	0x8
	.byte	0xc3
	.byte	0xc6
	.byte	0xcc
	.align 3
LEFDE13:
LSFDE15:
	.set L$set$69,LEFDE15-LASFDE15
	.long L$set$69
LASFDE15:
	.long	LASFDE15-EH_frame1
	.quad	LFB19-.
	.set L$set$70,LFE19-LFB19
	.quad L$set$70
	.byte	0
	.byte	0x4
	.set L$set$71,LCFI54-LFB19
	.long L$set$71
	.byte	0xe
	.byte	0x10
	.byte	0x83
	.byte	0x2
	.byte	0x4
	.set L$set$72,LCFI55-LCFI54
	.long L$set$72
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$73,LCFI56-LCFI55
	.long L$set$73
	.byte	0xc3
	.byte	0x4
	.set L$set$74,LCFI57-LCFI56
	.long L$set$74
	.byte	0xe
	.byte	0x10
	.byte	0x83
	.byte	0x2
	.byte	0x4
	.set L$set$75,LCFI58-LCFI57
	.long L$set$75
	.byte	0xa
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$76,LCFI59-LCFI58
	.long L$set$76
	.byte	0xb
	.byte	0x4
	.set L$set$77,LCFI60-LCFI59
	.long L$set$77
	.byte	0xe
	.byte	0x8
	.byte	0xc3
	.byte	0x4
	.set L$set$78,LCFI61-LCFI60
	.long L$set$78
	.byte	0xe
	.byte	0x10
	.byte	0x83
	.byte	0x2
	.byte	0x4
	.set L$set$79,LCFI62-LCFI61
	.long L$set$79
	.byte	0xa
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$80,LCFI63-LCFI62
	.long L$set$80
	.byte	0xb
	.align 3
LEFDE15:
LSFDE17:
	.set L$set$81,LEFDE17-LASFDE17
	.long L$set$81
LASFDE17:
	.long	LASFDE17-EH_frame1
	.quad	LFB20-.
	.set L$set$82,LFE20-LFB20
	.quad L$set$82
	.byte	0
	.align 3
LEFDE17:
LSFDE19:
	.set L$set$83,LEFDE19-LASFDE19
	.long L$set$83
LASFDE19:
	.long	LASFDE19-EH_frame1
	.quad	LFB21-.
	.set L$set$84,LFE21-LFB21
	.quad L$set$84
	.byte	0
	.align 3
LEFDE19:
LSFDE21:
	.set L$set$85,LEFDE21-LASFDE21
	.long L$set$85
LASFDE21:
	.long	LASFDE21-EH_frame1
	.quad	LFB22-.
	.set L$set$86,LFE22-LFB22
	.quad L$set$86
	.byte	0
	.align 3
LEFDE21:
LSFDE23:
	.set L$set$87,LEFDE23-LASFDE23
	.long L$set$87
LASFDE23:
	.long	LASFDE23-EH_frame1
	.quad	LFB23-.
	.set L$set$88,LFE23-LFB23
	.quad L$set$88
	.byte	0
	.align 3
LEFDE23:
LSFDE25:
	.set L$set$89,LEFDE25-LASFDE25
	.long L$set$89
LASFDE25:
	.long	LASFDE25-EH_frame1
	.quad	LFB24-.
	.set L$set$90,LFE24-LFB24
	.quad L$set$90
	.byte	0
	.byte	0x4
	.set L$set$91,LCFI64-LFB24
	.long L$set$91
	.byte	0xe
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.byte	0x4
	.set L$set$92,LCFI65-LCFI64
	.long L$set$92
	.byte	0xe
	.byte	0x18
	.byte	0x86
	.byte	0x3
	.byte	0x4
	.set L$set$93,LCFI66-LCFI65
	.long L$set$93
	.byte	0xe
	.byte	0x20
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.set L$set$94,LCFI67-LCFI66
	.long L$set$94
	.byte	0xa
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$95,LCFI68-LCFI67
	.long L$set$95
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$96,LCFI69-LCFI68
	.long L$set$96
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$97,LCFI70-LCFI69
	.long L$set$97
	.byte	0xb
	.align 3
LEFDE25:
	.subsections_via_symbols
