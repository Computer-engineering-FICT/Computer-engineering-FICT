#include <stdio.h>

#include "AreaManager.h"

AreaManager::AreaManager()
{
	files = NULL;
}

AM_File* AreaManager::findById(unsigned int fId)
{
	AM_File* curr = files;
	while ((curr != NULL) && (curr->id != fId))
		curr = curr->next;
	return curr;
}

void AreaManager::addFile(unsigned int fId, unsigned int Isize, unsigned int cmdId)
{
	AM_File* newFile = new AM_File();
	newFile->id = fId;
	newFile->setSize(Isize, cmdId);
	newFile->next = files;
	files = newFile;
}

void AreaManager::setSize(unsigned int fId, unsigned int Isize, unsigned int cmdId)
{
	AM_File* tgt = findById(fId);
	if (tgt != NULL)
		tgt->setSize(Isize, cmdId);
}

void AreaManager::setActual(unsigned int fId, unsigned int cmdId, unsigned int offset, unsigned int length)
{
	AM_File* tgt = findById(fId);
	if (tgt != NULL)
		tgt->setActual(cmdId, offset, length);
}

void AreaManager::removeFile(unsigned int fId)
{
	AM_File* curr = files;
	if (files->id == fId)
	{
		files = files->next;
		delete curr;
	}
	else
	{
		while((curr->next != NULL) && (curr->next->id != fId))
			curr = curr->next;
		if (curr->next != NULL)
		{
			AM_File* toDel = curr->next;
			curr->next = curr->next->next;
			delete toDel;
		}
	}
}

bool AreaManager::checkActual(unsigned int fId, unsigned int cmdId)
{
	bool res = false;
	AM_File* tgt = findById(fId);
	res = tgt->checkActual(cmdId);
	return res;
}

AreaManager::~AreaManager()
{
	AM_File* toDel = NULL;
	while (files != NULL)
	{
		toDel = files;
		files = files->next;
		delete toDel;
	}
}