#ifndef _AREA_MANAGER
#define _AREA_MANAGER

#include "AM_File.h"

class AreaManager
{
private:
	AM_File* files;
	AM_File* findById(unsigned int fId);
public:
	AreaManager();
	~AreaManager();
	void setSize(unsigned int fId, unsigned int Isize, unsigned int cmdId);
	void addFile(unsigned int fId, unsigned int Isize, unsigned int cmdId);
	void setActual(unsigned int fId, unsigned int cmdId, unsigned int offset, unsigned int length);
	void removeFile(unsigned int fId);
	bool checkActual(unsigned int fId, unsigned int cmdId); 
};

#endif //_AREA_MANAGER