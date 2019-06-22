#ifndef _LINK_MANAGER
#define _LINK_MANAGER

#include "LM_Link.h"

class LinkManager
{
private:
	LM_Link* links;
	LM_Link* findByName(char* Iname);
public:
	LinkManager();
	~LinkManager();
	void addLink(char* Iname, unsigned int fId);
	void removeLink(char* Iname);
	bool open(char* Iname);
	void close(char* Iname);
	unsigned int getFileId(char* Iname);
};

#endif //_LINK_MANAGER