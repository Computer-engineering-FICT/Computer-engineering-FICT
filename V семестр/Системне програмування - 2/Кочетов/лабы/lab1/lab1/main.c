#pragma once
#include "table.h"

int main() {
	Table tb = (Table) malloc(100 * sizeof(Record));
	int size = 0;

	printRec(insLinear(rec("Diatlov", 88, 4), tb, &size));
	printRec(insLinear(rec("Kutsar", 89, 3.5), tb, &size));

	Record
		tstArg = rec("Diatlov", 89, 40),
		insArg = rec("Gazizov", 89, 32),
		insArg0 = rec("Gazizov", 55, 3),
		insArg1 = rec("Bilyk", 8, 41),
		insArg2 = rec("Dudko", 80, 4.2),
		insArg3 = rec("Kuznetsov", 77, 5.5);

	printTb(tb, size);
	printRec(selDirect(tb, 1));
	printRec(insDirect(insArg, tb, 3, &size));
	printTb(tb, size);
	printRec(updDirect(insArg1, tb, 2, size));
	printRec(delDirect(tb, 1));
	printTb(tb, size);
	printRec(insLinear(insArg2, tb, &size));
	printTb(tb, size);
	printRec(delLinear(insArg1->key, tb, size));
	printTb(tb, size);
	printRec(updLinear(insArg->key, insArg0, tb, size));
	printTb(tb, size);
	packLinear(tb, &size);
	printTb(tb, size);
	sort(tb, size);
	printTb(tb, size);
	printRec(selBinary(tb, insArg2->key, size));
	printRec(insBinary(insArg3, tb, &size));
	insLinear(rec("abcnekld", 99, 5.5), tb, &size);
	printTb(tb, size);
	printRec(selBinary(tb, key("ne", 10), size));

	system("pause");
	return 0;
}