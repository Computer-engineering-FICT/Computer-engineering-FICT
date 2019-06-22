	.file	"main.cpp"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.text
	.globl	main
	.type	main, @function
main:
.LFB1490:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	and	esp, -16
	sub	esp, 368
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR 364[esp], eax
	xor	eax, eax
	mov	DWORD PTR 48[esp], 3
	mov	DWORD PTR 52[esp], 2
	mov	DWORD PTR 28[esp], -2147483648
	mov	DWORD PTR 32[esp], 0
.L3:
	cmp	DWORD PTR 32[esp], 23
	jg	.L2
	mov	eax, DWORD PTR 32[esp]
	mov	edx, DWORD PTR 28[esp]
	mov	DWORD PTR 64[esp+eax*4], edx
	mov	eax, DWORD PTR 32[esp]
	mov	DWORD PTR 160[esp+eax*4], -2147483648
	add	DWORD PTR 28[esp], 4096
	inc	DWORD PTR 32[esp]
	jmp	.L3
.L2:
	mov	DWORD PTR 12[esp], 24
	lea	eax, 64[esp]
	mov	DWORD PTR 8[esp], eax
	lea	eax, 160[esp]
	mov	DWORD PTR 4[esp], eax
	lea	eax, 256[esp]
	mov	DWORD PTR [esp], eax
	call	addLongop@PLT
	mov	DWORD PTR 36[esp], 0
.L5:
	cmp	DWORD PTR 36[esp], 24
	jg	.L4
	mov	eax, DWORD PTR 36[esp]
	mov	eax, DWORD PTR 256[esp+eax*4]
	mov	DWORD PTR 4[esp], eax
	mov	eax, DWORD PTR _ZSt4cout@GOT[ebx]
	mov	DWORD PTR [esp], eax
	call	_ZNSolsEj@PLT
	inc	DWORD PTR 36[esp]
	jmp	.L5
.L4:
	mov	eax, DWORD PTR _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOT[ebx]
	mov	DWORD PTR 4[esp], eax
	mov	eax, DWORD PTR _ZSt4cout@GOT[ebx]
	mov	DWORD PTR [esp], eax
	call	_ZNSolsEPFRSoS_E@PLT
	mov	DWORD PTR 24[esp], 0
	lea	eax, 24[esp]
	mov	DWORD PTR 8[esp], eax
	mov	DWORD PTR 4[esp], 25
	lea	eax, 256[esp]
	mov	DWORD PTR [esp], eax
	call	_ZSt6fill_nIPjiiET_S1_T0_RKT1_
	mov	DWORD PTR 12[esp], 24
	lea	eax, 64[esp]
	mov	DWORD PTR 8[esp], eax
	lea	eax, 160[esp]
	mov	DWORD PTR 4[esp], eax
	lea	eax, 256[esp]
	mov	DWORD PTR [esp], eax
	call	subLongop@PLT
	mov	DWORD PTR 40[esp], 0
.L7:
	cmp	DWORD PTR 40[esp], 24
	jg	.L6
	mov	eax, DWORD PTR 40[esp]
	mov	eax, DWORD PTR 256[esp+eax*4]
	mov	DWORD PTR 4[esp], eax
	mov	eax, DWORD PTR _ZSt4cout@GOT[ebx]
	mov	DWORD PTR [esp], eax
	call	_ZNSolsEj@PLT
	inc	DWORD PTR 40[esp]
	jmp	.L7
.L6:
	mov	DWORD PTR 24[esp], 0
	lea	eax, 24[esp]
	mov	DWORD PTR 8[esp], eax
	mov	DWORD PTR 4[esp], 5
	lea	eax, 56[esp]
	mov	DWORD PTR [esp], eax
	call	_ZSt6fill_nIPjiiET_S1_T0_RKT1_
	mov	eax, DWORD PTR _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOT[ebx]
	mov	DWORD PTR 4[esp], eax
	mov	eax, DWORD PTR _ZSt4cout@GOT[ebx]
	mov	DWORD PTR [esp], eax
	call	_ZNSolsEPFRSoS_E@PLT
	mov	edx, DWORD PTR _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOT[ebx]
	mov	DWORD PTR 4[esp], edx
	mov	DWORD PTR [esp], eax
	call	_ZNSolsEPFRSoS_E@PLT
	mov	DWORD PTR 12[esp], 1
	lea	eax, 48[esp]
	mov	DWORD PTR 8[esp], eax
	lea	eax, 52[esp]
	mov	DWORD PTR 4[esp], eax
	lea	eax, 56[esp]
	mov	DWORD PTR [esp], eax
	call	mulN_x_N@PLT
	mov	DWORD PTR 44[esp], 0
