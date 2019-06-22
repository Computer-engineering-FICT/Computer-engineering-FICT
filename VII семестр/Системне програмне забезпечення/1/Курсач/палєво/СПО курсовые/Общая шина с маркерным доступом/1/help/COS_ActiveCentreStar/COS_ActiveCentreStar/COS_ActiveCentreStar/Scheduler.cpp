#include <stdlib.h>

#include "Scheduler.h"

void Scheduler::setNodesAmount(unsigned int Inodes)
{
	nodesAm = Inodes;
}

void Scheduler::receiveTasks(unsigned int ItaskAmount, Task *Itasks)
{
	tasks = Itasks;
	taskAmount = ItaskAmount;
}

void Scheduler::receiveLinks(unsigned int IlinkAmount, TaskLink *Ilinks)
{
	this->linkAmount  = IlinkAmount;
	links = Ilinks;
}

void Scheduler::prepare()
{
	step = 0;
	nodeStates = new char[nodesAm];
	nodesHist = (unsigned int**) new unsigned int[nodesAm * (taskAmount + linkAmount)];
	for (unsigned int i = 0; i < nodesAm; i++)
	{
		nodeStates[i] = 0;
		for (unsigned int j = 0; j < (taskAmount + linkAmount); j++)
			nodesHist[i][j] = 0xffffffff;
	}
	internalSchedule = new ScheduleRow();
	internalSchedule->next = NULL;
	internalSchedule->nodesAmount = nodesAm;
	internalSchedule->stepId = step;
	internalSchedule->state = new char[nodesAm];
	for (unsigned int i = 0; i < nodesAm; i++)
		internalSchedule->state[i] = 0;
	IStail = internalSchedule;
	for (int i = 0; i < taskAmount; i++)
		tasks[i].done = false;
	linkStates = new char[linkAmount];
	for (int i = 0; i < linkAmount; i++)
		linkStates[i] = 0;
	taskStates = new char[taskAmount];
	for (int i = 0; i < taskAmount; i++)
		taskStates[i] = 0;
	events = NULL;
}

bool Scheduler::isEnded()
{
	bool ended = true;
	for (int i = 0; i < taskAmount; i++)
		ended = ended && tasks[i].done;
	return ended;
}

int Scheduler::isSingleThreaded()
{
	int res = 1;
	for (unsigned int i = 1; i < nodesAm; i++)
		res = res * nodeStates[i];
}

unsigned int Scheduler::getLastTask(unsigned int nodeId)
{
	int ll = 0;
	res = 0xffffffff;
	while(nodesHist[nodeId][ll] != 0xffffffff)
	{
		if ((nodesHist[nodeId][ll] & 0x80000000) == 0)
			res = nodesHist[nodeId][ll];
		ll++;
	}
	return res;
}

unsigned int Scheduler::getLastTask(unsigned int nodeId)
{
	int ll = 0;
	res = 0xffffffff;
	while(nodesHist[nodeId][ll] != 0xffffffff)
	{
		if ((nodesHist[nodeId][ll] & 0x80000000) != 0)
			res = nodesHist[nodeId][ll];
		ll++;
	}
	return res;
}

bool Scheduler::isAtNode(unsigned int nodeId, unsigned int tgt)
{
	bool res = false;
	for (int i = 0; ((i < (taskAmount + linkAmount))&&(!res)); i++)
		if (nodesHist[(taskAmount + linkAmount)*nodeId + i] == tgt)
			res = true;
	return res;
}

