/**
 * @file operations.cpp
 * @brief Код для @link operations.h@endlink
 */

#include <stdlib.h>
#include "my_double.h"
#include "adduction.h"
#include "mdb_manipule.h"
#include "mdb_string.h"

/* ---------------------------------------------------------------- */
void mantissNormalization(My_Double Result) {
	//Перевірити, чи встановлений в 0 старший біт
	while (Result.mantiss & 0x80 == 0) {
		Result.mantiss <<= 1;
		--(Result.exp);
	}
}

/* ---------------------------------------------------------------- */
void div(My_Double * A, const My_Double * B, int * h)
{
	//спроба ділення на нуль чи запису в нульовий вказівник
	if (A == 0 || B == 0 || B->mantiss == 0)
		return;
    My_Double Bcopy(*B);
  	while ((A->mantiss >= 0 && A->mantiss <= MANTISS_MAX / 2)
		|| (A->mantiss < 0 && A->mantiss <= -MANTISS_MAX / 2))
	{
		//приводимо ділене до максимально допустимої мантиси, щоб не
		//було втрати точності при діленні
		if (A->exp != -EXP_MAX)
		{
			A->exp--;
			A->mantiss *= 2;
		}
		else break;
	}


	while (A->mantiss / Bcopy.mantiss == 0)
	{
		if (Bcopy.exp != EXP_MAX && Bcopy.mantiss / 2 != 0)
		{
			Bcopy.exp++;
			Bcopy.mantiss /= 2;
		}
		else break;
	}

	//можливе переповнення зверху при відніманні
	//від'ємного числа із позитивного
	if (A->exp >= 0 && Bcopy.exp < 0)
		if (A->exp < EXP_MAX + Bcopy.exp)
		{
        	A->exp -= Bcopy.exp;
	        A->mantiss /= Bcopy.mantiss;			
		}
		else
		{
			(*h) = -1;
			return;
		}
	//можливе переповнення знизу при відніманні
	//від'ємного числа із позитивного
	else if (A->exp < 0 && Bcopy.exp >= 0)
		if (A->exp > Bcopy.exp - EXP_MAX)
		{
             A->exp -= Bcopy.exp;
			 A->mantiss /= Bcopy.mantiss;
		
		}
		else {(*h) = -1;return;}
	//при відніманні однознакових чисел переповнення малоймовірне
	else
	{
		A->exp -=Bcopy.exp;
		A->mantiss /= Bcopy.mantiss;
	}
	mantissNormalization(*A);
}	

/* ---------------------------------------------------------------- */
void mult(My_Double * A, const My_Double * B, int * h)
{
 
	if (A == 0 || B == 0)
		return;
	My_Double Bcopy(*B);
	if (Bcopy.mantiss == 0)
	{
		A->mantiss = 0;
		return;
	}

	while (abs(A->mantiss) > MANTISS_MAX / abs(Bcopy.mantiss))
	{
		if (A->exp != EXP_MAX)
		{
			A->exp++;
			A->mantiss /= 2;
		}
		else break;
	}

	if (A->exp > 0 && Bcopy.exp > 0)
	{ 
	    if (A->exp < EXP_MAX - Bcopy.exp)
		{   
			A->mantiss *= Bcopy.mantiss;
			A->exp += Bcopy.exp;
		}
		else 
		{   
			while (abs(A->mantiss) <= MANTISS_MAX / abs(Bcopy.mantiss))
			{
				A->mantiss *= 2;
				A->exp--;
			}
			if (A->exp < EXP_MAX - Bcopy.exp)
			{  
				A->exp += Bcopy.exp;
				A->mantiss *= Bcopy.mantiss;
			}
			else
			{    
				*h = -1;
				return;
			}
		}
	}
	else if (A->exp < 0 && Bcopy.exp < 0)
	{
		if (A->exp > -EXP_MAX - Bcopy.exp)
		{
			A->mantiss *= Bcopy.mantiss;
			A->exp += Bcopy.exp;
		}
		else 
		{
			while (abs(A->mantiss) / 2 != 0)
			{
				A->exp++;
				A->mantiss /= 2;
			}
			if (A->exp > -EXP_MAX - Bcopy.exp)
			{
				A->exp += Bcopy.exp;
				A->mantiss *= Bcopy.mantiss;
			}
			else
			{		
				(*h) = -1; 
				return;
			}
		}
	}
	else
	{
		A->mantiss *= Bcopy. mantiss;
		A->exp += Bcopy.exp;
	}
	mantissNormalization(*A);
}

