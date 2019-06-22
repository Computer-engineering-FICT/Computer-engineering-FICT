#ifndef _OUTPUT_ELEMENTS
#define _OUTPUT_ELEMENTS

//states in state table
#define NODE_FREE 0
#define NODE_WORK 1
#define NODE_SEND 2
#define NODE_RECV 3

class ScheduleRow
{
public:
	unsigned int nodesAmount;
	unsigned int stepId;
	char* state;
	ScheduleRow* next;
};

#endif //_OUTPUT_ELEMENTS