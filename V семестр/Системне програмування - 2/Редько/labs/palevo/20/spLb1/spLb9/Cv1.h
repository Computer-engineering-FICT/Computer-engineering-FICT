// spLb9c.cpp: Визначає вхідну точку для консольної прикладної програми.
//

#include "stdafx.h"


int main(int argc, char* argv[])
{int a=3,n=1,b[2]={4,3};
float c=1.1,d=6,e=5;
_asm{
	mov	eax,2
	mul	a
	push	eax
	fild	[esp]
	add esp,4
	fld	c
	fdiv	d
	fadd	
	fimul	2
	fimul	a
	fstp	d
	dec	n
	mov	eax,n}
return 0;
}