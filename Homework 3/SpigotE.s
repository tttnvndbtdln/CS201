	.file	"SpigotE.c"
	.text
	.globl	SpigotE
	.type	SpigotE, @function
SpigotE:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-40(%rbp), %rax
	movb	$2, (%rax)
	movq	-56(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	.L2
.L3:
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	$1, (%rax)
	subq	$1, -24(%rbp)
.L2:
	cmpq	$0, -24(%rbp)
	jns	.L3
	movq	$1, -16(%rbp)
	jmp	.L4
.L7:
	movb	$0, -25(%rbp)
	movq	-56(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	.L5
.L6:
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movzbl	-25(%rbp), %eax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	addq	$2, %rax
	movq	%rax, %rdi
	movq	-8(%rbp), %rax
	movl	$0, %edx
	divq	%rdi
	movb	%al, -25(%rbp)
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-24(%rbp), %rax
	addq	$2, %rax
	movq	%rax, %rsi
	movq	-8(%rbp), %rax
	movl	$0, %edx
	divq	%rsi
	movq	%rdx, %rax
	movq	%rax, (%rcx)
	subq	$1, -24(%rbp)
.L5:
	cmpq	$0, -24(%rbp)
	jns	.L6
	movq	-16(%rbp), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-25(%rbp), %eax
	movb	%al, (%rdx)
	addq	$1, -16(%rbp)
.L4:
	movq	-16(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jb	.L7
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	SpigotE, .-SpigotE
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
