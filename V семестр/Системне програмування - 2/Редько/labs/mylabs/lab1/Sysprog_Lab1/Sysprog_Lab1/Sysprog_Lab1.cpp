// Sysprog_Lab1.cpp : Defines the entry point for the console application.
//
//

#include "stdafx.h"
#include "tables.h"
#include "vistab.h"

/**
 * System programming. Laboratory work #1
 *
 * author Redko Alexander
 * group IO-01
 * date 06.10.12
 *
 */

int nTbStud = 5, lnTbStud = 100;

struct record tbStud[100] =
			{
				{{"Diatlov", 89}, {4}, 0},
				{{"Kutsar",  89}, {12}, 0},
				{{"Redko",   56}, {7}, 0},
				{{"Chychno", 12}, {9}, 0},
				{{"Melnyk",  32}, {4}, 0}
			};

struct record tstArg=
					{{"Melnyk",  32}, {2}, 0},
					insArg  = {{"Gazizov", 89}, {3}, 0},
					insLin  = {{"Dudko",   80}, {4}, 0},
					delLin  = {{"Chychno", 12}, {3}, 0},
					insArg1 = {{"Bilyk",    8}, {4}, 0},					
					updLin  = {{"Sokol",    5}, {12}, 0},
					selBin  = {{"Kutsar",  89},  {8}, 0},
					insBin =  {{"Naumova",  1}, {1}, 0},
					updBin =  {{"Karas'",  8}, {9}, 0},
					sel2Bin = {{"Melnyk",  32}, {4}, 0},
					SelLab1={{"Ed", 2}, {41}, 0};

int main(int argc, char* argv[])
{
	printTable(tbStud, 0, nTbStud - 1);
	printf("-------------------------------------------------------------------");
	printf("\nSelect by direct address element #1: ");
	printRow(selectNumber(tbStud, 1));
	printf("\nInsert row by direct address: ");
	printRow(insertNumber(&insArg, tbStud, 5, &nTbStud));
	printTable(tbStud, 0, nTbStud - 1);
	printf("\nUpdating row by direct address #2: ");
	printRow(updateNumber(&insArg1,tbStud, 2, &nTbStud));
	printTable(tbStud, 0, nTbStud - 1);
	printf("\nDelete row by direct address #2: \n");
	deleteNumber(tbStud, 2);
	printTable(tbStud, 0, nTbStud - 1);
	printf("-------------------------------------------------------------------");

	printf("\nInsert linear: ");
	printRow(insertLinear(&insLin, tbStud, &nTbStud));
	printTable(tbStud, 0, nTbStud - 1);
	printf("\nSelect linear by key: ");
	printRow(selectLinear(tstArg.key, tbStud, 5));
	printf("\nDelete linear by key: ");
	printRow(deleteLinear(&delLin, tbStud, &nTbStud));
	printTable(tbStud, 0, nTbStud - 1);
	printf("\nUpdate linear by key: ");
	printRow(updateLinear(insArg.key, &updLin, tbStud, &nTbStud));
	printTable(tbStud, 0, nTbStud - 1);
	printf("\nAfter linear pack: \n");
	packLinear(tbStud, &nTbStud);
	printTable(tbStud, 0, nTbStud - 1);
	printf("-------------------------------------------------------------------");

	printf("\nBinary sort by keys: \n");
	sortBinary(tbStud, nTbStud);
	printTable(tbStud, 0, nTbStud - 1);
	printf("\nSelect by binary search: ");
	printRow(selectBinary(selBin.key, tbStud, nTbStud));
	printTable(tbStud, 0, nTbStud - 1);
	printf("\nInserting by binary search: ");
	printRow(insertBinary(&insBin, tbStud, &nTbStud));
	printTable(tbStud, 0, nTbStud);
	printf("\nDelete by binary search: ");
	printRow(deleteBinary(&selBin, tbStud, &nTbStud));
	printTable(tbStud, 0, nTbStud);
	printf("\nUpdate by binary search: ");
	printRow(updateBinary(sel2Bin.key, &updBin, tbStud, &nTbStud));
	printTable(tbStud, 0, nTbStud);
	

	return 0;
}
