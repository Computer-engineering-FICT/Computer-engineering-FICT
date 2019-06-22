/**
 * -------------------------------------------------------------------------
 *                 Паралельні та розподілені обчислення
 *                Курсова робота. ПРГ2. Бібліотека MPI
 *
 * Завдання: MA = max(MT)*ME + alpha*MD*MC
 *
 * Виконав: Редько Олександр Михайлович
 * Група: ІО-01
 * Дата: 16.04.13
 * --------------------------------------------------------------------------
 */

#include "operations.h"
#include "matrix.h"


int maxValue(
	const Matrix &MT,
	size_t start,
	size_t end)
{
	int result = INT_MIN;
	for(size_t i = start; i < end; i++) {
		for(size_t j = 0; j < MT.cols; j++) {
			int x = MT.get(i, j);
			if(x > result) {
				result = x;
			}
		}
	}
	return result;
}

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
	Matrix &MA)
{
	for(size_t i = 0; i < H; i++) {
		for(size_t j = 0; j < MA.cols; j++) {
			int sum = 0;
			for(size_t k = 0; k < MA.cols; k++) {
				sum += MD.get(i + offsMD, k) * MC.get(k, j);
			}
			sum = maxMT * ME.get(i + offsME, j) + alpha * sum;
			MA.set(i + offsMA, j, sum);
		}
	}
}