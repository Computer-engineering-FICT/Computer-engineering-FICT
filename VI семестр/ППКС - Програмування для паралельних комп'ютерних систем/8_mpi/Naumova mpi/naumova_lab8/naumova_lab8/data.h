#pragma once

#include "vector.h"
#include "matrix.h"

void vector_matrix_multiply(const int start, const int end,
   const Vector &B, const Matrix &MO, Vector &T);

void calculation(const int start, const int end, const int alpha,
   const Vector &B, const Vector &C, const Matrix &MO, const Matrix &MX,
   Vector &A);