/* ---------------------------------------------------------------- */
void add(My_Double * A, const My_Double * B, int * h)
{
	if (A == NULL || B == NULL)
		return;
  
	My_Double Bcopy(*B);

	if (A->mantiss == 0)
		A->exp = B->exp;

	int quarter = 0;
	reduction(A, &Bcopy);
	
	//в якій координатній чверті знаходиться це число
	if (A->mantiss >= 0)
	{
		if (Bcopy.mantiss >= 0)
			//1-ий квадрант A >= 0, B >= 0
	        quarter = 1;
		else
			//2-ий квадрант A >= 0, B < 0
			quarter = 2;
	}
	else
		if (Bcopy.mantiss < 0)
			//3-й квадрант A < 0, B < 0
			quarter = 3;
		else
			//4-й квадрант A < 0, B >= 0
			quarter = 4;
	
    switch (quarter)
	{
		case 1:
			//переповнення виникає через суму двох великих чисел
			if (A->mantiss < MANTISS_MAX - Bcopy.mantiss)
				A->mantiss += Bcopy.mantiss;
			else
			{   
				
				if (A->exp == EXP_MAX)
                {
					//якщо відбулось переповнення порядку
					//встановлюємо флаг і припиняємо обчислення
					*h = -1;
					return;
				}
				else
				{
					//збільшуємо порядок
					A->exp++;
					//зменшуємо мантису
				    A->mantiss /= 2;
					//зменшуємо мантису другого доданка
				    Bcopy.mantiss /= 2;
					//додаємо мантиси
				    A->mantiss += Bcopy.mantiss;
				}
			}
			break;
		case 2:
			if (A->mantiss + Bcopy.mantiss < MANTISS_MAX
				&& A->mantiss + Bcopy.mantiss > -MANTISS_MAX)
				A->mantiss += Bcopy.mantiss;
			else
			{
				if (A->exp == EXP_MAX)
				{
					//якщо відбулось переповнення порядку
					//встановлюємо флаг і припиняємо обчислення
					*h = -1;
					return;
				}
				else
				{
					A->exp++;
					A->mantiss /= 2;
					Bcopy.mantiss /= 2;
				    A->mantiss += Bcopy.mantiss;
				}		
			}
			break;
		case 3:
			//переповнення знизу
			if (A->mantiss > -MANTISS_MAX - Bcopy.mantiss)
					A->mantiss += Bcopy.mantiss;
			    else
				{
				if (A->exp != EXP_MAX)
				{ 
				   	A->exp++;
				   	A->mantiss /= 2;
				   	Bcopy.mantiss /= 2;
				   	A->mantiss += Bcopy.mantiss;
				}
				else
				{
					*h = -1;
					return;
				}
			}
			break;
		case 4:
			if (A->mantiss + Bcopy.mantiss < MANTISS_MAX 
					&& A->mantiss + Bcopy.mantiss > -MANTISS_MAX)
				A->mantiss += Bcopy.mantiss;
			else                                      
			{
               if (A->exp != EXP_MAX)
				{       
				   	A->exp++;
				   	A->mantiss /= 2;
				   	Bcopy.mantiss /= 2;
			    	A->mantiss += Bcopy.mantiss;
				}
				else 
				{
					*h = -1;
					return;
				}
			}
			break;
		default:
			return;
		mantissNormalization(*A);
	}
}

/* ---------------------------------------------------------------- */
void sub(My_Double * U, const My_Double * V, int * h)  
{    
	if (U == NULL || V == NULL)
		return;
	My_Double Vcopy(*V);
	Vcopy.mantiss *= -1;
    add(U, &Vcopy, h);
	mantissNormalization(*U);
}

/* ---------------------------------------------------------------- */
void rest (My_Double * A, const My_Double * B)
{    
	int h = 1;	
	 My_Double Acopy(*A);

	 if (A == NULL || B == NULL)
		 return;

	 //неіснує залишку від ділення на нуль
	 if (B->mantiss <= 0)
		 return;
    
	 //від'ємні числа можна тимчасово замінити позитивними
	 if (A->mantiss < 0 && B->mantiss > 0)
	 {
		 h = 0;
		 A->mantiss *= -1;
	 }
	 //поки зменшуване менше від'ємника
	 while (dblcmp(*A, *B) == 1)
	 {
		 //копіюємо зменшуване
	     mdbcpy(&Acopy, A);
	 	 sub(A, B, &h);
		 //якщо зменшуване не змінилось, значить точність занадто мала і
		 //треба запобігти нескінченному циклу
		 if (dblcmp(Acopy, *A) == 0)
			 break;
	 }
	 //якщо зменшуване зрівнялось з від'ємником, то залишок буде рівним нулю
	 if (dblcmp(*A, *B) == 0)
		 sub(A, B, &h);
	 //відновимо знак мінус
	 if (h == 0)
		 A->mantiss *= -1;
}

/* ---------------------------------------------------------------- */
int quotient(My_Double A, My_Double B)
{
	int q = 0;
	int h = 1;
	int i = 0;
	My_Double Acopy(A);

   	if (B.mantiss == 0) {
		return -1;}

	if ((A.mantiss > 0 && B.mantiss < 0) || (A.mantiss < 0 && B.mantiss > 0))
	{
		return -1;
	}
	
	while (dblcmp(A, B) == 1)                    
	{   
		mdbcpy(&Acopy, &A);		 
		sub(&A, &B, &h);                                 
		if (dblcmp(Acopy, A) == 0)                
			break;
		else q++;
	}
	if (h == -1) 
		return h;
    h = 1;
	if (dblcmp(A, B) == 0) 
	{
		sub(&A, &B, &h);
		q++;
	}
	if (h == -1)
		return h;

	return q;
}