// spLb3.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <stdlib.h>
#include "visgrp.h"
#include "token.h"
#include "automat.h"
char *imgs[100]={"b","a","1","f","c", "g","k","ky","n","nD",
				 "nU","el","clr","red","green","blue","2","d","0"};
struct lxNode token[100]=
{{_nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _ass, &token[0], &token[5], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _sub, &token[2], &token[4], 0, 0, 0, 0, 0, NULL, 0},
{ _srcn,(struct lxNode*)imgs[2], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _mul, &token[6], &token[3], 0, 0, 0, 0, 0, NULL, 0},	//5
{ _brkt,&token[7], &token[8], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[3], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _sub, &token[9], &token[3], 0, 0, 0, 0, 0, NULL, 0},
{ _ixbr,&token[10], &token[3], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _EOS, &token[1], &token[13], 0, 0, 0, 0, 0, NULL, 0},	//11
{ _nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _ass, &token[12], &token[17], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _qmrk,&token[14], &token[16], 0, 0, 0, 0, 0, NULL, 0},//15
{ _nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _cln, &token[15], &token[18], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _EOS, &token[11], &token[23], 0, 0, 0, 0, 0, NULL, 0},//19
{ _nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _if,  &token[14], &token[6], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _else,&token[21], &token[26], 0, 0, 0, 0, 0, NULL, 0},//23
{ _nam, (struct lxNode*)imgs[5], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _brkt,&token[24], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _EOS, &token[25], &token[13], 0, 0, 0, 0, 0, NULL, 0},
{ _EOS, &token[19], &token[37], 0, 0, 0, 0, 0, NULL, 0},//27
{ _nam, (struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _case,&token[28], &token[30], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _cln, &token[29], &token[13], 0, 0, 0, 0, 0, NULL, 0},//31
{ _EOS, &token[31], &token[36], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _case,&token[28], &token[35], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _cln, &token[34], &token[13], 0, 0, 0, 0, 0, NULL, 0},//36
{ _endcase, &token[32], NULL, 0, 0, 0, 0, 0, NULL, 0}
};
struct lxNode pic1[8]= // b=f(a-1)+a-1
{{_nam,(struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_ass,&token[0], &pic1[7], 0, 0, 0, 0, 0, NULL, 0},
 {_nam, (struct lxNode*)imgs[3], NULL, 0, 0, 0, 0, 0,NULL, 0},
 {_brkt,&pic1[2], &pic1[5], 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0}, 
 {_sub, &pic1[4], &pic1[6], 0, 0, 0, 0, 0, NULL, 0},
 {_srcn,(struct lxNode*)imgs[2], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_add, &pic1[3], &pic1[5], 0, 0, 0, 0, 0, NULL, 0}
};
struct lxNode pic2[7]=		// b=a?b:c
{{_nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_ass, &pic2[0], &pic2[5], 0, 0, 0, 0, 0, NULL, 0},
 {_nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_qmrk,&pic2[2], &pic2[4], 0, 0, 0, 0, 0, NULL, 0},
 {_nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_cln, &pic2[3], &pic2[6], 0, 0, 0, 0, 0, NULL, 0},
 {_nam, (struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0}
};// if(a)f();else g();
struct lxNode pic3[]=		// if(c)b=(2*a+c/d)*2*a;
{{_if,  &pic3[2], &pic3[6], 0, 0, 0, 0, 0, NULL, 0},
{ _brkt, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _ne,&pic3[2],&pic3[4], 0, 0, 0, 0, 0, NULL, 0},//4
{ _nam, (struct lxNode*)imgs[18], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _ass,&pic3[5],&pic3[17], 0, 0, 0, 0, 0, NULL, 0},//4
{ _brkt,NULL, NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[16], NULL, 0, 0, 0, 0, 0, NULL, 0},//2
{ _mul,&pic3[8],&pic3[10], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},//2
{ _add,&pic3[9],&pic3[13], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0},//2
{ _div,&pic3[12],&pic3[14], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[17], NULL, 0, 0, 0, 0, 0, NULL, 0},//2
{ _mul,&pic3[11],&pic3[16], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[16], NULL, 0, 0, 0, 0, 0, NULL, 0},//2
{ _mul,&pic3[15],&pic3[18], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},//2 
{ _EOS,NULL, NULL, 0, 0, 0, 0, 0, NULL, 0},
};
//{ _EOS, &token[25], &token[13], 0, 0, 0, 0, 0, NULL, 0},
struct lxNode pic6[]=		// n=(nD+nU)>>1; while(nD<n){
	//	if(k==el[n].ky)break; if(k<el[n].ky)nD=n; 
	//						  else nU=n; n=(nD+nU)>>1;}return n;
{{_nam, (struct lxNode*)imgs[8], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _ass,  &pic6[0], &pic6[5], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[9], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _add,  &pic6[2], &pic6[4], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[10], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _shRgt,&pic6[3], &pic6[6], 0, 0, 0, 0, 0, NULL, 0},
{ _srcn,(struct lxNode*)imgs[2], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _EOS, &pic6[1], &pic6[8], 0, 0, 0, 0, 0, NULL, 0},//&pic6[1],
{ _whileP,&pic6[10], &pic6[26], 0, 0, 0, 0, 0, NULL, 0},	//8
{ _nam, (struct lxNode*)imgs[9], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _lt,  &pic6[9], &pic6[11], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[8], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _if,  &pic6[14], &pic6[19], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[6], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _eq,  &pic6[13], &pic6[17], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[11], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _ixbr, &pic6[15], &pic6[0], 0, 0, 0, 0, 0, NULL, 0},
{ _fldDt,&pic6[16],&pic6[18], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[7], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _break, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _EOS, &pic6[12], &pic6[24], 0, 0, 0, 0, 0, NULL, 0},//20
{ _if,  &pic6[22], &pic6[23], 0, 0, 0, 0, 0, NULL, 0},
{ _lt,  &pic6[13], &pic6[17], 0, 0, 0, 0, 0, NULL, 0},
{ _ass, &pic6[2], &pic6[0], 0, 0, 0, 0, 0, NULL, 0},
{ _else,&pic6[21], &pic6[25], 0, 0, 0, 0, 0, NULL, 0},//24
{ _ass, &pic6[4], &pic6[0], 0, 0, 0, 0, 0, NULL, 0},
{ _EOS, &pic6[20], &pic6[1], 0, 0, 0, 0, 0, NULL, 0},//26
{ _return,&pic6[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _EOS, &pic6[7], &pic6[27], 0, 0, 0, 0, 0, NULL, 0},//28
};
struct lxNode pic4[]= // switch(c){case a:b=a-c; break; default b++;}
{{ _nam, (struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _case,&pic4[0], &pic4[2], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _cln, &pic4[1], &pic4[9], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _ass, &pic4[4], &pic4[7], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _sub, &pic4[6], &pic4[8], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _EOS, &pic4[5], &pic4[10], 0, 0, 0, 0, 0, NULL, 0},// 9
{ _break, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _EOS, &pic4[3], &pic4[13], 0, 0, 0, 0, 0, NULL, 0},
{ _default,NULL, NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _cln, &pic4[12], &pic4[15], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _inr, &pic4[14], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _endcase, &pic4[11], NULL, 0, 0, 0, 0, 0, NULL, 0}
};
struct lxNode pic5[]=		// do a+=b;while(c);
{{_endloop,&pic5[4], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_asAdd, &pic5[1], &pic5[3], 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_whileN, &pic5[2], &pic5[5], 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_EOS, &pic5[0], &pic5[7], 0, 0, 0, 0, 0, NULL, 0},
 {_whileP, &pic5[8], &pic5[22], 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[8], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_ass, &pic5[9], &pic5[14], 0, 0, 0, 0, 0, NULL, 0},	//10
 {_nam,(struct lxNode*)imgs[9], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_add, &pic5[11], &pic5[13], 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[10], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_shRgt, &pic5[12], &pic5[15], 0, 0, 0, 0, 0, NULL, 0},
 {_srcn,(struct lxNode*)imgs[2], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_EOS, &pic5[10], &pic5[17], 0, 0, 0, 0, 0, NULL, 0},
 {_if, &pic5[19], &pic5[21], 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[6], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_ne, &pic5[18], &pic5[20], 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[7], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_continue,  NULL,  NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_EOS, &pic5[16], &pic5[23], 0, 0, 0, 0, 0, NULL, 0},
 {_if, &pic5[25], &pic5[27], 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[8], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_eq, &pic5[24], &pic5[26], 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[9], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_break,  NULL,  NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_EOS, &pic5[14], &pic5[15], 0, 0, 0, 0, 0, NULL, 0},
};
struct lxNode pic7[]= // for a:=b-(a-c)to do b++;
{{_for,&pic7[10], &pic5[16/*0*/], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _ass, &pic7[1], &pic7[3/*4*/], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _sub, &pic7[3], &pic7[6], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _sub, &pic7[1], &pic7[7], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _to, &pic7[2], &pic7[9], 0, 0, 0, 0, 0, NULL, 0},
{ _mul, &pic7[1], &pic7[7], 0, 0, 0, 0, 0, NULL, 0},
{ _step, &pic7[8], &pic7[3], 0, 0, 0, 0, 0, NULL, 0},
{_nam, (struct lxNode*)imgs[4], NULL, 0, 0, 0, 0, 0, NULL, 0},
};
struct lxNode pic8[]= // for a:=b-(a-c)to do b++;
{{_unsigned,NULL,NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _char, &pic8[0],&pic8[5], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _comma, &pic8[2], &pic8[4], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _comma, &pic8[3], &pic8[6], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[3], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _EOS, &pic8[1], &pic8[8], 0, 0, 0, 0, 0, NULL, 0},
{ _enum,&pic8[10],&pic8[5], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[12], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _tdbr, &pic8[9], &pic8[14], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[13], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _comma, &pic8[11], &pic8[13], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[14], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _comma, &pic8[12], &pic8[15], 0, 0, 0, 0, 0, NULL, 0},
{ _nam, (struct lxNode*)imgs[15], NULL, 0, 0, 0, 0, 0, NULL, 0},
{ _EOS, &pic8[0],&pic8[5], 0, 0, 0, 0, 0, NULL, 0},
};

struct lxNode pic15[]= // while n<>0 do begin n:=n-1; b:=b+a[n] end
//do--n;while(n&&b==a[n]);
{{_endloop,&pic15[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_whileP, &pic15[3], &pic15[10], 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[8], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_ne, &pic15[2], &pic15[4], 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[18], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[8], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_ass, &pic15[5], &pic15[8], 0, 0, 0, 0, 0, NULL, 0},	//10
 {_nam,(struct lxNode*)imgs[8], NULL, 0, 0, 0, 0, 0, NULL, 0},
 {_sub, &pic15[7], &pic15[9], 0, 0, 0, 0, 0, NULL, 0},
 {_nam,(struct lxNode*)imgs[2], NULL, 0, 0, 0, 0, 0, NULL, 0},
{_EOS, &pic15[6], &pic15[6], 0, 0, 0, 0, 0, NULL, 0},
 {_ixbr, &pic15[9], &pic15[3], 0, 0, 0, 0, 0, NULL, 0},
{_for,&pic15[16],&pic15[19], 0, 0, 0, 0, 0, NULL, 0},
{_nam, (struct lxNode*)imgs[8], NULL, 0, 0, 0, 0, 0, NULL, 0},
{_ass, &pic15[13], &pic15[15], 0, 0, 0, 0, 0, NULL, 0},
{_nam, (struct lxNode*)imgs[10], NULL, 0, 0, 0, 0, 0, NULL, 0},
{_downto, &pic15[14], &pic15[17], 0, 0, 0, 0, 0, NULL, 0},
{_nam, (struct lxNode*)imgs[2], NULL, 0, 0, 0, 0, 0, NULL, 0},
{_nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0},
{_asOr, &pic15[18], &pic15[20], 0, 0, 0, 0, 0, NULL, 0},
{_nam, (struct lxNode*)imgs[2], NULL, 0, 0, 0, 0, 0, NULL, 0},
};
extern char *oprtrC[], *oprtrP[], *oprtrV[],
			*cprC[], *cprP[], *cprV[];
char **oprtr=oprtrC, **cpr=cprC,
	modeP=0, // тип роздільника операторних дужок для Паскаля
	modeC=1, // тип роздільника операторних дужок для С
	modeL=modeC; 
int n=3, b, a[3]={0,1,2};
int main(int argc, char* argv[])
{/*	prLxTxt(token+27);//32);
	printf("\n");
	do b+=a[--n]; while(n);
	prLxTxt(pic1+1);
	printf("\n");
	prLxTxt(pic2+1);
	printf("\n");*/
	prLxTxt(pic3+0); // if functions;
	printf("\n");
/*	prLxTxt(pic4+16);
	printf("\n");
	prLxTxt(pic6+28);//24);//20);//28);//7);
	printf("\n");
	prLxTxt(pic5+6);//7);
	printf("\n");*/
/*	prLxTxt(pic15+1);
	printf("\n");
	prLxTxt(pic7);
	printf("\n");
	prLxTxt(pic8+7);
	printf("\n");
	prLaTxt(pic6,28);
	printf("\n");*/
/*	prLaTxt(pic8,17);
	printf("\n");*/
enum autSgn ASgn[10]={sg1,sg2,sg1,sg0,sgE};
for(n=0;n<5;n++)printf("%5d->%2d  ",ASgn[n],nxtStat(ASgn[n]));
	return 0;
}
