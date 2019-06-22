#ifndef _PAGE_MANAGER
#define _PAGE_MANAGER

#include "PM_Page.h"

class PageManager
{
private:

public:
	PM_Page* pages;
	unsigned int amount;
	Command* getSorted();
	PM_Page* getOldest();
	bool addCmd(unsigned int code, unsigned int id, char* data);
	void serialize(FILE* tgt);
	void deserialize(FILE* src);
	void setClear(unsigned int amount, unsigned int size);
};

#endif //_PAGE_MANAGER