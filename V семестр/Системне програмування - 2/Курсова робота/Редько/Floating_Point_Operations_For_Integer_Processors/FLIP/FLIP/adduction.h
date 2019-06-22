#ifndef ADDUCTION_H
#define ADDUCTION_H

/**
 * @file adduction.h
 * @brief Визначена функція для вирівнювання порядків двох чисел типу <code>My_Double</code>.
 */

#include "my_double.h"

/** 
 * @brief Функція вирівнює порядки двох чисел.
 * 	Можлива втрата точності.
 * @param example вказівник на число типу <code>My_Double</code>, до порядку якого
 *	приводять. Не може бути пустим вказівником.
 * @param pattern вказівник на число типу <code>My_Double</code>,
 *	порядок якого треба зрівняти з example. Не може бути пустим вказівником.
 */
void reduction(My_Double* example,  My_Double* pattern);

#endif