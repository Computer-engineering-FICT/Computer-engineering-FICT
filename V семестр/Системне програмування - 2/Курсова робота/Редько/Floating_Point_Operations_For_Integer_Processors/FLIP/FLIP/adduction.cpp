/**
 * @file adduction.cpp
 * @brief Код для @link adduction.h@endlink
 */

#include "my_double.h"
#include <stdio.h>

/* ---------------------------------------------------------------- */
void reduction(My_Double * example,  My_Double * pattern)   
{ 
	int stop = 0;

	if (example == NULL || pattern == NULL)
		return;
	
	if (example->mantiss == 0)
		example->exp = pattern->exp;

	if(example->exp == pattern->exp) 
		return;

	else

		//поки не зрівняються порядки або поки не буде переповнення або втрата точності
		while ((example->exp != pattern->exp) && !stop)  
		{
			if (example->exp > pattern->exp)
			{
				if (((example->mantiss > 0)&&(example->mantiss < MANTISS_MAX / 2)) || ((example->mantiss < 0) && (example->mantiss > -MANTISS_MAX / 2)))
				{  
					example->exp--;
					example->mantiss *= 2;
				}
				else
				{
					pattern->exp++;
					pattern->mantiss /= 2;
				}
			}
			else
			{
				if (((pattern->mantiss < MANTISS_MAX / 2) && (pattern->mantiss > 0))
					|| ((pattern->mantiss < 0) && (pattern->mantiss > -MANTISS_MAX / 2)))
				{
					pattern->exp--;
					pattern->mantiss *= 2;
				}
				else
				{
                     example->exp++;
                     example->mantiss /= 2;
				}
			}
		}
}
