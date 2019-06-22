/**
 * @file mdb_string.cpp
 * @brief Код для @link mdb_string.h@endlink
 */

#include "my_double.h"
#include "adduction.h"
#include "operations.h"
#include "mdb_manipule.h"
#include <stdlib.h>


/* ---------------------------------------------------------------- */
int dblasc2(My_Double example, char * str, int size, int Radix)
{
	//банк символів
    char  bank[] = {'0', '1', '2', '3', '4', '5', '6', '7', 
		            '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
	//максимально можлива основа числення
	const int MAX_NUMERATION = sizeof(bank);
	//кількість цифр після коми
    const int MAX_FIDELITY = 3;
    int i, j = 0,  h = 1, length = 0, sign = 1;
    My_Double T, T1, D, Copy(example);

	//не можна писати у NULL вказівник або система числення не від 2 до 16
	if (str == 0 || Radix < 2 || Radix > MAX_NUMERATION)
		return -1;

    init(1, &D);
    init(1, &T);
	init(Radix, &T1);

	//зводимо роботу з від'ємними числами до роботи з додатніми
	if (example.mantiss < 0)
	{
		sign = 0;
		example.mantiss *= -1;
		Copy.mantiss *= -1;
	}

	//підрахунок кількості розрядів в числі example (Copy)
    while (dblcmp(Copy, D) == 1)
	{
      div(&Copy, &T1, &h);
	  length++;
	}
      
	if (dblcmp(Copy, D) == 0)
		length++;

	//якщо в заданий розмір рядка число не поміщається, то запис не відбудеться
  	if (length + 1 + MAX_FIDELITY > size)
		return 0;

	i = 0;
	//отримання основи максимального розряду нашого числа
	while (i < length - 1)
	{
        mult(&T, &T1, &h);
		i++;
	}  

  	while (i >= 0)
	{
		//обчислюємо цифру поточного розряду
		h = quotient(example, T);
		//опускаємось на розряд нижче
		rest(&example, &T);
		//якщо символ цифри міститься в банку символів
		if (h >= 0 && h < MAX_NUMERATION)
		{
			//записуємо його в рядок
			str[j] = bank[h];
			//готуємось записувати наступний символ
			j++;
		}
		//зменшуємо основу, оскільки перешли до нового розряду
		div(&T, &T1, &h);
		i--;
	}
	
	//ціла частина закінчилась
	str[j] = '.';
	j++;

	//працюємо з дробовою частиною
	while (i > -MAX_FIDELITY-1)
	{      
	  h = quotient(example, T);
	  rest(&example, &T);
	  if (h >= 0 && h < MAX_NUMERATION)
	  {
		  str[j] = bank[h];
		  j++;	
	  }	  
	  div(&T, &T1, &h);	  
	  i--;
	}
	//все, запис закінчився
	str[j] = '\0';
	
	//в залежності від того, чи було число example від'ємним
	//перезаписуємо рядок зі знаком мінус
	if (sign == 0)
	{
		for (i = length + MAX_FIDELITY + 1; i > 0; i--)
			str[i] = str[i-1];
		str[0] = '-';
		str[length + MAX_FIDELITY + 2] = '\0';
	}
	return length + (1 - sign) + 1 + MAX_FIDELITY;
}

/* ---------------------------------------------------------------- */
int member(char * bank, char symbol, int Radix)
{   
	int i, sign = 0;
	if (bank == NULL || Radix < 0)
		return -1;
	for (i = 0; i < Radix; i++)
		if (*(bank + i) == symbol)
			sign = 1;
	return sign;
}

/* ---------------------------------------------------------------- */
int pos(char * bank, char symbol, int size)
{   
	int i, position = -1;
	if (bank == NULL || size < 0)
		return -2;

	for (i = 0; i < size; i++)
		if (*(bank + i) == symbol)
			position = i;
	return position;
}

/* ---------------------------------------------------------------- */
int asc2dbl(My_Double * pDbl, const char * str, int Radix)
{  
	char bank[] = {'0', '1', '2', '3', '4', '5', '6', '7',
					'8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};  
	int length = 0, i = 0, minus = 0, point = 0, before_point = 0, after_point = 0;
	int  sign = 0, c, j;
	int h = 1;
	My_Double T, D, T1, T2;
	//якщо неправильні параметри
	if (pDbl == 0 || str == 0 || Radix < 2 || Radix > 16)
		return -3;
  
	while (*(str + length) != '\0')
	{   
		//якщо знак мінус розташований не там
		if (str[length] == '-' && length != 0)
			return -2;
		//якщо символи не ті або їх занадто багато
		if (!member(bank, str[length], Radix) && str[length] != '.'
			&& str[length] != '-' || point >= 2 || minus >= 2 || str[0] == '.')
			return -2;
		//підрахунок кількості десяткових крапок
		if (str[length] == '.')
			point++;
		//підрахунок кількості мінусів
		if (str[length] == '-')
			minus++;
			length++;	  
	}
	//якщо більше однієї точки
	if (point >= 2)
		return -2;

	//підрахунок кількості цифр до і після коми
	while (before_point < length)
	{
		if (*(str + before_point) == '.')
			break;	   
		before_point++;
	}
	//якщо в запис входить крапка або навпаки не входить,
	//формули для обчислення різні
	if (point)												
		after_point = length - before_point - 1;
	else
		after_point = length - before_point;
	//не рахуємо "-" за розряд
	if (*str == '-')
   		before_point--;	
  
	init(0, pDbl);
	init(1, &D);
	//Т - основа поточного розряду (1 або 10 або 100 і т.д.)
	init(1, &T);
	//Т2 - записуємо сюди одиниці поточного розряду (від 0 до 9)
	init(1, &T2);
	//Т1 - основа системи числення
	init(Radix, &T1);

	//якщо перший символ в рядку не '-', рахуємо розряди з нього
	if (*str != '-')
		i = 0;
	else
	{ 
		i = 1;
		sign = 1;
	}
	//підрахуємо основу максимального розряду (одиниці, десятки, сотні тисяч, ...)
	for (j = 0; j < before_point - i - 1 + sign; j++)
  		mult(&T, &T1, &h);

	//поки не дійдемо до кінця рядку
	while (*(str + i) != '\0')
	{
		//якщо символ не є крапкою
	    if (*(str + i) != '.')
		{    
			//копіюємо основу поточного розряду
			mdbcpy(&D, &T);
			//обчислюємо одиниці поточного розряду
			c = pos(bank, *(str + i), sizeof(bank));
			//представляємо одиниці поточного розряду в типі My_Double
			init(c, &T2);
			//перемножаємо одиниці на основу поточного розряду 
			//(вийде, наприклад, 3000 або 2*9^4)
			mult(&D, &T2, &h);
			//добавляємо отриманий розряд в тип My_Double
			add(pDbl, &D, &h);

			//якщо переповнення, то переходимо до наступного розряду
			if (h == -1)
				return h;
 			div(&T, &T1, &h);
		}
		i++;
	}
	//в залежності від знаку, перемножаємо отримане число на -1
	if (sign)
		pDbl->mantiss *= -1;
  
	//кількість використаних символів
	return length;
}