.L9:
	cmp	DWORD PTR 44[esp], 1
	jg	.L8
	mov	eax, DWORD PTR 44[esp]
	mov	eax, DWORD PTR 56[esp+eax*4]
	mov	DWORD PTR 4[esp], eax
	mov	eax, DWORD PTR _ZSt4cout@GOT[ebx]
	mov	DWORD PTR [esp], eax
	call	_ZNSolsEj@PLT
	inc	DWORD PTR 44[esp]
	jmp	.L9
.L8:
	mov	DWORD PTR 8[esp], 2
	lea	eax, 359[esp]
	mov	DWORD PTR 4[esp], eax
	lea	eax, 56[esp]
	mov	DWORD PTR [esp], eax
	call	strDec@PLT
	mov	eax, 0
	mov	ecx, DWORD PTR 364[esp]
	xor	ecx, DWORD PTR gs:20
	je	.L11
	call	__stack_chk_fail_local
.L11:
	mov	ebx, DWORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1490:
	.size	main, .-main
	.section	.text._ZSt6fill_nIPjiiET_S1_T0_RKT1_,"axG",@progbits,_ZSt6fill_nIPjiiET_S1_T0_RKT1_,comdat
	.weak	_ZSt6fill_nIPjiiET_S1_T0_RKT1_
	.type	_ZSt6fill_nIPjiiET_S1_T0_RKT1_, @function
_ZSt6fill_nIPjiiET_S1_T0_RKT1_:
.LFB1730:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 8[ebp]
	mov	DWORD PTR [esp], eax
	call	_ZSt12__niter_baseIPjET_S1_
	mov	edx, DWORD PTR 16[ebp]
	mov	DWORD PTR 8[esp], edx
	mov	edx, DWORD PTR 12[ebp]
	mov	DWORD PTR 4[esp], edx
	mov	DWORD PTR [esp], eax
	call	_ZSt10__fill_n_aIPjiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1730:
	.size	_ZSt6fill_nIPjiiET_S1_T0_RKT1_, .-_ZSt6fill_nIPjiiET_S1_T0_RKT1_
	.section	.text._ZSt12__niter_baseIPjET_S1_,"axG",@progbits,_ZSt12__niter_baseIPjET_S1_,comdat
	.weak	_ZSt12__niter_baseIPjET_S1_
	.type	_ZSt12__niter_baseIPjET_S1_, @function
_ZSt12__niter_baseIPjET_S1_:
.LFB1841:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 8[ebp]
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1841:
	.size	_ZSt12__niter_baseIPjET_S1_, .-_ZSt12__niter_baseIPjET_S1_
	.section	.text._ZSt10__fill_n_aIPjiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_,"axG",@progbits,_ZSt10__fill_n_aIPjiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_,comdat
	.weak	_ZSt10__fill_n_aIPjiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_
	.type	_ZSt10__fill_n_aIPjiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_, @function
_ZSt10__fill_n_aIPjiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_:
.LFB1842:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 16[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR -4[ebp], eax
	mov	eax, DWORD PTR 12[ebp]
	mov	DWORD PTR -8[ebp], eax
.L18:
	cmp	DWORD PTR -8[ebp], 0
	jle	.L17
	mov	edx, DWORD PTR -4[ebp]
	mov	eax, DWORD PTR 8[ebp]
	mov	DWORD PTR [eax], edx
	dec	DWORD PTR -8[ebp]
	add	DWORD PTR 8[ebp], 4
	jmp	.L18
.L17:
	mov	eax, DWORD PTR 8[ebp]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1842:
	.size	_ZSt10__fill_n_aIPjiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_, .-_ZSt10__fill_n_aIPjiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB1980:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 20
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	cmp	DWORD PTR 8[ebp], 1
	jne	.L22
	cmp	DWORD PTR 12[ebp], 65535
	jne	.L22
	lea	eax, _ZStL8__ioinit@GOTOFF[ebx]
	mov	DWORD PTR [esp], eax
	call	_ZNSt8ios_base4InitC1Ev@PLT
	lea	eax, __dso_handle@GOTOFF[ebx]
	mov	DWORD PTR 8[esp], eax
	lea	eax, _ZStL8__ioinit@GOTOFF[ebx]
	mov	DWORD PTR 4[esp], eax
	mov	eax, DWORD PTR _ZNSt8ios_base4InitD1Ev@GOT[ebx]
	mov	DWORD PTR [esp], eax
	call	__cxa_atexit@PLT
.L22:
	nop
	add	esp, 20
	pop	ebx
	.cfi_restore 3
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1980:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB1981:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR 4[esp], 65535
	mov	DWORD PTR [esp], 1
	call	_Z41__static_initialization_and_destruction_0ii
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1981:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 4
	.long	_GLOBAL__sub_I_main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB1982:
	.cfi_startproc
	mov	eax, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE1982:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB1983:
	.cfi_startproc
	mov	ebx, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE1983:
	.hidden	__dso_handle
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
