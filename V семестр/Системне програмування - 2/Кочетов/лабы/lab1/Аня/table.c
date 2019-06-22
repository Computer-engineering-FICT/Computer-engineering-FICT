#include "table.h"

Key prevKey = {0, 0};
int times = 0;

void printRec(Record record) {
	if (record == 0)
		printf("No such record\n");
	else
		if ((*record).key.str == 0)
			printf("EMPTY");
		else {
			char* isDeleted = "";
			if ((*record).del == 1)
				isDeleted = " (is deleted)";
			printf("key: \"%s\"; index: %d; data: %.3f%s\n", (*record).key.str, (*record).key.index, (*record).val.data.x, isDeleted);
		}
}

void printTb(Table tb, int tbSize) {
	printf("Table:\n");
	for (int i = 0; i < tbSize; ++i) {
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

Record selDirect(Table tb, unsigned char num) {
	printf("select direct #%d:\n", num);
	return tb[num - 1];
}

Record insDirect(Record record, Table tb, unsigned char num, int* tbSize) {
	printf("insert direct #%d:\n", num);
	while (*tbSize < num)
		tb[(*tbSize)++] = emptyRec();
	tb[*tbSize - 1] = record;
	return tb[*tbSize - 1];
}

Record delDirect(Table tb, unsigned char num) {
	printf("delete direct #%d:\n", num);
	(*tb[num - 1]).del = 1;
	return tb[num - 1];
}

Record updDirect(Record record, Table tb, unsigned char num, int tbSize) {
	printf("update direct #%d:\n", num);
	if (num > tbSize)
		return 0;
	tb[num - 1] = record;
	return tb[num - 1];
}

int cmpKeys(Key key1, Key key2) {
	int cmp = strcmp(key1.str, key2.str);
	if (cmp != 0)
		return cmp;
	return key1.index - key2.index;
}

int cmpKeysSame(Key key1, Key key2) {
	for (int len = strlen(key1.str); len > 0; --len) {
		for (int offset = 0; offset < strlen(key1.str) - len + 1; ++offset) {
			char sub[100];
			//записывает в саб вырезанную подстроку
			strncpy(sub, key1.str + offset, len);
			sub[len] = '\0';
			//returns adress of symbol с которого начиниается вхождение подстроки
			char* c = strstr(key2.str, sub);
			if (c != NULL) {
				return len;
			}
		}
	}
	return 0;
}

Record selLinear(Table tb, Key key, int tbSize) {
	printf("select linear:\n");
	if (key.str == prevKey.str)
		++times;
	else
		times = 0;
	prevKey = key;
	int maxSame = 0, maxCount = 0, timesSkipped = 0;
	for (int i = 0; i < tbSize; ++i) {
		if (cmpKeysSame(key, tb[i]->key) == maxSame)
			++maxCount;
		if (cmpKeysSame(key, tb[i]->key) > maxSame) {
			maxSame = cmpKeysSame(key, tb[i]->key);
			maxCount = 1;
		}
	}
	for (int i = 0; i < tbSize; ++i) {
		if (cmpKeysSame(key, (*tb[i]).key) == maxSame) {
			if (timesSkipped == times || timesSkipped == maxCount - 1)
				return tb[i];
			++timesSkipped;
		}
	}
	return 0;
}

Record insLinear(Record record, Table tb, int* tbSize) {
	printf("insert linear:\n");
	for (int i = 0; i <= *tbSize; ++i) {
		if (i == *tbSize || (*tb[i]).key.str == 0) {
			tb[i] = record;
			if (i == *tbSize)
				++(*tbSize);
			return tb[i];
		}
	}
	return 0;
}

Record delLinear(Key key, Table tb, int tbSize) {
	printf("delete linear:\n");
	Record res = selLinear(tb, key, tbSize);
	if (res)
		(*res).del = 1;
	return res;
}

Record updLinear(Key key, Record record, Table tb, int tbSize) {
	printf("update linear:\n");
	Record res = selLinear(tb, key, tbSize);
	if (res)
		*res = *record;
	return res;
}

Table packLinear(Table tb, int* tbSize) {
	printf("pack linear\n");
	int newtbSize = 0;
	for (int i = 0; i < *tbSize; ++i) {
		if (tb[i]->del == 0)
			tb[newtbSize++] = tb[i];
	}
	*tbSize = newtbSize;
	return tb;
}

Table sort(Table tb, int tbSize) {
	printf("sort\n");
	for (int i = 0; i < tbSize; ++i) {
		for (int k = 0; k < tbSize - i - 1; ++k) {
			if (cmpKeys(tb[k]->key, tb[k + 1]->key) > 0) {
				Record t = tb[k];
				tb[k] = tb[k + 1];
				tb[k + 1] = t;
			}
		}
	}
	return tb;
}

Record selBinary(Table tb, Key key, int tbSize) {
	printf("select binary:\n");
	int l = 0, r = tbSize - 1;
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

Record insBinary(Record record, Table tb, int* tbSize) {
	printf("insert binary:\n");
	Record res = selBinary(tb, record->key, *tbSize);
	if (!res || cmpKeys(record->key, res->key) != 0) {
		tb[(*tbSize)++] = record;
		res = record;
	}
	return res;
}

Record delBinary(Key key, Table tb, int tbSize) {
	printf("delete binary:\n");
	Record res = selBinary(tb, key, tbSize);
	if (res) {
		res->del = 1;
	}
	return res;
}

Record updBinary(Key key, Record record, Table tb, int tbSize) {
	printf("update binary:\n");
	Record res = selBinary(tb, key, tbSize);
	if (res) {
		*res = *record;
	}
	return res;
}
