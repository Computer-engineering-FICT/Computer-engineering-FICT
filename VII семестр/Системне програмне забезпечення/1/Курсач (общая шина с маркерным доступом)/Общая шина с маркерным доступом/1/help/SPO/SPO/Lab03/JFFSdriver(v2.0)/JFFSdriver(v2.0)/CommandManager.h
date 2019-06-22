#ifndef _COMMAND_MANAGER
#define _COMMAND_MANAGER

#include "Command.h"
#include "PageManager.h"
#include "LinkManager.h"
#include "FileManager.h"

class CommandManager
{
private:
	Command* getTail();
public:
	PageManager* PM;
	LinkManager* LM;
	FileManager* FM;
	Command* cm;
	Command* ncm;
	void sendToPages();
	void addCmd(unsigned int code, unsigned int id, char* data);
	void mountCmds();
};

#endif //_COMMAND_MANAGER