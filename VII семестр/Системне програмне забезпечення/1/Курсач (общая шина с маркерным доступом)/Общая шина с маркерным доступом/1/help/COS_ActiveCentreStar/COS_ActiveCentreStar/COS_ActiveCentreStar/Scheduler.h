#ifndef _SHCEDULER
#define _SCHEDULER

#include "inputElements.h"
#include "outputElements.h"
#include "Event.h"

class Scheduler
{
private:
	unsigned int nodesAm;
	unsigned int taskAmount;
	unsigned int linkAmount;
	unsigned int step;
	char* nodeStates;
	char* taskStates;
	char* linkStates;
	Event* events;
	Task* tasks;
	TaskLink* links;
	ScheduleRow* internalSchedule;
	unsigned int** nodesHist; 
	ScheduleRow* IStail;
public:
	void setNodesAmount(unsigned int Inodes);
	void receiveTasks(unsigned int ItaskAmount, Task* Itasks);
	void receiveLinks(unsigned int IlinkAmount, TaskLink* Ilinks);
	void prepare();
	bool isEnded();
	bool isSingleThreaded();
	ScheduleRow* runStep();
	ScheduleRow* runToEnd();
	void clear();
	unsigned int getLastTask(unsigned int nodeId);
	unsigned int getLastLink(unsigned int nodeId);
	bool isAtNode(unsigned int nodeId, unsigned int tgt);
};

#endif //_SCHEDULER