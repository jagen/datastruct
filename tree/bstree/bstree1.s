	.text
Ltext0:
_bstree_create_node:
LFB4:
LM1:
	pushq	%rbp
LCFI0:
	movq	%rsp, %rbp
LCFI1:
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
LM2:
	movl	$32, %edi
	call	_malloc
	movq	%rax, -8(%rbp)
LM3:
	cmpq	$0, -8(%rbp)
	jne	L2
LM4:
	movl	$0, %eax
	jmp	L3
L2:
LM5:
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
LM6:
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 24(%rax)
LM7:
	movq	-8(%rbp), %rax
L3:
LM8:
	leave
LCFI2:
	ret
LFE4:
_bstree_free_node:
LFB5:
LM9:
	pushq	%rbp
LCFI3:
	movq	%rsp, %rbp
LCFI4:
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
LM10:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_free
LM11:
	nop
	leave
LCFI5:
	ret
LFE5:
_bstree_get_first_node:
LFB6:
LM12:
	pushq	%rbp
LCFI6:
	movq	%rsp, %rbp
LCFI7:
	movq	%rdi, -24(%rbp)
LM13:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LM14:
	cmpq	$0, -8(%rbp)
	jne	L8
LM15:
	movl	$0, %eax
	jmp	L7
L9:
LM16:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
L8:
LM17:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	L9
LM18:
	movq	-8(%rbp), %rax
L7:
LM19:
	popq	%rbp
LCFI8:
	ret
LFE6:
_bstree_get_last_node:
LFB7:
LM20:
	pushq	%rbp
LCFI9:
	movq	%rsp, %rbp
LCFI10:
	movq	%rdi, -24(%rbp)
LM21:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LM22:
	cmpq	$0, -8(%rbp)
	jne	L13
LM23:
	movl	$0, %eax
	jmp	L12
L14:
LM24:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
L13:
LM25:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	L14
LM26:
	movq	-8(%rbp), %rax
L12:
LM27:
	popq	%rbp
LCFI11:
	ret
LFE7:
_bstree_get_prev_node:
LFB8:
LM28:
	pushq	%rbp
LCFI12:
	movq	%rsp, %rbp
LCFI13:
	subq	$24, %rsp
	movq	%rdi, -24(%rbp)
LM29:
	cmpq	$0, -24(%rbp)
	jne	L16
LM30:
	movl	$0, %eax
	jmp	L17
L16:
LM31:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	L18
LM32:
	jmp	L19
L21:
LBB2:
LM33:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
LM34:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -24(%rbp)
	jne	L20
LM35:
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
LM36:
	jmp	L19
L20:
LM37:
	movq	-8(%rbp), %rax
	jmp	L17
L19:
LBE2:
LM38:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	L21
LM39:
	movl	$0, %eax
	jmp	L17
L18:
LM40:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	_bstree_get_last_node
L17:
LM41:
	leave
LCFI14:
	ret
LFE8:
___bstree_insert_a:
LFB9:
LM42:
	pushq	%rbp
LCFI15:
	movq	%rsp, %rbp
LCFI16:
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
LM43:
	cmpq	$0, -24(%rbp)
	jne	L23
LBB3:
LM44:
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	_bstree_create_node
	movq	%rax, -8(%rbp)
LM45:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 16(%rax)
LM46:
	movq	-8(%rbp), %rax
	jmp	L24
L23:
LBE3:
LM47:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	%eax, -36(%rbp)
	jge	L25
