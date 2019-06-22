#ifndef _FDT
#define _FDT

class FileDescr
{
public:
	char* linkName;
	unsigned int id;
	unsigned int len;
	char* field;
	FileDescr* next;
};

#endif //_FDT