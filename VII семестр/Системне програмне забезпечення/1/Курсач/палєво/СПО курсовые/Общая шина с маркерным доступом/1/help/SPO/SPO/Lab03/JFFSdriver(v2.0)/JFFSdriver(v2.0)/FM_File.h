#ifndef _FM_FILE
#define _FM_FILE

class FM_File
{
private:
	char* data;
	unsigned int size;
public:
	unsigned int id;
	unsigned int linkAmount;
	bool isOpened;
	FM_File* next;
	FM_File();
	~FM_File();
	void setSize(unsigned int newSize);
	char* read(unsigned int offset, unsigned int length);
	void write(unsigned int offset, unsigned int length, char* toWrite);
	bool open();
	void close();
};

#endif //_FM_FILE