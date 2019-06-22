#include <stdio.h>

int main() {
	int varA[11];
	int varB[11];
	int varC[12];
	int toInit = 0x10000;
	int i;
	for (i = 0; i < 11; i++) {
		varA[i] = 0x80000001;
		varB[i] = varA[i];
		varA[i] += toInit;
		toInit  += 0x10000;
	}
	printf("%X", varA[0]);
	return 0;
}
/*
int* add(int a[11]; int b[11]; int c[12]) {
	int test[5];
	return c;
}*/
