#ifndef _COMMAND
#define _COMMAND

class Command
{
private:
public:
	unsigned int id;
	unsigned int code;
	char* data;
	Command* next;
};

#endif //_COMMAND