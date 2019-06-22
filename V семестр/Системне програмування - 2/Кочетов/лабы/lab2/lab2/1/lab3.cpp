// Sysprog_Lab3.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <stdlib.h>
#include "visgrp.h"
#include "token.h"
#include "automat.h"

char *imgs[100] = { "b", "0", "n", "a" };
struct lxNode token[100]=
{
	{_nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0}, // 0 - b
	{_nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0}, // 1 - 0
	{_nam, (struct lxNode*)imgs[2], NULL, 0, 0, 0, 0, 0, NULL, 0}, // 2 - n
	{_nam, (struct lxNode*)imgs[3], NULL, 0, 0, 0, 0, 0, NULL, 0}, // 3 - a
	{_ass, &token[0], &token[1], 0, 0, 0, 0, 0, NULL, 0}, // 4 - =
	{_EOS, &token[4], &token[2], 0, 0, 0, 0, 0, NULL, 0}, // 5 - ;
	{_opbr, &token[5], &token[2], 0, 0, 0, 0, 0, NULL, 0}, // 6 - ()
	{_ixbr, &token[3], &token[2], 0, 0, 0, 0, 0, NULL, 0}, // 7 - []
	{_asAdd, &token[0], &token[7], 0, 0, 0, 0, 0, NULL, 0}, // 8 - +=
	{_for, &token[6], &token[8], 0, 0, 0, 0, 0, NULL, 0}
};


//  управляючі таблиці мов програмування
extern char *oprtrC[], *oprtrP[], *oprtrV[], *cprC[], *cprP[], *cprV[];

char **oprtr = oprtrC, **cpr = cprC,
	modeP=0,	// тип роздільника операторних дужок для Паскаля
	modeC=1,	// тип роздільника операторних дужок для С
	modeL=modeC; 

int n = 3, b, a[3] = {0, 1, 2};

int main(int argc, char* argv[])
{	
	prLxTxt(token);
	printf("\n\n");

	printf("S0");
	enum autSgn ASgn[12] = {dlm, dlm, rtl, dlm, sg0, dlm, rtl, sg0, rtl, dlm, rtl, sgE};
	for(n = 0; n < 12; n++)
		printf("%5d->%2d  ", ASgn[n], nxtStat(ASgn[n]));
	printf("\n\n");
}
