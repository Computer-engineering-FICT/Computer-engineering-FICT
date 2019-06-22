// spLb9c.cpp: Визначає вхідну точку для консольної прикладної програми.
//

#include "stdafx.h"


int main(int argc, char* argv[])
{int a=3,n=1,b[3]={4,3,7};
float c=1.1,d=6,e=5,c2=2;
_asm{
	dec	n
	mov	eax,n
	mov	esi,eax
	mov	eax,b[esi*4]
	push	eax,
	fild	[esp]
	add	esp,4
	fcom	c
	fstsw	ax
	sahf
	setne	al
	movsx	eax,al
	fld	e
	fiadd	eax
	fstp	e
	inc	n
	mov	eax,n
	inc	n
	mov	eax,n
	push	eax,
	fild	[esp]
	add	esp,4
	fcom	c
	fstsw	ax
	sahf
	seta	al
	movsx	eax,al
	mov	a,eax
	mov	a,eax
	push	eax
	fild	[esp]
	add esp,4
	fstp	d}
return 0;
}