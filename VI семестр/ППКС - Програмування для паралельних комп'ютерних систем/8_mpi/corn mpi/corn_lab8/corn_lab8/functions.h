#pragma once

#include "matrix.h"

// Повертає max(MT)
int maxValue(
   const Matrix &MT,
   size_t start,
   size_t end);


// MAH = a*MEH + alpha*MKH*MR
void calculation(
   const int a,
   const int alpha,
   const Matrix &ME,
   const Matrix &MK,
   const Matrix &MR,   
   size_t H,
   size_t offsMA,
   size_t offsME,
   Matrix &MA);