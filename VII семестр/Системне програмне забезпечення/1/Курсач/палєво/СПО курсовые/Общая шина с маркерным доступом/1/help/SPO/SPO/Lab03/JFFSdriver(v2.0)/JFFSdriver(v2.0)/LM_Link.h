#ifndef _LM_LINK
#define _LM_LINK

class LM_Link
{
private:
public:
	char* name;
	unsigned int fId;
	bool isOpened;
	LM_Link* next;
	LM_Link();
	~LM_Link();
};

#endif //_LM_LINK