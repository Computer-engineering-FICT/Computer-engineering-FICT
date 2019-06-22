#include <stdio.h>
#include <string.h>

#include "PM_Page.h"

void PM_Page::serialize(FILE* tgt)
{
	fwrite(&size, 4, 1, tgt);
	fwrite(&amount, 4, 1, tgt);
	fwrite(&version, 4, 1, tgt);
	fwrite(&cmdAmount, 4, 1, tgt);
	char tc = 0;
	Command* curr = cm;
	while(curr != NULL)
	{
		fwrite(&(curr->code), 4, 1, tgt);
		fwrite(&(curr->id), 4, 1, tgt);
		fwrite(curr->data, curr->data[0], 1, tgt);
		curr = curr->next;
	}
}

Command* PM_Page::getLast()
{
	Command* res = cm;
	if (res != NULL)
		while (res->next != NULL)
			res = res->next;
	return res;
}

void PM_Page::deserialize(FILE *src)
{
	fread(&size, 4, 1, src);
	fread(&amount, 4, 1, src);
	fread(&version, 4, 1, src);
	fread(&cmdAmount, 4, 1, src);
	if (cmdAmount > 0)
	{
		cm = new Command();
		cm->next = NULL;
		fread(&(cm->code), 4, 1, src);
		fread(&(cm->id), 4, 1, src);
		char tc;
		fread(&tc, 1, 1, src);
		cm->data = new char[tc];
		cm->data[0] = tc;
		fread(&(cm->data[1]), (tc - 1), 1, src);
		Command* t = NULL;
		for (unsigned int i = 1; i < cmdAmount; i++)
		{
			t = getLast();
			t->next = new Command();
			t = t->next;
			t->next = NULL;
			fread(&(t->code), 4, 1, src);
			fread(&(t->id), 4, 1, src);
			fread(&tc, 1, 1, src);
			t->data = new char[tc];
			t->data[0] = tc;
			fread(&(t->data[1]), (tc - 1), 1, src);
		}
	}
}

unsigned int PM_Page::countFreeSpace()
{
	unsigned int res = size;
	Command* curr = cm;
	while (curr != NULL)
	{
		res = res - curr->data[0] - 8;
		curr = curr->next;
	}
	return res;
}

bool PM_Page::addCmd(unsigned int code, unsigned int id, char *data)
{
	unsigned int t1 = countFreeSpace();
	if (t1 > (8 + data[0]))
	{
		if (cmdAmount < 1)
		{
			cmdAmount = 1;
			cm = new Command();
			cm->next = NULL;
			cm->code = code;
			cm->id = id;
			cm->data = new char[data[0]];
			strcpy(cm->data, data);
		}
		else
		{
			Command* t = getLast();
			t->next = new Command();
			t = t->next;
			t->next = NULL;
			t->code = code;
			t->id = id;
			t->data = new char[data[0]];
			strcpy(t->data, data);
		}
		return true;
	}
	return false;
}