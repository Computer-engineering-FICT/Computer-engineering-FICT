#ifndef _JFFS_DRIVER
#define _JFFS_DRIVER

#include <stdlib.h>

#include "Space.h"
#include "PDT.h"
#include "FDT.h"
#include "Command.h"
#include "Changes.h"

class JFFSdriver
{
private:
	static bool go;
	void (JFFSdriver::*actions[13])(char*);
	void (JFFSdriver::*inputActions[13])();
	//datastructs
	static unsigned int cId;
	static FILE* fs;
	static SpaceDescr sd;
	static Command* cm;
	static Command* ncm;
	static PageDescr* pdt;
	static FileDescr* fdt;
	// methods of input commands
	void inputFormat();
	void inputMount();
	void inputUnmount();
	void inputBlockStat();
	void inputCreate();//
	void inputUnlink();//
	void inputList();
	void inputOpen();
	void inputClose();
	void inputRead();
	void inputWrite();//
	void inputAddName();//
	void inputTruncate();//
	// operations for executing with file system and files (interpreter)
	void format(char* data);
	void mount(char* data);
	void unmount(char* data);
	void blockStat(char* data);
	void create(char* data);
	void unlink(char* data);
	void list(char* data);
	void open(char* data);
	void close(char* data);
	void read(char* data);
	void write(char* data);
	void addName(char* data);
	void truncate(char* data);
public:
	static ChangeChain* chgs;
	JFFSdriver();
	static void setReady();
	void commandCycle();
};

#endif //_JFFS_DRIVER