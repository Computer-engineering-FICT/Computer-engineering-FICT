#include <stdio.h>

#include "FileManager.h"

FileManager::FileManager()
{
	files = NULL;
	AM = AreaManager();
}

FileManager::~FileManager()
{
	FM_File* curr;
	while (files != NULL)
	{
		curr = files;
		files = files->next;
		delete curr;
	}
}

FM_File* FileManager::findById(unsigned int fId)
{
	FM_File* curr = files;
	while ((curr != NULL)&&(curr->id != fId))
		curr = curr->next;
	return curr;
}

void FileManager::addFile(unsigned int fId, unsigned int Isize, unsigned int cmdId)
{
	FM_File* t = new FM_File();
	t->next = files;
	files = t;
	t->id = fId;
	t->isOpened = false;
	t->linkAmount = 1;
	t->setSize(Isize);
	AM.addFile(fId, Isize, cmdId);
}

void FileManager::incLinks(unsigned int fId)
{
	FM_File* tgt = findById(fId);
	if (tgt != NULL)
		tgt->linkAmount++;
}

void FileManager::decLinks(unsigned int fId)
{
	FM_File* tgt = findById(fId);
	if (tgt != NULL)
	{
		if (tgt->linkAmount > 1)
			tgt->linkAmount--;
		else
		{
			if (tgt->isOpened == false)
			{
				if (tgt == files)
				{
					files = files->next;
					delete tgt;
					AM.removeFile(fId);
				}
				else
				{
					FM_File* curr = files;
					while (curr->next != tgt)
						curr = curr->next;
					curr->next = curr->next->next;
					delete tgt;
					AM.removeFile(fId);
				}
			}
		}
	}
}

bool FileManager::open(unsigned int fId)
{
	bool res = false;
	FM_File* tgt = findById(fId);
	if ((tgt!=NULL) && (tgt->isOpened != true))
	{
		tgt->isOpened = true;
		res = true;
	}
	return res;
}

void FileManager::close(unsigned int fId)
{
	FM_File* tgt = findById(fId);
	if (tgt != NULL)
		tgt->isOpened = false;
}

char* FileManager::read(unsigned int fId, unsigned int offset, unsigned int length)
{
	char* res = NULL;
	FM_File* tgt = findById(fId);
	if (tgt != NULL)
		res = tgt->read(offset, length);
	return res;
}

void FileManager::write(unsigned int fId, unsigned int offset, unsigned int length, char *src, unsigned int cmdId)
{
	FM_File* tgt = findById(fId);
	if (tgt != NULL)
	{
		tgt->write(offset, length, src);
		AM.setActual(fId, cmdId, offset, length);
	}
}

void FileManager::setSize(unsigned int fId, unsigned int Isize, unsigned int cmdId)
{
	FM_File* tgt = findById(fId);
	if (tgt != NULL)
	{
		tgt->setSize(Isize);
		AM.setSize(fId, Isize, cmdId);
	}
}

bool FileManager::checkActual(unsigned int fId, unsigned int cmdId)
{
	return AM.checkActual(fId, cmdId);
}