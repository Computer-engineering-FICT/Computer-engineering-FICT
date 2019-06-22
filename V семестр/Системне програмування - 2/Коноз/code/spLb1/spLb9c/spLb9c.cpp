// spLb9c.cpp: Визначає вхідну точку для консольної прикладної програми.
//

#include "stdafx.h"


int main(int argc, char* argv[])
{int a=3,d=6,n=2,c=1.1,c2=2,__1=-1,i2=2;
 double e=5,b[3]={4,3,7};
_asm{
	mov	eax,n
	dec	n
	mov	esi,eax
	fld	b[esi*8]
	ficomp	c2
	fstsw	ax
	sahf
	setne	al
	movsx	eax,al
	mov	a,eax
	fild	c
	mov	esi,0
	fld	b[esi*8]
	fdiv	
	mov	eax,d
	sub	eax,c2
	push	eax
	fimul	[esp]
	add	esp,4
	fistp	a
	fld	e
	fiadd	i2
	fstp	e
	inc	n
	mov	eax,n
	mov	eax,c
	cmp	eax,0
	jz	_0000
	mov	eax,d
	jmp	_0001
_0000:
	mov	eax,d
	mov	ecx,c2
	shr	eax,cl
_0001:
	mov	n,eax
	mov	eax,2
	imul	a
	push	eax
	mov	eax,c
	xor	edx,edx
	test	eax,eax
	cmovl	edx,__1
	idiv	d
	add	[esp],eax
	pop	eax
	push	eax
	mov	eax,d
	or	eax,2
	add	[esp],eax
	pop	eax
	push	eax
	fld	e
	fiadd	[esp]
	fstp	e
	add	esp,4
	inc	n
	mov	eax,n
	cmp	eax,c2
	setg	al
	movsx	eax,al
	mov	d,eax}
return 0;
}