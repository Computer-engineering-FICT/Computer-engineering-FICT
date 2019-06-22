// Sysprog_Lab3.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <stdlib.h>
#include "visgrp.h"
#include "token.h"
#include "automat.h"

char *imgs[100] = {"b", "a", "n"};

struct lxNode token[] = // do b+=a[--n]; while(n);
{
	{_endloop,	&token[9]				,NULL,		0, 0, 0, 0, 0, NULL, 0},
	{_nam,		(struct lxNode*)imgs[0]	,NULL,		0, 0, 0, 0, 0, NULL, 0},
	{_asAdd,	&token[1]				,&token[3],	0, 0, 0, 0, 0, NULL, 0},
	{_ixbz,		&token[6]				,&token[7],	0, 0, 0, 0, 0, NULL, 0},
	{_whileN,	&token[8]				,&token[5],	0, 0, 0, 0, 0, NULL, 0},
	{_nam,		(struct lxNode*)imgs[2]	,NULL,		0, 0, 0, 0, 0, NULL, 0},
	{_nam,		(struct lxNode*)imgs[1]	,NULL,		0, 0, 0, 0, 0, NULL, 0},
	{_dcr,		NULL					,&token[5],	0, 0, 0, 0, 0, NULL, 0},
	{_myEOS,		&token[2]				,NULL, 0, 0, 0, 0, 0, NULL, 0},
	{_myEOS,		&token[4]				,NULL, 0, 0, 0, 0, 0, NULL, 0}
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
