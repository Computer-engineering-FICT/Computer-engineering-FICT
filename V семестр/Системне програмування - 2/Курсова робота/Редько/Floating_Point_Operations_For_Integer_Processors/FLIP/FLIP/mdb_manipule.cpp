/**
 * @file mdb_manipule.cpp
 * @brief Код для @link mdb_manipule.h@endlink
 */

#include "my_double.h"
#include "adduction.h"
#include "mdb_string.h"
#include <stdio.h>

/* ---------------------------------------------------------------- */
void init(int num, My_Double * number)
{ 
	int i = 0;

	if (number == NULL)
		return;

	if (num == 0)
	{
		number->mantiss = 0;
		number->exp = 0;
		return;
	}
	number->exp = 0;
	//Якщо мантиса перевищує максимально допустиме значення,
	//зменшуємо її, одночасно збільшуючи порядок
	while (num > MANTISS_MAX)
	{
	    num = num / 2;
	    number->exp++;
	}  
	while(num % 2 == 0)			//Мантиса має бути непарним числом
	{
		num = num / 2;			//Всі степені двійки заносяться в порядок
		i++;
	}
	number->mantiss = num;
	number->exp += i;
  
}

/* ---------------------------------------------------------------- */
int dblcmp(My_Double left, My_Double right)
{
	
	if (left.mantiss > 0 && right.mantiss < 0)
		return 1;
	if (left.mantiss < 0 && right.mantiss > 0)
		return -1;
    
	reduction(&left, &right);
	if (left.mantiss == right.mantiss)
		return 0;
	else if (left.mantiss > right.mantiss)
		return 1;
	else return -1;
	
}

/* ---------------------------------------------------------------- */
void mdbcpy(My_Double * duplicate, const My_Double * pattern)
{
	if (pattern == NULL || duplicate == NULL)
		return;
	duplicate->exp = pattern->exp;
	duplicate->mantiss = pattern->mantiss;
}