LM48:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-36(%rbp), %edx
	movq	-24(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	___bstree_insert_a
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	jmp	L26
L25:
LM49:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	%eax, -36(%rbp)
	jle	L26
LM50:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-36(%rbp), %edx
	movq	-24(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	___bstree_insert_a
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
L26:
LM51:
	movq	-24(%rbp), %rax
L24:
LM52:
	leave
LCFI17:
	ret
LFE9:
__bstree_insert:
LFB10:
LM53:
	pushq	%rbp
LCFI18:
	movq	%rsp, %rbp
LCFI19:
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
LM54:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	L28
LM55:
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	_bstree_create_node
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
LM56:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
L28:
LM57:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	cmpl	%eax, -20(%rbp)
	jge	L29
LM58:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, %rcx
	movl	-20(%rbp), %edx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	__bstree_insert
	jmp	L27
L29:
LM59:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	cmpl	%eax, -20(%rbp)
	jle	L32
LM60:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rdx
	leaq	8(%rdx), %rcx
	movl	-20(%rbp), %edx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	__bstree_insert
	jmp	L27
L32:
LM61:
	nop
L27:
LM62:
	leave
LCFI20:
	ret
LFE10:
	.globl _bstree_insert_recursion_a
_bstree_insert_recursion_a:
LFB11:
LM63:
	pushq	%rbp
LCFI21:
	movq	%rsp, %rbp
LCFI22:
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
LM64:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	___bstree_insert_a
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
LM65:
	nop
	leave
LCFI23:
	ret
LFE11:
	.globl _bstree_insert_recursion
_bstree_insert_recursion:
LFB12:
LM66:
	pushq	%rbp
LCFI24:
	movq	%rsp, %rbp
LCFI25:
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
LM67:
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	__bstree_insert
LM68:
	nop
	leave
LCFI26:
	ret
LFE12:
_bstree_get_next_node:
LFB13:
LM69:
	pushq	%rbp
LCFI27:
	movq	%rsp, %rbp
LCFI28:
	subq	$24, %rsp
	movq	%rdi, -24(%rbp)
LM70:
	cmpq	$0, -24(%rbp)
	jne	L36
LM71:
	movl	$0, %eax
	jmp	L37
L36:
LM72:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	L38
LM73:
	jmp	L39
L41:
LBB4:
LM74:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
LM75:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, -24(%rbp)
	jne	L40
LM76:
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
LM77:
	jmp	L39
L40:
LM78:
	movq	-8(%rbp), %rax
	jmp	L37
L39:
LBE4:
LM79:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	L41
LM80:
	movl	$0, %eax
	jmp	L37
L38:
LM81:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	_bstree_get_first_node
L37:
LM82:
	leave
LCFI29:
	ret
LFE13:
_bstree_find_node_by_key:
LFB14:
LM83:
	pushq	%rbp
LCFI30:
	movq	%rsp, %rbp
LCFI31:
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
LM84:
	cmpq	$0, -24(%rbp)
	jne	L43
LM85:
	movl	$0, %eax
	jmp	L44
L43:
LM86:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LM87:
	jmp	L45
L48:
LM88:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	%eax, -28(%rbp)
	jne	L46
LM89:
	movq	-8(%rbp), %rax
	jmp	L44
L46:
LM90:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	%eax, -28(%rbp)
	jge	L47
LM91:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	L45
L47:
LM92:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
L45:
LM93:
	cmpq	$0, -8(%rbp)
	jne	L48
LM94:
	movl	$0, %eax
L44:
LM95:
	popq	%rbp
LCFI32:
	ret
LFE14:
	.globl _bstree_create
_bstree_create:
LFB15:
LM96:
	pushq	%rbp
LCFI33:
	movq	%rsp, %rbp
LCFI34:
	subq	$16, %rsp
LM97:
	movl	$16, %edi
	call	_malloc
	movq	%rax, -8(%rbp)
LM98:
	cmpq	$0, -8(%rbp)
	jne	L50
LM99:
	movl	$0, %eax
	jmp	L51
L50:
LM100:
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
LM101:
	movq	-8(%rbp), %rax
	movl	$0, 8(%rax)
LM102:
	movq	-8(%rbp), %rax
L51:
LM103:
	leave
LCFI35:
	ret
LFE15:
	.globl _bstree_insert
_bstree_insert:
LFB16:
LM104:
	pushq	%rbp
LCFI36:
	movq	%rsp, %rbp
LCFI37:
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
LM105:
	cmpq	$0, -24(%rbp)
	jne	L53
LM106:
	movl	$-1, %eax
	jmp	L54
L53:
LM107:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	L55
LM108:
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	_bstree_create_node
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
LM109:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	L56
LM110:
	movl	$-1, %eax
	jmp	L54
L56:
LM111:
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
LM112:
	movl	$0, %eax
	jmp	L54
L55:
LM113:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
L62:
LM114:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	%eax, -28(%rbp)
	jne	L57
LM115:
	movq	-8(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, 24(%rax)
LM116:
	movl	$0, %eax
	jmp	L54
L57:
LM117:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	%eax, -28(%rbp)
	jle	L58
LM118:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	L59
LM119:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
LM120:
	jmp	L60
L59:
LM121:
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	_bstree_create_node
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
LM122:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
LM123:
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
LM124:
	movl	$0, %eax
	jmp	L54
L58:
LM125:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	L61
LM126:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
LM127:
	jmp	L60
L61:
LM128:
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	_bstree_create_node
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
LM129:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
LM130:
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
LM131:
	movl	$0, %eax
	jmp	L54
L60:
LM132:
	jmp	L62
L54:
LM133:
	leave
LCFI38:
	ret
LFE16:
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
	.globl _bstree_remove
_bstree_remove:
LFB17:
LM134:
	pushq	%rbp
LCFI39:
	movq	%rsp, %rbp
LCFI40:
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
LM135:
	cmpq	$0, -40(%rbp)
	jne	L64
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	L64
LM136:
	movl	$-1, %eax
	jmp	L65
L64:
LM137:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movl	-44(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_bstree_find_node_by_key
	movq	%rax, -8(%rbp)
LM138:
	cmpq	$0, -8(%rbp)
	jne	L66
LM139:
	movl	$-1, %eax
	jmp	L65
L66:
LM140:
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$1, %eax
	jne	L67
LM141:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	setne	%al
	movzbl	%al, %eax
	testq	%rax, %rax
	je	L68
	leaq	lC0(%rip), %rcx
	movl	$234, %edx
	leaq	lC1(%rip), %rsi
	leaq	___func__.3684(%rip), %rdi
	call	___assert_rtn
L68:
LM142:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	_bstree_free_node
LM143:
	movq	-40(%rbp), %rax
	movq	$0, (%rax)
LM144:
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	leal	-1(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 8(%rax)
LM145:
	movl	$0, %eax
	jmp	L65
L67:
LM146:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
LM147:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	L69
LM148:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	L70
LM149:
	cmpq	$0, -16(%rbp)
	sete	%al
	movzbl	%al, %eax
	testq	%rax, %rax
	je	L71
	leaq	lC2(%rip), %rcx
	movl	$245, %edx
	leaq	lC1(%rip), %rsi
	leaq	___func__.3684(%rip), %rdi
	call	___assert_rtn
L71:
LM150:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jne	L72
LM151:
	movq	-16(%rbp), %rax
	movq	$0, (%rax)
	jmp	L77
L72:
LM152:
	movq	-16(%rbp), %rax
	movq	$0, 8(%rax)
	jmp	L77
L70:
LM153:
	cmpq	$0, -16(%rbp)
	jne	L75
LM154:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
LM155:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	$0, 16(%rax)
	jmp	L77
L75:
LM156:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jne	L76
LM157:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
LM158:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	L77
L76:
LM159:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 8(%rax)
LM160:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	L77
L69:
LM161:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	L78
LM162:
	cmpq	$0, -16(%rbp)
	jne	L79
LM163:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
LM164:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	$0, 16(%rax)
	jmp	L77
L79:
LM165:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jne	L81
LM166:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
LM167:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	L77
L81:
LM168:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 8(%rax)
LM169:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	L77
L78:
LBB5:
LM170:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_get_next_node
	movq	%rax, -24(%rbp)
LM171:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	sete	%al
	movzbl	%al, %eax
	testq	%rax, %rax
	je	L82
	leaq	lC3(%rip), %rcx
	movl	$275, %edx
	leaq	lC1(%rip), %rsi
	leaq	___func__.3684(%rip), %rdi
	call	___assert_rtn
L82:
LM172:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	cmpq	%rax, -24(%rbp)
	jne	L83
LM173:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, (%rax)
LM174:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	L84
LM175:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	16(%rdx), %rdx
	movq	%rdx, 16(%rax)
L84:
LM176:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
LM177:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
LM178:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
LM179:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
LM180:
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	L85
L83:
LM181:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
LM182:
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
L85:
LM183:
	cmpq	$0, -16(%rbp)
	jne	L77
LM184:
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
L77:
LBE5:
LM185:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_free_node
LM186:
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	leal	-1(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 8(%rax)
LM187:
	movl	$0, %eax
L65:
LM188:
	leave
LCFI41:
	ret
LFE17:
	.globl _bstree_find_by_key
_bstree_find_by_key:
LFB18:
LM189:
	pushq	%rbp
LCFI42:
	movq	%rsp, %rbp
LCFI43:
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
LM190:
	cmpq	$0, -24(%rbp)
	jne	L87
LM191:
	movl	$-1, %eax
	jmp	L88
L87:
LM192:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-28(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_bstree_find_node_by_key
	movq	%rax, -8(%rbp)
LM193:
	cmpq	$0, -8(%rbp)
	jne	L89
LM194:
	movl	$-1, %eax
	jmp	L88
L89:
LM195:
	movl	$0, %eax
L88:
LM196:
	leave
LCFI44:
	ret
LFE18:
	.globl _bstree_get_size
_bstree_get_size:
LFB19:
LM197:
	pushq	%rbp
LCFI45:
	movq	%rsp, %rbp
LCFI46:
	movq	%rdi, -8(%rbp)
LM198:
	cmpq	$0, -8(%rbp)
	jne	L91
LM199:
	movl	$-1, %eax
	jmp	L92
L91:
LM200:
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
L92:
LM201:
	popq	%rbp
LCFI47:
	ret
LFE19:
	.globl _bstree_get_first_key
_bstree_get_first_key:
LFB20:
LM202:
	pushq	%rbp
LCFI48:
	movq	%rsp, %rbp
LCFI49:
	subq	$8, %rsp
	movq	%rdi, -8(%rbp)
LM203:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	_bstree_get_first_node
	movl	24(%rax), %eax
LM204:
	leave
LCFI50:
	ret
LFE20:
	.globl _bstree_get_last_key
_bstree_get_last_key:
LFB21:
LM205:
	pushq	%rbp
LCFI51:
	movq	%rsp, %rbp
LCFI52:
	subq	$8, %rsp
	movq	%rdi, -8(%rbp)
LM206:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	_bstree_get_last_node
	movl	24(%rax), %eax
LM207:
	leave
LCFI53:
	ret
LFE21:
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
	.text
	.globl _main
_main:
LFB22:
LM208:
	pushq	%rbp
LCFI54:
	movq	%rsp, %rbp
LCFI55:
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
LM209:
	movl	$0, %eax
	call	_bstree_create
	movq	%rax, -16(%rbp)
LM210:
	movq	-16(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	call	_bstree_insert_recursion
LM211:
	movq	-16(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	call	_bstree_insert_recursion
LM212:
	movq	-16(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_bstree_insert_recursion
LM213:
	movq	-16(%rbp), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	_bstree_insert_recursion
LM214:
	movq	-16(%rbp), %rax
	movl	$3, %esi
	movq	%rax, %rdi
	call	_bstree_insert_recursion
LM215:
	movq	-16(%rbp), %rax
	movl	$9, %esi
	movq	%rax, %rdi
	call	_bstree_insert_recursion
LM216:
	movq	-16(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	call	_bstree_insert_recursion
LM217:
	movq	-16(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	_bstree_insert_recursion
LM218:
	movq	-16(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_bstree_insert_recursion
LM219:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_get_size
	movl	%eax, %esi
	leaq	lC4(%rip), %rdi
	movl	$0, %eax
	call	_printf
LM220:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_get_first_key
	movl	%eax, %esi
	leaq	lC5(%rip), %rdi
	movl	$0, %eax
	call	_printf
LM221:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_get_last_key
	movl	%eax, %esi
	leaq	lC6(%rip), %rdi
	movl	$0, %eax
	call	_printf
LM222:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	_bstree_get_first_node
	movq	%rax, -8(%rbp)
LM223:
	jmp	L98
L99:
LM224:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %esi
	leaq	lC7(%rip), %rdi
	movl	$0, %eax
	call	_printf
LM225:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_get_next_node
	movq	%rax, -8(%rbp)
L98:
LM226:
	cmpq	$0, -8(%rbp)
	jne	L99
LM227:
	movq	-16(%rbp), %rax
	movl	$3, %esi
	movq	%rax, %rdi
	call	_bstree_find_by_key
	movl	%eax, %esi
	leaq	lC8(%rip), %rdi
	movl	$0, %eax
	call	_printf
LM228:
	leaq	lC9(%rip), %rdi
	call	_puts
LM229:
	movq	-16(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	call	_bstree_insert
LM230:
	movq	-16(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	_bstree_insert
LM231:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_get_size
	movl	%eax, %esi
	leaq	lC4(%rip), %rdi
	movl	$0, %eax
	call	_printf
LM232:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_get_first_key
	movl	%eax, %esi
	leaq	lC5(%rip), %rdi
	movl	$0, %eax
	call	_printf
LM233:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_get_last_key
	movl	%eax, %esi
	leaq	lC6(%rip), %rdi
	movl	$0, %eax
	call	_printf
LM234:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	_bstree_get_first_node
	movq	%rax, -8(%rbp)
LM235:
	jmp	L100
L101:
LM236:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %esi
	leaq	lC7(%rip), %rdi
	movl	$0, %eax
	call	_printf
LM237:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_get_next_node
	movq	%rax, -8(%rbp)
L100:
LM238:
	cmpq	$0, -8(%rbp)
	jne	L101
LM239:
	leaq	lC9(%rip), %rdi
	call	_puts
LM240:
	movq	-16(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	call	_bstree_remove
LM241:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	_bstree_get_first_node
	movq	%rax, -8(%rbp)
LM242:
	jmp	L102
L103:
LM243:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %esi
	leaq	lC7(%rip), %rdi
	movl	$0, %eax
	call	_printf
LM244:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_get_next_node
	movq	%rax, -8(%rbp)
L102:
LM245:
	cmpq	$0, -8(%rbp)
	jne	L103
LM246:
	leaq	lC9(%rip), %rdi
	call	_puts
LM247:
	movq	-16(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_bstree_remove
LM248:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	_bstree_get_first_node
	movq	%rax, -8(%rbp)
LM249:
	jmp	L104
L105:
LM250:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %esi
	leaq	lC7(%rip), %rdi
	movl	$0, %eax
	call	_printf
LM251:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_get_next_node
	movq	%rax, -8(%rbp)
L104:
LM252:
	cmpq	$0, -8(%rbp)
	jne	L105
LM253:
	leaq	lC9(%rip), %rdi
	call	_puts
LM254:
	movq	-16(%rbp), %rax
	movl	$9, %esi
	movq	%rax, %rdi
	call	_bstree_remove
LM255:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	_bstree_get_first_node
	movq	%rax, -8(%rbp)
LM256:
	jmp	L106
L107:
LM257:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %esi
	leaq	lC7(%rip), %rdi
	movl	$0, %eax
	call	_printf
LM258:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_bstree_get_next_node
	movq	%rax, -8(%rbp)
L106:
LM259:
	cmpq	$0, -8(%rbp)
	jne	L107
LM260:
	movl	$0, %eax
LM261:
	leave
LCFI56:
	ret
LFE22:
	.const
	.align 3
___func__.3684:
	.ascii "bstree_remove\0"
	.section __DWARF,__debug_frame,regular,debug
Lsection__debug_frame:
Lframe0:
	.set L$set$0,LECIE0-LSCIE0
	.long L$set$0
LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.ascii "\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE0:
LSFDE0:
	.set L$set$1,LEFDE0-LASFDE0
	.long L$set$1
LASFDE0:
	.set L$set$2,Lframe0-Lsection__debug_frame
	.long L$set$2
	.quad	LFB4
	.set L$set$3,LFE4-LFB4
	.quad L$set$3
	.byte	0x4
	.set L$set$4,LCFI0-LFB4
	.long L$set$4
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$5,LCFI1-LCFI0
	.long L$set$5
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$6,LCFI2-LCFI1
	.long L$set$6
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE0:
LSFDE2:
	.set L$set$7,LEFDE2-LASFDE2
	.long L$set$7
LASFDE2:
	.set L$set$8,Lframe0-Lsection__debug_frame
	.long L$set$8
	.quad	LFB5
	.set L$set$9,LFE5-LFB5
	.quad L$set$9
	.byte	0x4
	.set L$set$10,LCFI3-LFB5
	.long L$set$10
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$11,LCFI4-LCFI3
	.long L$set$11
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$12,LCFI5-LCFI4
	.long L$set$12
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE2:
LSFDE4:
	.set L$set$13,LEFDE4-LASFDE4
	.long L$set$13
LASFDE4:
	.set L$set$14,Lframe0-Lsection__debug_frame
	.long L$set$14
	.quad	LFB6
	.set L$set$15,LFE6-LFB6
	.quad L$set$15
	.byte	0x4
	.set L$set$16,LCFI6-LFB6
	.long L$set$16
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$17,LCFI7-LCFI6
	.long L$set$17
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$18,LCFI8-LCFI7
	.long L$set$18
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE4:
LSFDE6:
	.set L$set$19,LEFDE6-LASFDE6
	.long L$set$19
LASFDE6:
	.set L$set$20,Lframe0-Lsection__debug_frame
	.long L$set$20
	.quad	LFB7
	.set L$set$21,LFE7-LFB7
	.quad L$set$21
	.byte	0x4
	.set L$set$22,LCFI9-LFB7
	.long L$set$22
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$23,LCFI10-LCFI9
	.long L$set$23
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$24,LCFI11-LCFI10
	.long L$set$24
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE6:
LSFDE8:
	.set L$set$25,LEFDE8-LASFDE8
	.long L$set$25
LASFDE8:
	.set L$set$26,Lframe0-Lsection__debug_frame
	.long L$set$26
	.quad	LFB8
	.set L$set$27,LFE8-LFB8
	.quad L$set$27
	.byte	0x4
	.set L$set$28,LCFI12-LFB8
	.long L$set$28
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$29,LCFI13-LCFI12
	.long L$set$29
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$30,LCFI14-LCFI13
	.long L$set$30
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE8:
LSFDE10:
	.set L$set$31,LEFDE10-LASFDE10
	.long L$set$31
LASFDE10:
	.set L$set$32,Lframe0-Lsection__debug_frame
	.long L$set$32
	.quad	LFB9
	.set L$set$33,LFE9-LFB9
	.quad L$set$33
	.byte	0x4
	.set L$set$34,LCFI15-LFB9
	.long L$set$34
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$35,LCFI16-LCFI15
	.long L$set$35
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$36,LCFI17-LCFI16
	.long L$set$36
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE10:
LSFDE12:
	.set L$set$37,LEFDE12-LASFDE12
	.long L$set$37
LASFDE12:
	.set L$set$38,Lframe0-Lsection__debug_frame
	.long L$set$38
	.quad	LFB10
	.set L$set$39,LFE10-LFB10
	.quad L$set$39
	.byte	0x4
	.set L$set$40,LCFI18-LFB10
	.long L$set$40
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$41,LCFI19-LCFI18
	.long L$set$41
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$42,LCFI20-LCFI19
	.long L$set$42
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE12:
LSFDE14:
	.set L$set$43,LEFDE14-LASFDE14
	.long L$set$43
LASFDE14:
	.set L$set$44,Lframe0-Lsection__debug_frame
	.long L$set$44
	.quad	LFB11
	.set L$set$45,LFE11-LFB11
	.quad L$set$45
	.byte	0x4
	.set L$set$46,LCFI21-LFB11
	.long L$set$46
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$47,LCFI22-LCFI21
	.long L$set$47
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$48,LCFI23-LCFI22
	.long L$set$48
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE14:
LSFDE16:
	.set L$set$49,LEFDE16-LASFDE16
	.long L$set$49
LASFDE16:
	.set L$set$50,Lframe0-Lsection__debug_frame
	.long L$set$50
	.quad	LFB12
	.set L$set$51,LFE12-LFB12
	.quad L$set$51
	.byte	0x4
	.set L$set$52,LCFI24-LFB12
	.long L$set$52
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$53,LCFI25-LCFI24
	.long L$set$53
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$54,LCFI26-LCFI25
	.long L$set$54
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE16:
LSFDE18:
	.set L$set$55,LEFDE18-LASFDE18
	.long L$set$55
LASFDE18:
	.set L$set$56,Lframe0-Lsection__debug_frame
	.long L$set$56
	.quad	LFB13
	.set L$set$57,LFE13-LFB13
	.quad L$set$57
	.byte	0x4
	.set L$set$58,LCFI27-LFB13
	.long L$set$58
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$59,LCFI28-LCFI27
	.long L$set$59
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$60,LCFI29-LCFI28
	.long L$set$60
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE18:
LSFDE20:
	.set L$set$61,LEFDE20-LASFDE20
	.long L$set$61
LASFDE20:
	.set L$set$62,Lframe0-Lsection__debug_frame
	.long L$set$62
	.quad	LFB14
	.set L$set$63,LFE14-LFB14
	.quad L$set$63
	.byte	0x4
	.set L$set$64,LCFI30-LFB14
	.long L$set$64
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$65,LCFI31-LCFI30
	.long L$set$65
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$66,LCFI32-LCFI31
	.long L$set$66
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE20:
LSFDE22:
	.set L$set$67,LEFDE22-LASFDE22
	.long L$set$67
LASFDE22:
	.set L$set$68,Lframe0-Lsection__debug_frame
	.long L$set$68
	.quad	LFB15
	.set L$set$69,LFE15-LFB15
	.quad L$set$69
	.byte	0x4
	.set L$set$70,LCFI33-LFB15
	.long L$set$70
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$71,LCFI34-LCFI33
	.long L$set$71
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$72,LCFI35-LCFI34
	.long L$set$72
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE22:
LSFDE24:
	.set L$set$73,LEFDE24-LASFDE24
	.long L$set$73
LASFDE24:
	.set L$set$74,Lframe0-Lsection__debug_frame
	.long L$set$74
	.quad	LFB16
	.set L$set$75,LFE16-LFB16
	.quad L$set$75
	.byte	0x4
	.set L$set$76,LCFI36-LFB16
	.long L$set$76
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$77,LCFI37-LCFI36
	.long L$set$77
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$78,LCFI38-LCFI37
	.long L$set$78
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE24:
LSFDE26:
	.set L$set$79,LEFDE26-LASFDE26
	.long L$set$79
LASFDE26:
	.set L$set$80,Lframe0-Lsection__debug_frame
	.long L$set$80
	.quad	LFB17
	.set L$set$81,LFE17-LFB17
	.quad L$set$81
	.byte	0x4
	.set L$set$82,LCFI39-LFB17
	.long L$set$82
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$83,LCFI40-LCFI39
	.long L$set$83
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$84,LCFI41-LCFI40
	.long L$set$84
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE26:
LSFDE28:
	.set L$set$85,LEFDE28-LASFDE28
	.long L$set$85
LASFDE28:
	.set L$set$86,Lframe0-Lsection__debug_frame
	.long L$set$86
	.quad	LFB18
	.set L$set$87,LFE18-LFB18
	.quad L$set$87
	.byte	0x4
	.set L$set$88,LCFI42-LFB18
	.long L$set$88
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$89,LCFI43-LCFI42
	.long L$set$89
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$90,LCFI44-LCFI43
	.long L$set$90
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE28:
LSFDE30:
	.set L$set$91,LEFDE30-LASFDE30
	.long L$set$91
LASFDE30:
	.set L$set$92,Lframe0-Lsection__debug_frame
	.long L$set$92
	.quad	LFB19
	.set L$set$93,LFE19-LFB19
	.quad L$set$93
	.byte	0x4
	.set L$set$94,LCFI45-LFB19
	.long L$set$94
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$95,LCFI46-LCFI45
	.long L$set$95
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$96,LCFI47-LCFI46
	.long L$set$96
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE30:
LSFDE32:
	.set L$set$97,LEFDE32-LASFDE32
	.long L$set$97
LASFDE32:
	.set L$set$98,Lframe0-Lsection__debug_frame
	.long L$set$98
	.quad	LFB20
	.set L$set$99,LFE20-LFB20
	.quad L$set$99
	.byte	0x4
	.set L$set$100,LCFI48-LFB20
	.long L$set$100
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$101,LCFI49-LCFI48
	.long L$set$101
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$102,LCFI50-LCFI49
	.long L$set$102
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE32:
LSFDE34:
	.set L$set$103,LEFDE34-LASFDE34
	.long L$set$103
LASFDE34:
	.set L$set$104,Lframe0-Lsection__debug_frame
	.long L$set$104
	.quad	LFB21
	.set L$set$105,LFE21-LFB21
	.quad L$set$105
	.byte	0x4
	.set L$set$106,LCFI51-LFB21
	.long L$set$106
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$107,LCFI52-LCFI51
	.long L$set$107
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$108,LCFI53-LCFI52
	.long L$set$108
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE34:
LSFDE36:
	.set L$set$109,LEFDE36-LASFDE36
	.long L$set$109
LASFDE36:
	.set L$set$110,Lframe0-Lsection__debug_frame
	.long L$set$110
	.quad	LFB22
	.set L$set$111,LFE22-LFB22
	.quad L$set$111
	.byte	0x4
	.set L$set$112,LCFI54-LFB22
	.long L$set$112
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$113,LCFI55-LCFI54
	.long L$set$113
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$114,LCFI56-LCFI55
	.long L$set$114
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE36:
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$115,LECIE1-LSCIE1
	.long L$set$115
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
LSFDE39:
	.set L$set$116,LEFDE39-LASFDE39
	.long L$set$116
LASFDE39:
	.long	LASFDE39-EH_frame1
	.quad	LFB4-.
	.set L$set$117,LFE4-LFB4
	.quad L$set$117
	.byte	0
	.byte	0x4
	.set L$set$118,LCFI0-LFB4
	.long L$set$118
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$119,LCFI1-LCFI0
	.long L$set$119
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$120,LCFI2-LCFI1
	.long L$set$120
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE39:
LSFDE41:
	.set L$set$121,LEFDE41-LASFDE41
	.long L$set$121
LASFDE41:
	.long	LASFDE41-EH_frame1
	.quad	LFB5-.
	.set L$set$122,LFE5-LFB5
	.quad L$set$122
	.byte	0
	.byte	0x4
	.set L$set$123,LCFI3-LFB5
	.long L$set$123
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$124,LCFI4-LCFI3
	.long L$set$124
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$125,LCFI5-LCFI4
	.long L$set$125
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE41:
LSFDE43:
	.set L$set$126,LEFDE43-LASFDE43
	.long L$set$126
LASFDE43:
	.long	LASFDE43-EH_frame1
	.quad	LFB6-.
	.set L$set$127,LFE6-LFB6
	.quad L$set$127
	.byte	0
	.byte	0x4
	.set L$set$128,LCFI6-LFB6
	.long L$set$128
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$129,LCFI7-LCFI6
	.long L$set$129
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$130,LCFI8-LCFI7
	.long L$set$130
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE43:
LSFDE45:
	.set L$set$131,LEFDE45-LASFDE45
	.long L$set$131
LASFDE45:
	.long	LASFDE45-EH_frame1
	.quad	LFB7-.
	.set L$set$132,LFE7-LFB7
	.quad L$set$132
	.byte	0
	.byte	0x4
	.set L$set$133,LCFI9-LFB7
	.long L$set$133
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$134,LCFI10-LCFI9
	.long L$set$134
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$135,LCFI11-LCFI10
	.long L$set$135
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE45:
LSFDE47:
	.set L$set$136,LEFDE47-LASFDE47
	.long L$set$136
LASFDE47:
	.long	LASFDE47-EH_frame1
	.quad	LFB8-.
	.set L$set$137,LFE8-LFB8
	.quad L$set$137
	.byte	0
	.byte	0x4
	.set L$set$138,LCFI12-LFB8
	.long L$set$138
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$139,LCFI13-LCFI12
	.long L$set$139
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$140,LCFI14-LCFI13
	.long L$set$140
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE47:
LSFDE49:
	.set L$set$141,LEFDE49-LASFDE49
	.long L$set$141
LASFDE49:
	.long	LASFDE49-EH_frame1
	.quad	LFB9-.
	.set L$set$142,LFE9-LFB9
	.quad L$set$142
	.byte	0
	.byte	0x4
	.set L$set$143,LCFI15-LFB9
	.long L$set$143
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$144,LCFI16-LCFI15
	.long L$set$144
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$145,LCFI17-LCFI16
	.long L$set$145
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE49:
LSFDE51:
	.set L$set$146,LEFDE51-LASFDE51
	.long L$set$146
LASFDE51:
	.long	LASFDE51-EH_frame1
	.quad	LFB10-.
	.set L$set$147,LFE10-LFB10
	.quad L$set$147
	.byte	0
	.byte	0x4
	.set L$set$148,LCFI18-LFB10
	.long L$set$148
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$149,LCFI19-LCFI18
	.long L$set$149
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$150,LCFI20-LCFI19
	.long L$set$150
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE51:
LSFDE53:
	.set L$set$151,LEFDE53-LASFDE53
	.long L$set$151
LASFDE53:
	.long	LASFDE53-EH_frame1
	.quad	LFB11-.
	.set L$set$152,LFE11-LFB11
	.quad L$set$152
	.byte	0
	.byte	0x4
	.set L$set$153,LCFI21-LFB11
	.long L$set$153
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$154,LCFI22-LCFI21
	.long L$set$154
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$155,LCFI23-LCFI22
	.long L$set$155
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE53:
LSFDE55:
	.set L$set$156,LEFDE55-LASFDE55
	.long L$set$156
LASFDE55:
	.long	LASFDE55-EH_frame1
	.quad	LFB12-.
	.set L$set$157,LFE12-LFB12
	.quad L$set$157
	.byte	0
	.byte	0x4
	.set L$set$158,LCFI24-LFB12
	.long L$set$158
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$159,LCFI25-LCFI24
	.long L$set$159
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$160,LCFI26-LCFI25
	.long L$set$160
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE55:
LSFDE57:
	.set L$set$161,LEFDE57-LASFDE57
	.long L$set$161
LASFDE57:
	.long	LASFDE57-EH_frame1
	.quad	LFB13-.
	.set L$set$162,LFE13-LFB13
	.quad L$set$162
	.byte	0
	.byte	0x4
	.set L$set$163,LCFI27-LFB13
	.long L$set$163
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$164,LCFI28-LCFI27
	.long L$set$164
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$165,LCFI29-LCFI28
	.long L$set$165
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE57:
LSFDE59:
	.set L$set$166,LEFDE59-LASFDE59
	.long L$set$166
LASFDE59:
	.long	LASFDE59-EH_frame1
	.quad	LFB14-.
	.set L$set$167,LFE14-LFB14
	.quad L$set$167
	.byte	0
	.byte	0x4
	.set L$set$168,LCFI30-LFB14
	.long L$set$168
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$169,LCFI31-LCFI30
	.long L$set$169
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$170,LCFI32-LCFI31
	.long L$set$170
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE59:
LSFDE61:
	.set L$set$171,LEFDE61-LASFDE61
	.long L$set$171
LASFDE61:
	.long	LASFDE61-EH_frame1
	.quad	LFB15-.
	.set L$set$172,LFE15-LFB15
	.quad L$set$172
	.byte	0
	.byte	0x4
	.set L$set$173,LCFI33-LFB15
	.long L$set$173
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$174,LCFI34-LCFI33
	.long L$set$174
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$175,LCFI35-LCFI34
	.long L$set$175
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE61:
LSFDE63:
	.set L$set$176,LEFDE63-LASFDE63
	.long L$set$176
LASFDE63:
	.long	LASFDE63-EH_frame1
	.quad	LFB16-.
	.set L$set$177,LFE16-LFB16
	.quad L$set$177
	.byte	0
	.byte	0x4
	.set L$set$178,LCFI36-LFB16
	.long L$set$178
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$179,LCFI37-LCFI36
	.long L$set$179
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$180,LCFI38-LCFI37
	.long L$set$180
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE63:
LSFDE65:
	.set L$set$181,LEFDE65-LASFDE65
	.long L$set$181
LASFDE65:
	.long	LASFDE65-EH_frame1
	.quad	LFB17-.
	.set L$set$182,LFE17-LFB17
	.quad L$set$182
	.byte	0
	.byte	0x4
	.set L$set$183,LCFI39-LFB17
	.long L$set$183
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$184,LCFI40-LCFI39
	.long L$set$184
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$185,LCFI41-LCFI40
	.long L$set$185
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE65:
LSFDE67:
	.set L$set$186,LEFDE67-LASFDE67
	.long L$set$186
LASFDE67:
	.long	LASFDE67-EH_frame1
	.quad	LFB18-.
	.set L$set$187,LFE18-LFB18
	.quad L$set$187
	.byte	0
	.byte	0x4
	.set L$set$188,LCFI42-LFB18
	.long L$set$188
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$189,LCFI43-LCFI42
	.long L$set$189
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$190,LCFI44-LCFI43
	.long L$set$190
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE67:
LSFDE69:
	.set L$set$191,LEFDE69-LASFDE69
	.long L$set$191
LASFDE69:
	.long	LASFDE69-EH_frame1
	.quad	LFB19-.
	.set L$set$192,LFE19-LFB19
	.quad L$set$192
	.byte	0
	.byte	0x4
	.set L$set$193,LCFI45-LFB19
	.long L$set$193
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$194,LCFI46-LCFI45
	.long L$set$194
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$195,LCFI47-LCFI46
	.long L$set$195
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE69:
LSFDE71:
	.set L$set$196,LEFDE71-LASFDE71
	.long L$set$196
LASFDE71:
	.long	LASFDE71-EH_frame1
	.quad	LFB20-.
	.set L$set$197,LFE20-LFB20
	.quad L$set$197
	.byte	0
	.byte	0x4
	.set L$set$198,LCFI48-LFB20
	.long L$set$198
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$199,LCFI49-LCFI48
	.long L$set$199
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$200,LCFI50-LCFI49
	.long L$set$200
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE71:
LSFDE73:
	.set L$set$201,LEFDE73-LASFDE73
	.long L$set$201
LASFDE73:
	.long	LASFDE73-EH_frame1
	.quad	LFB21-.
	.set L$set$202,LFE21-LFB21
	.quad L$set$202
	.byte	0
	.byte	0x4
	.set L$set$203,LCFI51-LFB21
	.long L$set$203
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$204,LCFI52-LCFI51
	.long L$set$204
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$205,LCFI53-LCFI52
	.long L$set$205
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE73:
LSFDE75:
	.set L$set$206,LEFDE75-LASFDE75
	.long L$set$206
LASFDE75:
	.long	LASFDE75-EH_frame1
	.quad	LFB22-.
	.set L$set$207,LFE22-LFB22
	.quad L$set$207
	.byte	0
	.byte	0x4
	.set L$set$208,LCFI54-LFB22
	.long L$set$208
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$209,LCFI55-LCFI54
	.long L$set$209
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$210,LCFI56-LCFI55
	.long L$set$210
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE75:
	.text
Letext0:
	.section __DWARF,__debug_info,regular,debug
Lsection__debug_info:
Ldebug_info0:
	.long	0xbe1
	.word	0x2
	.set L$set$211,Ldebug_abbrev0-Lsection__debug_abbrev
	.long L$set$211
	.byte	0x8
	.byte	0x1
	.ascii "GNU C11 7.2.0 -fPIC -feliminate-unused-debug-symbols -mmacosx-version-min=10.13.3 -mtune=core2 -g\0"
	.byte	0x1
	.ascii "bstree.c\0"
	.ascii "/Users/Jagen/datastruct/tree/bstree\0"
	.quad	Ltext0
	.quad	Letext0
	.set L$set$212,Ldebug_line0-Lsection__debug_line
	.long L$set$212
	.byte	0x1
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.byte	0x3
	.long	0xf4
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.byte	0x4
	.ascii "__int64_t\0"
	.byte	0x2
	.byte	0x2e
	.long	0x121
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.ascii "long int\0"
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.ascii "long unsigned int\0"
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.byte	0x3
	.long	0x16d
	.byte	0x5
	.byte	0x8
	.byte	0x4
	.ascii "__darwin_off_t\0"
	.byte	0x3
	.byte	0x47
	.long	0x110
	.byte	0x4
	.ascii "fpos_t\0"
	.byte	0x4
	.byte	0x4d
	.long	0x17c
	.byte	0x6
	.ascii "__sbuf\0"
	.byte	0x10
	.byte	0x4
	.byte	0x58
	.long	0x1d0
	.byte	0x7
	.ascii "_base\0"
	.byte	0x4
	.byte	0x59
	.long	0x1d0
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0x7
	.ascii "_size\0"
	.byte	0x4
	.byte	0x5a
	.long	0xf4
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0
	.byte	0x8
	.byte	0x8
	.long	0xc0
	.byte	0x6
	.ascii "__sFILE\0"
	.byte	0x98
	.byte	0x4
	.byte	0x7a
	.long	0x326
	.byte	0x7
	.ascii "_p\0"
	.byte	0x4
	.byte	0x7b
	.long	0x1d0
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0x7
	.ascii "_r\0"
	.byte	0x4
	.byte	0x7c
	.long	0xf4
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x7
	.ascii "_w\0"
	.byte	0x4
	.byte	0x7d
	.long	0xf4
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x7
	.ascii "_flags\0"
	.byte	0x4
	.byte	0x7e
	.long	0xd1
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x7
	.ascii "_file\0"
	.byte	0x4
	.byte	0x7f
	.long	0xd1
	.byte	0x2
	.byte	0x23
	.byte	0x12
	.byte	0x7
	.ascii "_bf\0"
	.byte	0x4
	.byte	0x80
	.long	0x1a0
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x7
	.ascii "_lbfsize\0"
	.byte	0x4
	.byte	0x81
	.long	0xf4
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0x7
	.ascii "_cookie\0"
	.byte	0x4
	.byte	0x84
	.long	0x17a
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0x7
	.ascii "_close\0"
	.byte	0x4
	.byte	0x85
	.long	0x336
	.byte	0x2
	.byte	0x23
	.byte	0x38
	.byte	0x7
	.ascii "_read\0"
	.byte	0x4
	.byte	0x86
	.long	0x35c
	.byte	0x2
	.byte	0x23
	.byte	0x40
	.byte	0x7
	.ascii "_seek\0"
	.byte	0x4
	.byte	0x87
	.long	0x37c
	.byte	0x2
	.byte	0x23
	.byte	0x48
	.byte	0x7
	.ascii "_write\0"
	.byte	0x4
	.byte	0x88
	.long	0x3a7
	.byte	0x2
	.byte	0x23
	.byte	0x50
	.byte	0x7
	.ascii "_ub\0"
	.byte	0x4
	.byte	0x8b
	.long	0x1a0
	.byte	0x2
	.byte	0x23
	.byte	0x58
	.byte	0x7
	.ascii "_extra\0"
	.byte	0x4
	.byte	0x8c
	.long	0x3b8
	.byte	0x2
	.byte	0x23
	.byte	0x68
	.byte	0x7
	.ascii "_ur\0"
	.byte	0x4
	.byte	0x8d
	.long	0xf4
	.byte	0x2
	.byte	0x23
	.byte	0x70
	.byte	0x7
	.ascii "_ubuf\0"
	.byte	0x4
	.byte	0x90
	.long	0x3be
	.byte	0x2
	.byte	0x23
	.byte	0x74
	.byte	0x7
	.ascii "_nbuf\0"
	.byte	0x4
	.byte	0x91
	.long	0x3ce
	.byte	0x2
	.byte	0x23
	.byte	0x77
	.byte	0x7
	.ascii "_lb\0"
	.byte	0x4
	.byte	0x94
	.long	0x1a0
	.byte	0x2
	.byte	0x23
	.byte	0x78
	.byte	0x7
	.ascii "_blksize\0"
	.byte	0x4
	.byte	0x97
	.long	0xf4
	.byte	0x3
	.byte	0x23
	.byte	0x88,0x1
	.byte	0x7
	.ascii "_offset\0"
	.byte	0x4
	.byte	0x98
	.long	0x192
	.byte	0x3
	.byte	0x23
	.byte	0x90,0x1
	.byte	0
	.byte	0x9
	.byte	0x1
	.long	0xf4
	.long	0x336
	.byte	0xa
	.long	0x17a
	.byte	0
	.byte	0x8
	.byte	0x8
	.long	0x326
	.byte	0x9
	.byte	0x1
	.long	0xf4
	.long	0x356
	.byte	0xa
	.long	0x17a
	.byte	0xa
	.long	0x356
	.byte	0xa
	.long	0xf4
	.byte	0
	.byte	0x8
	.byte	0x8
	.long	0x16d
	.byte	0x8
	.byte	0x8
	.long	0x33c
	.byte	0x9
	.byte	0x1
	.long	0x192
	.long	0x37c
	.byte	0xa
	.long	0x17a
	.byte	0xa
	.long	0x192
	.byte	0xa
	.long	0xf4
	.byte	0
	.byte	0x8
	.byte	0x8
	.long	0x362
	.byte	0x9
	.byte	0x1
	.long	0xf4
	.long	0x39c
	.byte	0xa
	.long	0x17a
	.byte	0xa
	.long	0x39c
	.byte	0xa
	.long	0xf4
	.byte	0
	.byte	0x8
	.byte	0x8
	.long	0x175
	.byte	0x3
	.long	0x39c
	.byte	0x8
	.byte	0x8
	.long	0x382
	.byte	0xb
	.ascii "__sFILEX\0"
	.byte	0x1
	.byte	0x8
	.byte	0x8
	.long	0x3ad
	.byte	0xc
	.long	0xc0
	.long	0x3ce
	.byte	0xd
	.long	0x158
	.byte	0x2
	.byte	0
	.byte	0xc
	.long	0xc0
	.long	0x3de
	.byte	0xd
	.long	0x158
	.byte	0
	.byte	0
	.byte	0x4
	.ascii "FILE\0"
	.byte	0x4
	.byte	0x99
	.long	0x1d6
	.byte	0xe
	.ascii "__stdinp\0"
	.byte	0x4
	.byte	0x9c
	.long	0x3fc
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.byte	0x8
	.long	0x3de
	.byte	0xe
	.ascii "__stdoutp\0"
	.byte	0x4
	.byte	0x9d
	.long	0x3fc
	.byte	0x1
	.byte	0x1
	.byte	0xe
	.ascii "__stderrp\0"
	.byte	0x4
	.byte	0x9e
	.long	0x3fc
	.byte	0x1
	.byte	0x1
	.byte	0xf
	.ascii "sys_nerr\0"
	.byte	0x4
	.word	0x1cc
	.long	0xfb
	.byte	0x1
	.byte	0x1
	.byte	0xc
	.long	0x3a2
	.long	0x446
	.byte	0x10
	.byte	0
	.byte	0x3
	.long	0x43b
	.byte	0xf
	.ascii "sys_errlist\0"
	.byte	0x4
	.word	0x1cd
	.long	0x446
	.byte	0x1
	.byte	0x1
	.byte	0xe
	.ascii "__mb_cur_max\0"
	.byte	0x5
	.byte	0x75
	.long	0xf4
	.byte	0x1
	.byte	0x1
	.byte	0xf
	.ascii "suboptarg\0"
	.byte	0x5
	.word	0x155
	.long	0x356
	.byte	0x1
	.byte	0x1
	.byte	0x4
	.ascii "BSTree\0"
	.byte	0x6
	.byte	0x8
	.long	0x499
	.byte	0x6
	.ascii "_bstree\0"
	.byte	0x10
	.byte	0x1
	.byte	0x8
	.long	0x4c8
	.byte	0x7
	.ascii "root\0"
	.byte	0x1
	.byte	0x9
	.long	0x512
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0x7
	.ascii "size\0"
	.byte	0x1
	.byte	0xa
	.long	0xf4
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0
	.byte	0x6
	.ascii "_node\0"
	.byte	0x20
	.byte	0x1
	.byte	0xd
	.long	0x512
	.byte	0x7
	.ascii "left\0"
	.byte	0x1
	.byte	0xe
	.long	0x512
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0x7
	.ascii "right\0"
	.byte	0x1
	.byte	0xf
	.long	0x512
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x11
	.set L$set$213,LASF0-Lsection__debug_str
	.long L$set$213
	.byte	0x1
	.byte	0x10
	.long	0x512
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x7
	.ascii "key\0"
	.byte	0x1
	.byte	0x11
	.long	0xf4
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0
	.byte	0x8
	.byte	0x8
	.long	0x4c8
	.byte	0x12
	.byte	0x1
	.ascii "main\0"
	.byte	0x1
	.word	0x14b
	.byte	0x1
	.long	0xf4
	.quad	LFB22
	.quad	LFE22
	.set L$set$214,LLST18-Lsection__debug_loc
	.long L$set$214
	.long	0x57e
	.byte	0x13
	.ascii "argc\0"
	.byte	0x1
	.word	0x14b
	.long	0xf4
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x13
	.ascii "argv\0"
	.byte	0x1
	.word	0x14b
	.long	0x57e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x14
	.set L$set$215,LASF1-Lsection__debug_str
	.long L$set$215
	.byte	0x1
	.word	0x14d
	.long	0x584
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x14
	.set L$set$216,LASF2-Lsection__debug_str
	.long L$set$216
	.byte	0x1
	.word	0x15b
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x8
	.byte	0x8
	.long	0x356
	.byte	0x8
	.byte	0x8
	.long	0x48b
	.byte	0x12
	.byte	0x1
	.ascii "bstree_get_last_key\0"
	.byte	0x1
	.word	0x146
	.byte	0x1
	.long	0xf4
	.quad	LFB21
	.quad	LFE21
	.set L$set$217,LLST17-Lsection__debug_loc
	.long L$set$217
	.long	0x5d0
	.byte	0x15
	.set L$set$218,LASF1-Lsection__debug_str
	.long L$set$218
	.byte	0x1
	.word	0x146
	.long	0x584
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x12
	.byte	0x1
	.ascii "bstree_get_first_key\0"
	.byte	0x1
	.word	0x141
	.byte	0x1
	.long	0xf4
	.quad	LFB20
	.quad	LFE20
	.set L$set$219,LLST16-Lsection__debug_loc
	.long L$set$219
	.long	0x617
	.byte	0x15
	.set L$set$220,LASF1-Lsection__debug_str
	.long L$set$220
	.byte	0x1
	.word	0x141
	.long	0x584
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x12
	.byte	0x1
	.ascii "bstree_get_size\0"
	.byte	0x1
	.word	0x139
	.byte	0x1
	.long	0xf4
	.quad	LFB19
	.quad	LFE19
	.set L$set$221,LLST15-Lsection__debug_loc
	.long L$set$221
	.long	0x659
	.byte	0x15
	.set L$set$222,LASF1-Lsection__debug_str
	.long L$set$222
	.byte	0x1
	.word	0x139
	.long	0x584
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x12
	.byte	0x1
	.ascii "bstree_find_by_key\0"
	.byte	0x1
	.word	0x12d
	.byte	0x1
	.long	0xf4
	.quad	LFB18
	.quad	LFE18
	.set L$set$223,LLST14-Lsection__debug_loc
	.long L$set$223
	.long	0x6bc
	.byte	0x15
	.set L$set$224,LASF1-Lsection__debug_str
	.long L$set$224
	.byte	0x1
	.word	0x12d
	.long	0x584
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x13
	.ascii "key\0"
	.byte	0x1
	.word	0x12d
	.long	0xf4
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x14
	.set L$set$225,LASF2-Lsection__debug_str
	.long L$set$225
	.byte	0x1
	.word	0x132
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x16
	.byte	0x1
	.ascii "bstree_remove\0"
	.byte	0x1
	.byte	0xe0
	.byte	0x1
	.long	0xf4
	.quad	LFB17
	.quad	LFE17
	.set L$set$226,LLST13-Lsection__debug_loc
	.long L$set$226
	.long	0x75c
	.byte	0x17
	.set L$set$227,LASF1-Lsection__debug_str
	.long L$set$227
	.byte	0x1
	.byte	0xe0
	.long	0x584
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x18
	.ascii "key\0"
	.byte	0x1
	.byte	0xe0
	.long	0xf4
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0x19
	.set L$set$228,LASF2-Lsection__debug_str
	.long L$set$228
	.byte	0x1
	.byte	0xe5
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1a
	.ascii "__func__\0"
	.long	0x76c
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	___func__.3684
	.byte	0x1b
	.ascii "p\0"
	.byte	0x1
	.byte	0xf1
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1c
	.quad	LBB5
	.quad	LBE5
	.byte	0x1d
	.ascii "tmp\0"
	.byte	0x1
	.word	0x112
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.byte	0xc
	.long	0x175
	.long	0x76c
	.byte	0xd
	.long	0x158
	.byte	0xd
	.byte	0
	.byte	0x3
	.long	0x75c
	.byte	0x16
	.byte	0x1
	.ascii "bstree_insert\0"
	.byte	0x1
	.byte	0xb3
	.byte	0x1
	.long	0xf4
	.quad	LFB16
	.quad	LFE16
	.set L$set$229,LLST12-Lsection__debug_loc
	.long L$set$229
	.long	0x7cb
	.byte	0x17
	.set L$set$230,LASF1-Lsection__debug_str
	.long L$set$230
	.byte	0x1
	.byte	0xb3
	.long	0x584
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x18
	.ascii "key\0"
	.byte	0x1
	.byte	0xb3
	.long	0xf4
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x19
	.set L$set$231,LASF2-Lsection__debug_str
	.long L$set$231
	.byte	0x1
	.byte	0xc0
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1e
	.byte	0x1
	.ascii "bstree_create\0"
	.byte	0x1
	.byte	0xa7
	.long	0x584
	.quad	LFB15
	.quad	LFE15
	.set L$set$232,LLST11-Lsection__debug_loc
	.long L$set$232
	.long	0x808
	.byte	0x19
	.set L$set$233,LASF1-Lsection__debug_str
	.long L$set$233
	.byte	0x1
	.byte	0xa9
	.long	0x584
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1f
	.ascii "bstree_find_node_by_key\0"
	.byte	0x1
	.byte	0x95
	.byte	0x1
	.long	0x512
	.quad	LFB14
	.quad	LFE14
	.set L$set$234,LLST10-Lsection__debug_loc
	.long L$set$234
	.long	0x86c
	.byte	0x18
	.ascii "root\0"
	.byte	0x1
	.byte	0x95
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x18
	.ascii "key\0"
	.byte	0x1
	.byte	0x95
	.long	0xf4
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x19
	.set L$set$235,LASF2-Lsection__debug_str
	.long L$set$235
	.byte	0x1
	.byte	0x9a
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1f
	.ascii "bstree_get_next_node\0"
	.byte	0x1
	.byte	0x7f
	.byte	0x1
	.long	0x512
	.quad	LFB13
	.quad	LFE13
	.set L$set$236,LLST9-Lsection__debug_loc
	.long L$set$236
	.long	0x8ce
	.byte	0x17
	.set L$set$237,LASF2-Lsection__debug_str
	.long L$set$237
	.byte	0x1
	.byte	0x7f
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1c
	.quad	LBB4
	.quad	LBE4
	.byte	0x1b
	.ascii "p\0"
	.byte	0x1
	.byte	0x86
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x1
	.ascii "bstree_insert_recursion\0"
	.byte	0x1
	.byte	0x7a
	.byte	0x1
	.quad	LFB12
	.quad	LFE12
	.set L$set$238,LLST8-Lsection__debug_loc
	.long L$set$238
	.long	0x920
	.byte	0x17
	.set L$set$239,LASF1-Lsection__debug_str
	.long L$set$239
	.byte	0x1
	.byte	0x7a
	.long	0x920
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.ascii "key\0"
	.byte	0x1
	.byte	0x7a
	.long	0xf4
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0x8
	.byte	0x8
	.long	0x499
	.byte	0x20
	.byte	0x1
	.ascii "bstree_insert_recursion_a\0"
	.byte	0x1
	.byte	0x75
	.byte	0x1
	.quad	LFB11
	.quad	LFE11
	.set L$set$240,LLST7-Lsection__debug_loc
	.long L$set$240
	.long	0x97a
	.byte	0x17
	.set L$set$241,LASF1-Lsection__debug_str
	.long L$set$241
	.byte	0x1
	.byte	0x75
	.long	0x920
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.ascii "key\0"
	.byte	0x1
	.byte	0x75
	.long	0xf4
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0x21
	.ascii "_bstree_insert\0"
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.quad	LFB10
	.quad	LFE10
	.set L$set$242,LLST6-Lsection__debug_loc
	.long L$set$242
	.long	0x9d0
	.byte	0x17
	.set L$set$243,LASF2-Lsection__debug_str
	.long L$set$243
	.byte	0x1
	.byte	0x66
	.long	0x9d0
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x17
	.set L$set$244,LASF0-Lsection__debug_str
	.long L$set$244
	.byte	0x1
	.byte	0x66
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x18
	.ascii "key\0"
	.byte	0x1
	.byte	0x66
	.long	0xf4
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0x8
	.byte	0x8
	.long	0x512
	.byte	0x1f
	.ascii "__bstree_insert_a\0"
	.byte	0x1
	.byte	0x57
	.byte	0x1
	.long	0x512
	.quad	LFB9
	.quad	LFE9
	.set L$set$245,LLST5-Lsection__debug_loc
	.long L$set$245
	.long	0xa53
	.byte	0x17
	.set L$set$246,LASF2-Lsection__debug_str
	.long L$set$246
	.byte	0x1
	.byte	0x57
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x17
	.set L$set$247,LASF0-Lsection__debug_str
	.long L$set$247
	.byte	0x1
	.byte	0x58
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x18
	.ascii "key\0"
	.byte	0x1
	.byte	0x58
	.long	0xf4
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x1c
	.quad	LBB3
	.quad	LBE3
	.byte	0x1b
	.ascii "new\0"
	.byte	0x1
	.byte	0x5b
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x1f
	.ascii "bstree_get_prev_node\0"
	.byte	0x1
	.byte	0x42
	.byte	0x1
	.long	0x512
	.quad	LFB8
	.quad	LFE8
	.set L$set$248,LLST4-Lsection__debug_loc
	.long L$set$248
	.long	0xab5
	.byte	0x17
	.set L$set$249,LASF2-Lsection__debug_str
	.long L$set$249
	.byte	0x1
	.byte	0x42
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1c
	.quad	LBB2
	.quad	LBE2
	.byte	0x1b
	.ascii "p\0"
	.byte	0x1
	.byte	0x49
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x1f
	.ascii "bstree_get_last_node\0"
	.byte	0x1
	.byte	0x35
	.byte	0x1
	.long	0x512
	.quad	LFB7
	.quad	LFE7
	.set L$set$250,LLST3-Lsection__debug_loc
	.long L$set$250
	.long	0xb08
	.byte	0x18
	.ascii "root\0"
	.byte	0x1
	.byte	0x35
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x19
	.set L$set$251,LASF2-Lsection__debug_str
	.long L$set$251
	.byte	0x1
	.byte	0x37
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1f
	.ascii "bstree_get_first_node\0"
	.byte	0x1
	.byte	0x28
	.byte	0x1
	.long	0x512
	.quad	LFB6
	.quad	LFE6
	.set L$set$252,LLST2-Lsection__debug_loc
	.long L$set$252
	.long	0xb5c
	.byte	0x18
	.ascii "root\0"
	.byte	0x1
	.byte	0x28
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x19
	.set L$set$253,LASF2-Lsection__debug_str
	.long L$set$253
	.byte	0x1
	.byte	0x2a
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x21
	.ascii "bstree_free_node\0"
	.byte	0x1
	.byte	0x22
	.byte	0x1
	.quad	LFB5
	.quad	LFE5
	.set L$set$254,LLST1-Lsection__debug_loc
	.long L$set$254
	.long	0xb98
	.byte	0x17
	.set L$set$255,LASF2-Lsection__debug_str
	.long L$set$255
	.byte	0x1
	.byte	0x22
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x22
	.ascii "bstree_create_node\0"
	.byte	0x1
	.byte	0x15
	.byte	0x1
	.long	0x512
	.quad	LFB4
	.quad	LFE4
	.set L$set$256,LLST0-Lsection__debug_loc
	.long L$set$256
	.byte	0x18
	.ascii "key\0"
	.byte	0x1
	.byte	0x15
	.long	0xf4
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x19
	.set L$set$257,LASF2-Lsection__debug_str
	.long L$set$257
	.byte	0x1
	.byte	0x17
	.long	0x512
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.section __DWARF,__debug_abbrev,regular,debug
Lsection__debug_abbrev:
Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0x8
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0x1b
	.byte	0x8
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.byte	0xb4,0x42
	.byte	0xc
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3c
	.byte	0xc
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0xc
	.byte	0x3c
	.byte	0xc
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0xc
	.byte	0x3c
	.byte	0xc
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0x34
	.byte	0xc
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0
	.section __DWARF,__debug_loc,regular,debug
Lsection__debug_loc:
Ldebug_loc0:
LLST18:
	.set L$set$258,LFB22-Ltext0
	.quad L$set$258
	.set L$set$259,LCFI54-Ltext0
	.quad L$set$259
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$260,LCFI54-Ltext0
	.quad L$set$260
	.set L$set$261,LCFI55-Ltext0
	.quad L$set$261
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$262,LCFI55-Ltext0
	.quad L$set$262
	.set L$set$263,LCFI56-Ltext0
	.quad L$set$263
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$264,LCFI56-Ltext0
	.quad L$set$264
	.set L$set$265,LFE22-Ltext0
	.quad L$set$265
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST17:
	.set L$set$266,LFB21-Ltext0
	.quad L$set$266
	.set L$set$267,LCFI51-Ltext0
	.quad L$set$267
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$268,LCFI51-Ltext0
	.quad L$set$268
	.set L$set$269,LCFI52-Ltext0
	.quad L$set$269
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$270,LCFI52-Ltext0
	.quad L$set$270
	.set L$set$271,LCFI53-Ltext0
	.quad L$set$271
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$272,LCFI53-Ltext0
	.quad L$set$272
	.set L$set$273,LFE21-Ltext0
	.quad L$set$273
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST16:
	.set L$set$274,LFB20-Ltext0
	.quad L$set$274
	.set L$set$275,LCFI48-Ltext0
	.quad L$set$275
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$276,LCFI48-Ltext0
	.quad L$set$276
	.set L$set$277,LCFI49-Ltext0
	.quad L$set$277
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$278,LCFI49-Ltext0
	.quad L$set$278
	.set L$set$279,LCFI50-Ltext0
	.quad L$set$279
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$280,LCFI50-Ltext0
	.quad L$set$280
	.set L$set$281,LFE20-Ltext0
	.quad L$set$281
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST15:
	.set L$set$282,LFB19-Ltext0
	.quad L$set$282
	.set L$set$283,LCFI45-Ltext0
	.quad L$set$283
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$284,LCFI45-Ltext0
	.quad L$set$284
	.set L$set$285,LCFI46-Ltext0
	.quad L$set$285
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$286,LCFI46-Ltext0
	.quad L$set$286
	.set L$set$287,LCFI47-Ltext0
	.quad L$set$287
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$288,LCFI47-Ltext0
	.quad L$set$288
	.set L$set$289,LFE19-Ltext0
	.quad L$set$289
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST14:
	.set L$set$290,LFB18-Ltext0
	.quad L$set$290
	.set L$set$291,LCFI42-Ltext0
	.quad L$set$291
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$292,LCFI42-Ltext0
	.quad L$set$292
	.set L$set$293,LCFI43-Ltext0
	.quad L$set$293
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$294,LCFI43-Ltext0
	.quad L$set$294
	.set L$set$295,LCFI44-Ltext0
	.quad L$set$295
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$296,LCFI44-Ltext0
	.quad L$set$296
	.set L$set$297,LFE18-Ltext0
	.quad L$set$297
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST13:
	.set L$set$298,LFB17-Ltext0
	.quad L$set$298
	.set L$set$299,LCFI39-Ltext0
	.quad L$set$299
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$300,LCFI39-Ltext0
	.quad L$set$300
	.set L$set$301,LCFI40-Ltext0
	.quad L$set$301
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$302,LCFI40-Ltext0
	.quad L$set$302
	.set L$set$303,LCFI41-Ltext0
	.quad L$set$303
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$304,LCFI41-Ltext0
	.quad L$set$304
	.set L$set$305,LFE17-Ltext0
	.quad L$set$305
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST12:
	.set L$set$306,LFB16-Ltext0
	.quad L$set$306
	.set L$set$307,LCFI36-Ltext0
	.quad L$set$307
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$308,LCFI36-Ltext0
	.quad L$set$308
	.set L$set$309,LCFI37-Ltext0
	.quad L$set$309
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$310,LCFI37-Ltext0
	.quad L$set$310
	.set L$set$311,LCFI38-Ltext0
	.quad L$set$311
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$312,LCFI38-Ltext0
	.quad L$set$312
	.set L$set$313,LFE16-Ltext0
	.quad L$set$313
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST11:
	.set L$set$314,LFB15-Ltext0
	.quad L$set$314
	.set L$set$315,LCFI33-Ltext0
	.quad L$set$315
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$316,LCFI33-Ltext0
	.quad L$set$316
	.set L$set$317,LCFI34-Ltext0
	.quad L$set$317
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$318,LCFI34-Ltext0
	.quad L$set$318
	.set L$set$319,LCFI35-Ltext0
	.quad L$set$319
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$320,LCFI35-Ltext0
	.quad L$set$320
	.set L$set$321,LFE15-Ltext0
	.quad L$set$321
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST10:
	.set L$set$322,LFB14-Ltext0
	.quad L$set$322
	.set L$set$323,LCFI30-Ltext0
	.quad L$set$323
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$324,LCFI30-Ltext0
	.quad L$set$324
	.set L$set$325,LCFI31-Ltext0
	.quad L$set$325
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$326,LCFI31-Ltext0
	.quad L$set$326
	.set L$set$327,LCFI32-Ltext0
	.quad L$set$327
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$328,LCFI32-Ltext0
	.quad L$set$328
	.set L$set$329,LFE14-Ltext0
	.quad L$set$329
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST9:
	.set L$set$330,LFB13-Ltext0
	.quad L$set$330
	.set L$set$331,LCFI27-Ltext0
	.quad L$set$331
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$332,LCFI27-Ltext0
	.quad L$set$332
	.set L$set$333,LCFI28-Ltext0
	.quad L$set$333
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$334,LCFI28-Ltext0
	.quad L$set$334
	.set L$set$335,LCFI29-Ltext0
	.quad L$set$335
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$336,LCFI29-Ltext0
	.quad L$set$336
	.set L$set$337,LFE13-Ltext0
	.quad L$set$337
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST8:
	.set L$set$338,LFB12-Ltext0
	.quad L$set$338
	.set L$set$339,LCFI24-Ltext0
	.quad L$set$339
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$340,LCFI24-Ltext0
	.quad L$set$340
	.set L$set$341,LCFI25-Ltext0
	.quad L$set$341
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$342,LCFI25-Ltext0
	.quad L$set$342
	.set L$set$343,LCFI26-Ltext0
	.quad L$set$343
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$344,LCFI26-Ltext0
	.quad L$set$344
	.set L$set$345,LFE12-Ltext0
	.quad L$set$345
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST7:
	.set L$set$346,LFB11-Ltext0
	.quad L$set$346
	.set L$set$347,LCFI21-Ltext0
	.quad L$set$347
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$348,LCFI21-Ltext0
	.quad L$set$348
	.set L$set$349,LCFI22-Ltext0
	.quad L$set$349
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$350,LCFI22-Ltext0
	.quad L$set$350
	.set L$set$351,LCFI23-Ltext0
	.quad L$set$351
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$352,LCFI23-Ltext0
	.quad L$set$352
	.set L$set$353,LFE11-Ltext0
	.quad L$set$353
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST6:
	.set L$set$354,LFB10-Ltext0
	.quad L$set$354
	.set L$set$355,LCFI18-Ltext0
	.quad L$set$355
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$356,LCFI18-Ltext0
	.quad L$set$356
	.set L$set$357,LCFI19-Ltext0
	.quad L$set$357
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$358,LCFI19-Ltext0
	.quad L$set$358
	.set L$set$359,LCFI20-Ltext0
	.quad L$set$359
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$360,LCFI20-Ltext0
	.quad L$set$360
	.set L$set$361,LFE10-Ltext0
	.quad L$set$361
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST5:
	.set L$set$362,LFB9-Ltext0
	.quad L$set$362
	.set L$set$363,LCFI15-Ltext0
	.quad L$set$363
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$364,LCFI15-Ltext0
	.quad L$set$364
	.set L$set$365,LCFI16-Ltext0
	.quad L$set$365
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$366,LCFI16-Ltext0
	.quad L$set$366
	.set L$set$367,LCFI17-Ltext0
	.quad L$set$367
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$368,LCFI17-Ltext0
	.quad L$set$368
	.set L$set$369,LFE9-Ltext0
	.quad L$set$369
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST4:
	.set L$set$370,LFB8-Ltext0
	.quad L$set$370
	.set L$set$371,LCFI12-Ltext0
	.quad L$set$371
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$372,LCFI12-Ltext0
	.quad L$set$372
	.set L$set$373,LCFI13-Ltext0
	.quad L$set$373
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$374,LCFI13-Ltext0
	.quad L$set$374
	.set L$set$375,LCFI14-Ltext0
	.quad L$set$375
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$376,LCFI14-Ltext0
	.quad L$set$376
	.set L$set$377,LFE8-Ltext0
	.quad L$set$377
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST3:
	.set L$set$378,LFB7-Ltext0
	.quad L$set$378
	.set L$set$379,LCFI9-Ltext0
	.quad L$set$379
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$380,LCFI9-Ltext0
	.quad L$set$380
	.set L$set$381,LCFI10-Ltext0
	.quad L$set$381
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$382,LCFI10-Ltext0
	.quad L$set$382
	.set L$set$383,LCFI11-Ltext0
	.quad L$set$383
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$384,LCFI11-Ltext0
	.quad L$set$384
	.set L$set$385,LFE7-Ltext0
	.quad L$set$385
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST2:
	.set L$set$386,LFB6-Ltext0
	.quad L$set$386
	.set L$set$387,LCFI6-Ltext0
	.quad L$set$387
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$388,LCFI6-Ltext0
	.quad L$set$388
	.set L$set$389,LCFI7-Ltext0
	.quad L$set$389
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$390,LCFI7-Ltext0
	.quad L$set$390
	.set L$set$391,LCFI8-Ltext0
	.quad L$set$391
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$392,LCFI8-Ltext0
	.quad L$set$392
	.set L$set$393,LFE6-Ltext0
	.quad L$set$393
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST1:
	.set L$set$394,LFB5-Ltext0
	.quad L$set$394
	.set L$set$395,LCFI3-Ltext0
	.quad L$set$395
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$396,LCFI3-Ltext0
	.quad L$set$396
	.set L$set$397,LCFI4-Ltext0
	.quad L$set$397
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$398,LCFI4-Ltext0
	.quad L$set$398
	.set L$set$399,LCFI5-Ltext0
	.quad L$set$399
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$400,LCFI5-Ltext0
	.quad L$set$400
	.set L$set$401,LFE5-Ltext0
	.quad L$set$401
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST0:
	.set L$set$402,LFB4-Ltext0
	.quad L$set$402
	.set L$set$403,LCFI0-Ltext0
	.quad L$set$403
	.word	0x2
	.byte	0x77
	.byte	0x8
	.set L$set$404,LCFI0-Ltext0
	.quad L$set$404
	.set L$set$405,LCFI1-Ltext0
	.quad L$set$405
	.word	0x2
	.byte	0x77
	.byte	0x10
	.set L$set$406,LCFI1-Ltext0
	.quad L$set$406
	.set L$set$407,LCFI2-Ltext0
	.quad L$set$407
	.word	0x2
	.byte	0x76
	.byte	0x10
	.set L$set$408,LCFI2-Ltext0
	.quad L$set$408
	.set L$set$409,LFE4-Ltext0
	.quad L$set$409
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
	.section __DWARF,__debug_pubnames,regular,debug
Lsection__debug_pubnames:
	.long	0x1b9
	.word	0x2
	.set L$set$410,Ldebug_info0-Lsection__debug_info
	.long L$set$410
	.long	0xbe5
	.long	0x518
	.ascii "main\0"
	.long	0x58a
	.ascii "bstree_get_last_key\0"
	.long	0x5d0
	.ascii "bstree_get_first_key\0"
	.long	0x617
	.ascii "bstree_get_size\0"
	.long	0x659
	.ascii "bstree_find_by_key\0"
	.long	0x6bc
	.ascii "bstree_remove\0"
	.long	0x771
	.ascii "bstree_insert\0"
	.long	0x7cb
	.ascii "bstree_create\0"
	.long	0x808
	.ascii "bstree_find_node_by_key\0"
	.long	0x86c
	.ascii "bstree_get_next_node\0"
	.long	0x8ce
	.ascii "bstree_insert_recursion\0"
	.long	0x926
	.ascii "bstree_insert_recursion_a\0"
	.long	0x97a
	.ascii "_bstree_insert\0"
	.long	0x9d6
	.ascii "__bstree_insert_a\0"
	.long	0xa53
	.ascii "bstree_get_prev_node\0"
	.long	0xab5
	.ascii "bstree_get_last_node\0"
	.long	0xb08
	.ascii "bstree_get_first_node\0"
	.long	0xb5c
	.ascii "bstree_free_node\0"
	.long	0xb98
	.ascii "bstree_create_node\0"
	.long	0
	.section __DWARF,__debug_pubtypes,regular,debug
Lsection__debug_pubtypes:
	.long	0x12b
	.word	0x2
	.set L$set$411,Ldebug_info0-Lsection__debug_info
	.long L$set$411
	.long	0xbe5
	.long	0xb1
	.ascii "signed char\0"
	.long	0xc0
	.ascii "unsigned char\0"
	.long	0xd1
	.ascii "short int\0"
	.long	0xde
	.ascii "short unsigned int\0"
	.long	0xf4
	.ascii "int\0"
	.long	0x100
	.ascii "unsigned int\0"
	.long	0x121
	.ascii "long long int\0"
	.long	0x110
	.ascii "__int64_t\0"
	.long	0x132
	.ascii "long long unsigned int\0"
	.long	0x14c
	.ascii "long int\0"
	.long	0x158
	.ascii "sizetype\0"
	.long	0x16d
	.ascii "char\0"
	.long	0x17c
	.ascii "__darwin_off_t\0"
	.long	0x192
	.ascii "fpos_t\0"
	.long	0x1a0
	.ascii "__sbuf\0"
	.long	0x1d6
	.ascii "__sFILE\0"
	.long	0x3de
	.ascii "FILE\0"
	.long	0x48b
	.ascii "BSTree\0"
	.long	0x499
	.ascii "_bstree\0"
	.long	0x4c8
	.ascii "_node\0"
	.long	0
	.section __DWARF,__debug_aranges,regular,debug
Lsection__debug_aranges:
	.long	0x2c
	.word	0x2
	.set L$set$412,Ldebug_info0-Lsection__debug_info
	.long L$set$412
	.byte	0x8
	.byte	0
	.word	0
	.word	0
	.quad	Ltext0
	.set L$set$413,Letext0-Ltext0
	.quad L$set$413
	.quad	0
	.quad	0
	.section __DWARF,__debug_line,regular,debug
Lsection__debug_line:
Ldebug_line0:
	.set L$set$414,LELT0-LSLT0
	.long L$set$414
LSLT0:
	.word	0x2
	.set L$set$415,LELTP0-LASLTP0
	.long L$set$415
LASLTP0:
	.byte	0x1
	.byte	0x1
	.byte	0xf6
	.byte	0xf2
	.byte	0xd
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x1
	.ascii "/usr/include"
	.byte	0
	.ascii "/usr/include/i386"
	.byte	0
	.ascii "/usr/include/sys"
	.byte	0
	.byte	0
	.ascii "bstree.c\0"
	.byte	0
	.byte	0
	.byte	0
	.ascii "i386/_types.h\0"
	.byte	0x1
	.byte	0
	.byte	0
	.ascii "sys/_types.h\0"
	.byte	0x1
	.byte	0
	.byte	0
	.ascii "stdio.h\0"
	.byte	0x1
	.byte	0
	.byte	0
	.ascii "stdlib.h\0"
	.byte	0x1
	.byte	0
	.byte	0
	.ascii "bstree.h\0"
	.byte	0
	.byte	0
	.byte	0
	.byte	0
LELTP0:
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM1
	.byte	0x2c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM2
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM3
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM4
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM5
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM6
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM7
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM8
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM9
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM10
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM11
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM12
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM13
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM14
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM15
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM16
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM17
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM18
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM19
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM20
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM21
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM22
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM23
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM24
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM25
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM26
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM27
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM28
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM29
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM30
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM31
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM32
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM33
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM34
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM35
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM36
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM37
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM38
	.byte	0x11
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM39
	.byte	0x20
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM40
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM41
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM42
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM43
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM44
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM45
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM46
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM47
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM48
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM49
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM50
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM51
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM52
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM53
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM54
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM55
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM56
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM57
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM58
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM59
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM60
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM61
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM62
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM63
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM64
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM65
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM66
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM67
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM68
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM69
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM70
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM71
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM72
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM73
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM74
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM75
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM76
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM77
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM78
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM79
	.byte	0x11
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM80
	.byte	0x20
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM81
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM82
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM83
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM84
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM85
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM86
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM87
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM88
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM89
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM90
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM91
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM92
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM93
	.byte	0x10
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM94
	.byte	0x20
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM95
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM96
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM97
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM98
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM99
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM100
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM101
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM102
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM103
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM104
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM105
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM106
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM107
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM108
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM109
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM110
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM111
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM112
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM113
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM114
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM115
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM116
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM117
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM118
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM119
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM120
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM121
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM122
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM123
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM124
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM125
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM126
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM127
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM128
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM129
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM130
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM131
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM132
	.byte	0x3
	.byte	0x6a
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM133
	.byte	0x32
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM134
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM135
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM136
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM137
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM138
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM139
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM140
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM141
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM142
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM143
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM144
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM145
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM146
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM147
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM148
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM149
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM150
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM151
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM152
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM153
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM154
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM155
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM156
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM157
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM158
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM159
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM160
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM161
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM162
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM163
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM164
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM165
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM166
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM167
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM168
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM169
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM170
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM171
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM172
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM173
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM174
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM175
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM176
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM177
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM178
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM179
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM180
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM181
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM182
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM183
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM184
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM185
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM186
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM187
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM188
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM189
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM190
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM191
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM192
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM193
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM194
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM195
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM196
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM197
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM198
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM199
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM200
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM201
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM202
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM203
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM204
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM205
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM206
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM207
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM208
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM209
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM210
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM211
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM212
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM213
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM214
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM215
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM216
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM217
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM218
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM219
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM220
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM221
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM222
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM223
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM224
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM225
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM226
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM227
	.byte	0x1d
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM228
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM229
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM230
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM231
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM232
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM233
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM234
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM235
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM236
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM237
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM238
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM239
	.byte	0x1c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM240
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM241
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM242
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM243
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM244
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM245
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM246
	.byte	0x1c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM247
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM248
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM249
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM250
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM251
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM252
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM253
	.byte	0x1c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM254
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM255
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM256
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM257
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM258
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM259
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM260
	.byte	0x1c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM261
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	Letext0
	.byte	0
	.byte	0x1
	.byte	0x1
LELT0:
	.section __DWARF,__debug_str,regular,debug
Lsection__debug_str:
LASF0:
	.ascii "parent\0"
LASF2:
	.ascii "node\0"
LASF1:
	.ascii "tree\0"
	.subsections_via_symbols
