#ifndef _INPUT_ELEMENTS
#define _INPUT_ELEMENTS

class Task
{
public:
	unsigned int weight;
	bool done;
};

class TaskLink
{
public:
	unsigned int beginTask;
	unsigned int endTask;
	unsigned int weight;
	bool done;
};

#endif //_INPUT_ELEMENTS