#ifndef MY_DOUBLE_H_
#define MY_DOUBLE_H_

/**
 * @file my_double.h
 * @brief Представлення числа з плаваючою точкою в пам'яті.
 */

#include <limits.h>

/**
 * @brief Структура, що представляє число з плаваючою точкою
 */
typedef struct my_Double
{
	char mantiss;	//!< мантиса
    char exp;		//!< порядок
} My_Double;

/**
 * @brief Перелік, в якому визначені максимальне значення порядку і мантиси
 */
enum {
	EXP_MAX = CHAR_MAX,		//!< найбільше значення порядку
	MANTISS_MAX = CHAR_MAX	//!< найбільше значення мантиси
};

#endif