#pragma once
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

struct struct2 {
	double x;
};

struct key {
	char* str;
	unsigned short index;
};

struct func {
	struct struct2 data;
};

struct record {
	struct key key;
	struct func val;
	char del;
};

typedef struct record* Record;
typedef struct record** Table;
typedef struct key Key;

void printRec(Record rec);
void printTb(Table tb, int count);

Record rec(char* str, unsigned short index, double value);
Record emptyRec();
struct key key(char* str, unsigned short index);

Record selDirect(Table tb, unsigned int num);
Record insDirect(Record rec, Table tb, unsigned int num, int* count);
Record delDirect(Table tb, unsigned int num);
Record updDirect(Record rec, Table tb, unsigned int num, int count);

int cmpKeys(Key key1, Key key2);
int cmpKeysSame(Key key1, Key key2);

Record selLinear(Table tb, Key key, int count);
Record insLinear(Record rec, Table tb, int* count);
Record delLinear(Key key, Table tb, int count);
Record updLinear(Key key, Record rec, Table tb, int count);
Table packLinear(Table tb, int* count);

Table sort(Table tb, int count);
Record selBinary(Table tb, Key key, int count);
Record insBinary(Record rec, Table tb, int* count);
Record delBinary(Key key, Table tb, int count);
Record updBinary(Key key, Record rec, Table tb, int count);