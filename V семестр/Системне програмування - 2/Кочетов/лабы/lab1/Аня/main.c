#include "table.h"

int main() {
	Table tb = (Table) malloc(100 * sizeof(Record));
	int size = 0;

	printRec(insLinear(rec("Pink", 88, 4), tb, &size));
	printRec(insLinear(rec("Yellow", 89, 3.5), tb, &size));

	Record
		tstArg = rec("Red", 89, 40),
		insArg = rec("Orange", 89, 32),
		insArg0 = rec("Green", 55, 3),
		insArg1 = rec("Blue", 8, 41),
		insArg2 = rec("White", 80, 4.2);
	
		
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
	printRec(insLinear(rec("Black", 15, 5.5), tb, &size));
	printTb(tb, size);
	printRec(selLinear(tb, key("a", 4), size));
	printRec(selLinear(tb, key("ac", 4), size));
		

	system("pause");
	return 0;
}

