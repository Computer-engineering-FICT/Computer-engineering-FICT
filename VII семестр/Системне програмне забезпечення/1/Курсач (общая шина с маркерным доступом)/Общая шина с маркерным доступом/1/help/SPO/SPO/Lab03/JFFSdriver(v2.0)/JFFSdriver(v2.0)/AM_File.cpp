#include "stdio.h"

#include "AM_File.h"

AM_File::AM_File()
{
	size = 0;
	cmdAreas = NULL;
}

AM_File::~AM_File()
{
	delete[] cmdAreas;
}

void AM_File::setActual(unsigned int cmdId, unsigned int offset, unsigned int length)
{
	if (size >= offset + length)
		for (unsigned int i = offset; i < offset + length; i++)
			cmdAreas[i] = cmdId;
}

void AM_File::setSize(unsigned int Isize, unsigned int cmdId)
{
	if (Isize > size)
	{
		delete[] cmdAreas;
		cmdAreas = new unsigned int[Isize];
		size = Isize;
		setActual(cmdId, 0, size);
	}
	else
	{
		unsigned int* old = cmdAreas;
		cmdAreas = new unsigned int[Isize];
		for (unsigned int i = 0; i < Isize; i++)
			cmdAreas[i] = old[i];
		size = Isize;
		delete[] old;
	}
}

bool AM_File::checkActual(unsigned int cmdId)
{
	bool res = false;
	for (unsigned int i = 0; ((i < size)&&(!res)); i++)
		if (cmdAreas[i] == cmdId)
			res = true;
	return res;
}