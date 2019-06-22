#ifndef _PM_PAGE
#define _PM_PAGE

#include <stdlib.h>

#include "Command.h"

class PM_Page
{
private:
	Command* cm;
	Command* getLast();
public:
	unsigned int size;
	unsigned int amount;
	unsigned int version;
	unsigned int cmdAmount;
	void serialize(FILE* tgt);
	void deserialize(FILE* src);
	unsigned int countFreeSpace();
	bool addCmd(unsigned int code, unsigned int id, char* data);
};

#endif //_PM_PAGE