ScheduleRow* Scheduler::runStep()
{
	// TODO realize this
	step++;
	//process independent events
	Event* curr = events;
	while ((events != NULL)&&(events->isIndepend)&&(events->stepId <= step))
	{
		Event* lfn = events;
		bool allow = true;
		while ((lfn != NULL) && allow)
		{
			if ((lfn->node = events->node) && (!lfn->isIndepend) && (lfn->stepId < events->stepId))
				allow = false;
		}
		if (allow)
		{
			nodeStates[events->node] = events->nextState;
			curr = events;
			events = events->next;
			if ((curr->actionId & 0x80000000)==0)
			{
				taskStates[curr->actionId] = 3;
				tasks[curr->actionId].done = true;
			}
			else
			{
				if (linkStates[(curr->actionId & 0x80000000)] == 1)
				{
					linkStates[(curr->actionId & 0x80000000)] = 2;
					links[(curr->actionId & 0x80000000)].done = true;
				}
				else
					linkStates[(curr->actionId & 0x80000000)] = 1;
			}
			delete curr;
		}
	}
	curr = events;
	Event* toDel;
	while (curr->next != NULL)
	{
		while ((curr->next != NULL)&&(curr->next->isIndepend)&&(curr->next->stepId <= step))
		{
			Event* lfn = events;
			bool allow = true;
			while ((lfn != NULL) && allow)
			{
				if ((lfn->node = curr->next->node) && (!lfn->isIndepend) && (lfn->stepId < curr->next->stepId))
					allow = false;
			}
			if (allow)
			{
				nodeStates[curr->next->node] = curr->next->nextState;
				if ((curr->next->actionId & 0x80000000)==0)
				{
					taskStates[curr->next->actionId] = 3;
					tasks[curr->next->actionId].done = true;
				}
				else
				{
					if (linkStates[(curr->next->actionId & 0x80000000)] == 1)
					{
						linkStates[(curr->next->actionId & 0x80000000)] = 2;
						links[(curr->next->actionId & 0x80000000)].done = true;
					}
					else
						linkStates[(curr->next->actionId & 0x80000000)] = 1;
				}
				toDel = curr->next;
				curr->next = curr->next->next;
				delete toDel;
			}
		}
	}
	// if central free 
	while(nodeStates[0] == NODE_FREE)
	{
	// process/delete events
		unsigned int minStepId = step;
		Event* toProcess = NULL;
		curr = events;
		while (curr!= NULL)
		{
			if (curr->stepId <= minStepId)
			{
				toProcess = curr;
				minStepId = curr->stepId;
			}
			curr = curr->next;
		}
		if (toProcess != NULL)
		{
			// set sending
			unsigned int lId = toProcess->actionId & 0x7fffffff;
			if (events == toProcess)	
			{
				events = events->next;
				delete toProcess;
			}
			else
			{
				Event* ce = events;
				while (ce->next != toProcess)
					ce = ce->next;
				ce->next = toProcess->next;
				delete toProcess;
			}
		}
		// or waiting
		else
		{
			if (getLastLink(toProcess->node) != 0xffffffff)
				links[getLastLink(toProcess->node)].done = true;
			linkStates[getLastLink(toProcess->node)] = 1;
			toProcess->stepId = toProcess->stepId + weight;
			for (int j = (taskAmount + linkAmount - 1); j > 0; j++)
				nodesHist[toProcess->node][j+1] = nodesHist[toProcess->node][j];
			nodesHist[toProcess->node][0] = 0x80000000 | id;
			nodeStates[toProcess->node] = NODE_SEND;
			nodeStates[0] = NODE_RECV;
			linkSatates[id] = 3;
		}
	}
	for (int i = 0; i < taskAmount; i++)
		if (taskStates[i] == 0)
		{
			taskStates[i] = 1;
			for (int j = 0; j < linkAmount; j++)
				if ((links[j].endTask == i) && (linkStates[j] != 2))
					taskStates[i] = 0;
		}
	// while central free
	while (nodeStates[0] == 0)
	{
		// find avaliable tasks
		int avt = 0;
		for (int i = 0; i < taskAmount; i++)
			if (taskStates[i] == 1)
				avt++;
		// check if single task plannig
		if (avt == 1)
		{
			int tId = 0;
			for (int i = 1; i < taskAmount; i++)
				if (taskStates[i] == 1)
					tId = i;
			unsigned int minTimerCall = events->stepId;
			Event* ce = events->next;
			while (ce != NULL)
			{
				if (ce->stepId < minTimerCall)
					minTimerCall = ce->stepId;
			}
			if ((minTimerCall - step) >= tasks[tId].weight)
			{
				nodeStates[0] = NODE_WORK;
				taskStates[tId] = 2;
				tasks[tId].done = true;
				for (int j = (taskAmount + linkAmount - 1); j > 0; j++)
					nodesHist[0][j+1] = nodesHist[0][j];
				nodesHist[0][0] = tId;
				Event* ne = new Event();
				ne->next = events;
				ne->actionId = tId;
				ne->isIndepend = true;
				ne->nextState = 0;
				ne->node = 0;
				ne->stepId = step + tasks[tId].weight;
				events = ne;
			}
		}
		else
		{
			int freeProcs = 0;
			for (int i = 0; i < nodesAm; i++)
				if (nodeStates[i] = NODE_FREE)
					freeProcs++;
			int mwt;
			int mw = 0;
			int pId = 0;
			unsigned int tgtStep = step;
			Event* ce1 = NULL;
			for (int i = freeProcs, int j = avt; ((i > 1)&&(j > 1)); i--, j--)
			{
				// find maxWeight task
				for (int k = 0; k < taskAmount; k++)
					if ((taskStates[k] == 1)&&(tasks[k].weight >= mw))
					{
						mw = tasks[k].weight;
						mwt = k;
					}
				for (int k = 0; k < nodesAm; k++)
					if (nodeStates[k] == NODE_FREE)
						pId = k;
				for (int j = (taskAmount + linkAmount - 1); j > 0; j++)
					nodesHist[pId][j+1] = nodesHist[pId][j];
				nodesHist[pId][0] = mwt;
				// send to processor
				for (int k = 0; k < linkAmount; k++)
				{
					if ((links[k].endTask == mwt)&&(linkStates[k] != 2)&&(!isAtNode(pId, links[k].beginTask)))
					{
						ce1 = new Event();
						ce1->actionId = k | 0x80000000;
						ce1->isIndepend = false;
						ce1->next = events;
						events = ce1;
						ce1->node = pId;
						ce1->stepId = tgtStep;
						ce1 = new Event();
						ce1->actionId = 0;
						ce1->isIndepend = true;
						ce1->next = events;
						events = ce1;
						ce1->node = 0;
						ce1->stepId = tgtStep;
						ce1->nextState = NODE_FREE;
						tgtStep += links[k].weight;
					}
				}
				ce1 = new Event();
				ce1->actionId = mwt;
				ce1->isIndepend = true;
				ce1->next = events;
				events = ce1;
				ce1->node = pId;
				ce1->stepId = tgtStep;
				ce1->nextState = NODE_WORK;
				ce1 = new Event();
				ce1->actionId = 0;
				ce1->isIndepend = true;
				ce1->next = events;
				events = ce1;
				ce1->node = 0;
				ce1->stepId = tgtStep;
				ce1->nextState = NODE_FREE;
				tgtStep += mw;
				for (int k = 0; k < linkAmount; k++)
				{
					if ((links[k].beginTask == mwt)&&(linkStates[k] != 1)
					{
						ce1 = new Event();
						ce1->actionId = k | 0x80000000;
						ce1->isIndepend = false;
						ce1->next = events;
						events = ce1;
						ce1->node = pId;
						ce1->stepId = tgtStep;
						ce1 = new Event();
						ce1->actionId = 0;
						ce1->isIndepend = true;
						ce1->next = events;
						events = ce1;
						ce1->node = 0;
						ce1->stepId = tgtStep;
						ce1->nextState = NODE_FREE;
						tgtStep += links[k].weight;
					}
				}
				ce1 = new Event();
				ce1->actionId = mwt;
				ce1->isIndepend = true;
				ce1->next = events;
				events = ce1;
				ce1->node = pId;
				ce1->stepId = tgtStep;
				ce1->nextState = NODE_FREE;
				ce1 = new Event();
				ce1->actionId = 0;
				ce1->isIndepend = true;
				ce1->next = events;
				events = ce1;
				ce1->node = 0;
				ce1->stepId = tgtStep;
				ce1->nextState = NODE_FREE;
				tgtStep += mw;
			}
			//process for 0-node
			int tId = 0;
			for (int i = 1; i < taskAmount; i++)
				if (taskStates[i] == 1)
					tId = i;
			unsigned int minTimerCall = events->stepId;
			Event* ce = events->next;
			while (ce != NULL)
			{
				if (ce->stepId < minTimerCall)
					minTimerCall = ce->stepId;
			}
			if ((minTimerCall - step) >= tasks[tId].weight)
			{
				nodeStates[0] = NODE_WORK;
				taskStates[tId] = 2;
				tasks[tId].done = true;
				for (int j = (taskAmount + linkAmount - 1); j > 0; j++)
					nodesHist[0][j+1] = nodesHist[0][j];
				nodesHist[0][0] = tId;
				Event* ne = new Event();
				ne->next = events;
				ne->actionId = tId;
				ne->isIndepend = true;
				ne->nextState = 0;
				ne->node = 0;
				ne->stepId = step + tasks[tId].weight;
				events = ne;
			}
		}
	}
	//return result
	IStail->next = new ScheduleRow();
	IStail = IStail->next;
	IStail->next = NULL;
	IStail->nodesAmount = nodesAm;
	IStail->state = new char[nodesAm];
	for (int i = 0; i < nodesAm; i++)
		IStail->state[i] = nodeStates[i];
	return internalSchedule;
}

ScheduleRow* Scheduler::runToEnd()
{
	ScheduleRow* res;
	while (!isEnded())
	{
		res = runStep();
	}
	return res;
}

void Scheduler::clear()
{
	IStail = internalSchedule;
	delete[] (unsigned int*)nodesHist;
	ScheduleRow* cr;
	while (IStail != NULL);
	{
		cr = IStail;
		IStail = cr->next;
		delete[] cr->state;
	}
	cr = NULL;
	delete[] links;
	delete[] tasks;
	delete[] nodeStates;
	delete[] linkStates;
	delete[] taskStates;
	nodesAm = 0;
	taskAmount = 0;
	linkAmount = 0;
	step = 0;
}