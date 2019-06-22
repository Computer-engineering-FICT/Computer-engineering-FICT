#include "stdafx.h"
#include <stdlib.h>
#include "visgrp.h"
#include "token.h"
#include "automat.h"

char *imgs[100] = { "b", "0", "n", "a" };
struct lxNode token[100]=
{
	{_for, &token[4], &token[2], 0, 0, 0, 0, 0, NULL, 0}, // 0 - for
	{_myEOS, &token[2], NULL, 0, 0, 0, 0, 0, NULL, 0}, // 1 - ; (last)
	{_asAdd, &token[9], &token[3], 0, 0, 0, 0, 0, NULL, 0}, // 2 - +=
	{_ixbr, &token[12], &token[11], 0, 0, 0, 0, 0, NULL, 0}, // 3 - []
	{_brkt, NULL, &token[5], 0, 0, 0, 0, 0, NULL, 0}, // 4 - ()
	{_myEOS, &token[6], &token[7], 0, 0, 0, 0, 0, NULL, 0}, // 5 - ; (left)
	{_ass, &token[9], &token[10], 0, 0, 0, 0, 0, NULL, 0}, // 6 - =
	{_myEOS, &token[11], &token[8], 0, 0, 0, 0, 0, NULL, 0}, // 7 - ; (right)
	{_dcr, &token[11], NULL, 0, 0, 0, 0, 0, NULL, 0}, // 8 - --
	{ _nam, (struct lxNode*)imgs[0], NULL, 0, 0, 0, 0, 0, NULL, 0 }, // 9 - b
	{ _nam, (struct lxNode*)imgs[1], NULL, 0, 0, 0, 0, 0, NULL, 0 }, // 10 - 0
	{ _nam, (struct lxNode*)imgs[2], NULL, 0, 0, 0, 0, 0, NULL, 0 }, // 11 - n
	{ _nam, (struct lxNode*)imgs[3], NULL, 0, 0, 0, 0, 0, NULL, 0 } // 12 - a
};


//  управляючі таблиці мов програмування
extern char *oprtrC[], *oprtrP[], *oprtrV[], *cprC[], *cprP[], *cprV[];

char **oprtr = oprtrC, **cpr = cprC,
	modeP=0,	// тип роздільника операторних дужок для Паскаля
	modeC=1,	// тип роздільника операторних дужок для С
	modeL=modeC;

int main(int argc, char* argv[])
{	
	prLxTxt(token);
	printf("\n\n");
	printf("S0");
	enum autSgn ASgn[7] = { ltr, ltr, ltr, ltr, ltr, ltr, ltr };
	for(int n = 0; n < 7; n++)
		printf("%5d->%2d  ", ASgn[n], nxtStat(ASgn[n]));
	printf("\n\n");
	system("pause");
}
