class Change
{
public:
	//unsigned int fId;
	unsigned int offset;
	unsigned int amount;
	Change* next;
};

class ChangeChain
{
public:
	Change* ch;
	unsigned int fId;
	unsigned int cId;
	ChangeChain* next;
};