#include <stdio.h>
#include <string.h>

#include "LinkManager.h"

LinkManager::LinkManager()
{
	links = NULL;
}

LinkManager::~LinkManager()
{
	LM_Link* curr;
	while (links != NULL)
	{
		curr = links;
		links = links->next;
		delete curr;
	}
}

void LinkManager::addLink(char *Iname, unsigned int fId)
{
	LM_Link* t = new LM_Link();
	t->fId = fId;
	t->name = new char[strlen(Iname)];
	strcpy(t->name, Iname);
	t->next = links;
	links = t;
}

LM_Link* LinkManager::findByName(char *Iname)
{
	LM_Link* curr = links;
	while ((curr != NULL) && (strcmp(curr->name, Iname) != 0))
		curr = curr->next;
	return curr;
}

void LinkManager::removeLink(char *Iname)
{
	if (strcmp(links->name, Iname) == 0)
	{
		LM_Link* t = links;
		links = links->next;
		delete t;
	}
	else
	{
		LM_Link* t = links;
		while ((t->next != NULL) && (strcmp(t->next->name, Iname) == 0))
			t = t->next;
		if (t->next != NULL)
		{
			LM_Link* toDel = t->next;
			t->next = t->next->next;
			delete toDel;
		}
	}
}

unsigned int LinkManager::getFileId(char *Iname)
{
	LM_Link* tgt = findByName(Iname);
	unsigned int res = 0xffffffff;
	if (tgt != NULL)
		res = tgt->fId;
	return res;
}

bool LinkManager::open(char *Iname)
{
	bool res;
	LM_Link* tgt = findByName(Iname);
	if ((tgt != NULL) && (tgt->isOpened == false))
	{
		tgt->isOpened = true;
		res = true;
	}
	return res;
}

void LinkManager::close(char *Iname)
{
	LM_Link* tgt = findByName(Iname);
	if (tgt != NULL)
		tgt->isOpened = false;
}