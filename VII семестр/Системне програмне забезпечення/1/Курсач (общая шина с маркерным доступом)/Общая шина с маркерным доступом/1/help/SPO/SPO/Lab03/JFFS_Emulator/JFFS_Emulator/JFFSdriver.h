#ifndef _JFFS_DRIVER
#define _JFFS_DRIVER

#include <stdlib.h>

class JFFSdriver
{
private:
	void (JFFSdriver::*actions[13])(char*);
	void (JFFSdriver::*inputActions[13])();
	//datastructs
	unsigned int cId;
	FILE* fs;
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
	JFFSdriver();
	static void setReady();
	void commandCycle();
};

#endif //_JFFS_DRIVER