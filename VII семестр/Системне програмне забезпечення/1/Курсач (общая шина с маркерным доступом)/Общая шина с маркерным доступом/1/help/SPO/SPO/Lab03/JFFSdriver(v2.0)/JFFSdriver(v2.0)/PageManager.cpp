#include "PageManager.h"

void PageManager::setClear(unsigned int amount, unsigned int size)
{
	pages = new PM_Page[amount];
	this->amount = amount;
}