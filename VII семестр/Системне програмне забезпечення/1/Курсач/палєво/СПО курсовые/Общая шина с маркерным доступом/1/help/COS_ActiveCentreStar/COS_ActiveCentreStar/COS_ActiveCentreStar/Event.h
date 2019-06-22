#ifndef _EVENT
#define _EVENT

class Event
{
private:

public:
	unsigned int stepId;
	unsigned int node;
	char nextState;
	bool isIndepend;
	unsigned int actionId;
	Event* next;
};

#endif //_EVENT