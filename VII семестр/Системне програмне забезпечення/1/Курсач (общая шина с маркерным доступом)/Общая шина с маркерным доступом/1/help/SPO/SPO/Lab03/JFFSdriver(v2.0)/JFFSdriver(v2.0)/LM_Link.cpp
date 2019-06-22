#include <stdio.h>

#include "LM_Link.h"

LM_Link::LM_Link()
{
	name = NULL;
	fId = 0xffffffff;
	isOpened = false;
	next = NULL;
}

LM_Link::~LM_Link()
{
	delete[] name;
}