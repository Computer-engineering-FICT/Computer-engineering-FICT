#pragma once
#include "table.h"

void printRec(Record rec) {
	if (rec == 0)
		printf("No such record\n");
	else
		if (rec->key.str == 0)
			printf("EMPTY");
		else
			printf("key: \"%s\"; index: %d; data: %.3f%s\n", rec->key.str, rec->key.index, rec->val.data.x, rec->del == 1 ? " (is deleted)" : "");
}

void printTb(Table tb, int count) {
	printf("Table:\n");
	for (int i = 0; i < count; ++i) {
		printRec(tb[i]);
	}
	printf("\n");
}

Record rec(char* str, unsigned short index, double value) {
	Record res = (Record)malloc(sizeof(struct record));
	res->key.str = str;
	res->key.index = index;
	res->val.data.x = value;
	res->del = 0;
	return res;
}

Record emptyRec() {
	return rec(0, 0, 0);
}

Key key(char* str, unsigned short index) {
	Key res = { str, index };
	return res;
}

Record selDirect(Table tb, unsigned int num) {
	printf("select direct #%d:\n", num);
	--num;
	return tb[num];
}

Record insDirect(Record rec, Table tb, unsigned int num, int* count) {
	printf("insert direct #%d:\n", num);
	--num;
	while (*count < num + 1)
		tb[(*count)++] = emptyRec();
	tb[*count - 1] = rec;
	return tb[*count - 1];
}

Record delDirect(Table tb, unsigned int num) {
	printf("delete direct #%d:\n", num);
	--num;
	tb[num]->del = 1;
	return tb[num];
}

Record updDirect(Record rec, Table tb, unsigned int num, int count) {
	printf("update direct #%d:\n", num);
	--num;
	if (num > count - 1)
		return 0;
	tb[num] = rec;
	return tb[num];
}

int cmpKeys(Key key1, Key key2) {
	int cmp = strcmp(key1.str, key2.str);
	if (cmp != 0)
		return cmp;
	return key1.index - key2.index;
}

int cmpKeysSame(Key key1, Key key2) {
	for (int len = strlen(key1.str); len >= 0; --len) {
		for (int offset = 0; offset < strlen(key1.str) - len; ++offset) {
			char sub[100];
			strncpy(sub, key1.str + offset, len);
			sub[len] = '\0';
			//printf("%s\n", sub);
			char* c = strstr(key2.str, sub);
			if (c != NULL) {
				//printf("%s %s %d\n", key1.str, key2.str, len);
				return len;
			}
		}
	}
	printf("%s %s 0\n", key1.str, key2.str);
	return 0;
}

Record selLinear(Table tb, Key key, int count) {
	printf("select linear:\n");
	int maxSame = 0, maxSameInd = 0;
	for (int i = 1; i < count; ++i) {
		if (cmpKeysSame(key, tb[i]->key) > maxSame) {
			maxSame = cmpKeysSame(key, tb[i]->key);
			maxSameInd = i;
		}
	}
	return tb[maxSameInd];
	return 0;
}

Record insLinear(Record rec, Table tb, int* count) {
	printf("insert linear:\n");
	for (int i = 0; i <= *count; ++i) {
		if (i == *count || tb[i]->key.str == 0) {
			tb[i] = rec;
			if (i == *count)
				++(*count);
			return tb[i];
		}
	}
	return 0;
}

Record delLinear(Key key, Table tb, int count) {
	printf("delete linear:\n");
	Record res = selLinear(tb, key, count);
	if (res)
		res->del = 1;
	return res;
}

Record updLinear(Key key, Record rec, Table tb, int count) {
	printf("update linear:\n");
	Record res = selLinear(tb, key, count);
	if (res)
		*res = *rec;
	return res;
}

Table packLinear(Table tb, int* count) {
	printf("pack linear\n");
	int newCount = 0;
	for (int i = 0; i < *count; ++i) {
		if (tb[i]->del == 0)
			tb[newCount++] = tb[i];
	}
	*count = newCount;
	return tb;
}

Table sort(Table tb, int count) {
	printf("sort\n");
	for (int i = 0; i < count; ++i) {
		for (int k = 0; k < count - i - 1; ++k) {
			if (cmpKeys(tb[k]->key, tb[k + 1]->key) > 0) {
				Record t = tb[k];
				tb[k] = tb[k + 1];
				tb[k + 1] = t;
			}
		}
	}
	return tb;
}

Record selBinary(Table tb, Key key, int count) {
	printf("select binary:\n");
	int l = 0, r = count - 1;
	int maxSame = 0, maxSameInd = 0;
	do {
		int m = (l + r) / 2;
		int cmp = cmpKeys(tb[m]->key, key);
		if (cmpKeysSame(key, tb[m]->key) > maxSame) {
			maxSame = cmpKeysSame(key, tb[m]->key);
			maxSameInd = m;
		}
		if (cmp == 0)
			return tb[m];
		if (cmp < 0)
			l = m + 1;
		else
			r = m;
	} while (l != r);
	return tb[maxSameInd];
}

Record insBinary(Record rec, Table tb, int* count) {
	printf("insert binary:\n");
	Record res = selBinary(tb, rec->key, *count);
	if (!res || cmpKeys(rec->key, res->key) != 0) {
		tb[(*count)++] = rec;
		res = rec;
	}
	return res;
}

Record delBinary(Key key, Table tb, int count) {
	printf("delete binary:\n");
	Record res = selBinary(tb, key, count);
	if (res) {
		res->del = 1;
	}
	return res;
}

Record updBinary(Key key, Record rec, Table tb, int count) {
	printf("update binary:\n");
	Record res = selBinary(tb, key, count);
	if (res) {
		*res = *rec;
	}
	return res;
}