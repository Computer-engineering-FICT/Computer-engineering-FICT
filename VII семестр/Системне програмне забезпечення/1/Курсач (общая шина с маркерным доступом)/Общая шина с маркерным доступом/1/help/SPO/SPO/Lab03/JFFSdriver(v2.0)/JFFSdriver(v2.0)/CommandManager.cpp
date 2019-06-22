#include <stdio.h>
#include <string.h>

#include "CommandManager.h"

Command* CommandManager::getTail()
{
	Command* curr = NULL;
	if (ncm != NULL)
	{
		curr = ncm;
		while (curr->next != NULL)
			curr = curr->next;
	}
	return curr;
}

void CommandManager::addCmd(unsigned int code, unsigned int id, char *data)
{
	Command* tail = getTail();
	if (tail == NULL)
	{
		ncm = new Command();
		ncm->next = NULL;
		ncm->code = code;
		ncm->id = id;
		ncm->data = new char[data[0]];
		strcpy(ncm->data, data);
	}
	else
	{
		tail->next = new Command();
		tail = tail->next;
		tail->code = code;
		tail->id = id;
		tail->data = new char[data[0]];
		strcpy(tail->data, data);
	}
}

void CommandManager::mountCmds()
{
	cm = PM->getSorted();
}

void CommandManager::sendToPages()
{
	Command* curr = ncm;
	PM_Page* tgtPage = PM->getOldest();
	while ((curr != NULL)&&((curr->data[0] + 8) > tgtPage->countFreeSpace))
	{
		bool act = false;
		switch (curr->code)
		{
		case 4://check create node
			if (LM->open(&(curr->data[5])))
				act = true;
			break;
		case 5: // check unlink node
			break;
		case 10: // check write node
// упрощный вар-т - не актулен если файла нет
			
			break;
		case 11: // check addName 
//неактулен, если ссылка удалена
			cf = fdt;
			actual[currActual] = false;
			while ((cf != NULL)&&(!actual[currActual]))
			{
				if (strcmp(cf->linkName, &(curr->data[(1 + strlen(&(curr->data[1])))])) == 0)
					actual[currActual] = true;
				cf = cf->next;
			}
			break;
		case 12: // check truncate node
// неактуален если файл удален
			dFId = *((unsigned int*)(&(curr->data[1])));
			cf = fdt;
			actual[currActual] = false;
			while ((cf != NULL)&&(!actual[currActual]))
			{
				if (cf->id == dFId)
					actual[currActual] = true;
				cf = cf->next;
			}
			break;
		}
	}
}