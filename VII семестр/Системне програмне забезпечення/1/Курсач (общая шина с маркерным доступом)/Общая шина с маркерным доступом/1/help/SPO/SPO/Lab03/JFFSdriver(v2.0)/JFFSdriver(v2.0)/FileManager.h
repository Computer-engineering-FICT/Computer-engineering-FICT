#ifndef _FILE_MANAGER
#define _FILE_MANAGER

#include "AreaManager.h"
#include "FM_File.h"

class FileManager
{
private:
	AreaManager AM;
	FM_File* files;
	FM_File* findById(unsigned int fId);
public:
	FileManager();
	~FileManager();
	void addFile(unsigned int fId, unsigned int Isize, unsigned int cmdId);
	void incLinks(unsigned int fId);
	void decLinks(unsigned int fId);
	bool open(unsigned int fId);
	void close(unsigned int fId);
	char* read(unsigned int fId, unsigned int offset, unsigned int length);
	void write(unsigned int fId, unsigned int offset, unsigned int length, char* src, unsigned int cmdId);
	void setSize(unsigned int fId, unsigned int Isize, unsigned int cmdId);
	bool checkActual(unsigned int fId, unsigned int cmdId);
};

#endif //_FILE_MANAGER