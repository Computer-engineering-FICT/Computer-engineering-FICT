	.file	"testC.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%X"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	add	rsp, -128
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -120[rbp], 65536
	mov	DWORD PTR -116[rbp], 0
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -116[rbp]
	cdqe
	mov	DWORD PTR -112[rbp+rax*4], -2147483647
	mov	eax, DWORD PTR -116[rbp]
	cdqe
	mov	edx, DWORD PTR -112[rbp+rax*4]
	mov	eax, DWORD PTR -116[rbp]
	cdqe
	mov	DWORD PTR -64[rbp+rax*4], edx
	mov	eax, DWORD PTR -116[rbp]
	cdqe
	mov	edx, DWORD PTR -112[rbp+rax*4]
	mov	eax, DWORD PTR -120[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -116[rbp]
	cdqe
	mov	DWORD PTR -112[rbp+rax*4], edx
	add	DWORD PTR -120[rbp], 65536
	add	DWORD PTR -116[rbp], 1
.L2:
	cmp	DWORD PTR -116[rbp], 10
	jle	.L3
	mov	eax, DWORD PTR -112[rbp]
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
