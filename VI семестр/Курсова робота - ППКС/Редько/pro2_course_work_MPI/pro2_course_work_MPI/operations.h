/**
 * -------------------------------------------------------------------------
 *                 Паралельні та розподілені обчислення
 *                Курсова робота. ПРГ1. Бібліотека Win32
 *
 * Завдання: MA = max(MT)*ME + alpha*MD*MC
 *
 * Виконав: Редько Олександр Михайлович
 * Група: ІО-01
 * Дата: 04.04.13
 * --------------------------------------------------------------------------
 */

#ifndef _OPERATIONS_H_
#define _OPERATIONS_H_ 1

#include "matrix.h"


int maxValue(
	const Matrix &MT,
	size_t start,
	size_t end);

void calculation(
	const int maxMT,
	const int alpha,
	const Matrix &MC,
	const Matrix &MD,
	const Matrix &ME,	
	size_t H,
	size_t offsMA,
	size_t offsMD,
	size_t offsME,
	Matrix &MA);


#endif