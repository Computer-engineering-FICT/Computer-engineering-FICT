#ifndef _AM_FILE
#define _AM_FILE

class AM_File
{
private:
	unsigned int size;
	unsigned int* cmdAreas;
public:
	unsigned int id;
	AM_File* next;
	AM_File();
	~AM_File();
	bool checkActual(unsigned int cmdId);
	void setSize(unsigned int Isize, unsigned int cmdId);
	void setActual(unsigned int cmdId, unsigned int offset, unsigned int length);
};

#endif //_AM_FILE