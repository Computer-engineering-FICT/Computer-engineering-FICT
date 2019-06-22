#ifndef _PDT
#define _PDT

#include <stdio.h>

#include "Command.h"

class PageDescr
{
public:
	unsigned int version;
	unsigned int records;
	unsigned int activeR;
	unsigned int pageSize;
	unsigned int pageAmount;
	Command* rchain;
	unsigned int* passive;
	//PageDescr* next;
	void serialize(FILE* dst);
	void deserialize(FILE* dst);
};

#endif //_PDT