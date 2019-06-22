#ifndef MDB_MANIPULE_H	
#define MDB_MANIPULE_H

/**
 * @file mdb_manipule.h
 * @brief Основні маніпуляції з числом типу <code>My_Double</code>.
 */

#include "my_double.h"


/**
 * @brief Функція ініалізує змінну <code>number</code> цілим числом <code>num</code>.
 *	Можлива втрата точності.
 * @param num ціле число.
 * @param number змінна типу <code>My_Double</code>. Не може бути пустим вказівником.
 */
void init(int num, My_Double * number);


/** 
 * @brief Функція порівнює дві змінних типу <code>My_Double</code>.
 * @param left змінна типу <code>My_Double</code>.
 * @param right змінна типу <code>My_Double</code>.
 * @return 0, якщо числа рівні.
 * @return 1, якщо <code>left</code> більше <code>right</code>.
 * @return -1, якщо <code>left</code> менше <code>right</code>.
 */
int dblcmp(My_Double left, My_Double right);

/**
 * @brief Функція копіює вміст вказівника <code>pattern</code> в <code>duplicate</code>.
 * @param duplicate вказівник на <code>My_Double</code>. Не може бути пустим вказівником.
 * @param pattern вказівник на <code>My_Double</code>. Не може бути пустим вказівником.
 */
void mdbcpy(My_Double * duplicate, const My_Double * pattern);

#endif