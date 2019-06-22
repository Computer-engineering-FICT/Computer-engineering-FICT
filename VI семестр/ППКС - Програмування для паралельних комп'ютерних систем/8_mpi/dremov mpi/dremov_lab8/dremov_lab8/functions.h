#pragma once

#include "matrix.h"


// MAH = MBH + alpha*MZH*MK
void calculation(
   const int alpha,
   const Matrix &MB,
   const Matrix &MK,
   const Matrix &MZ,   
   size_t H,
   size_t offsMA,
   size_t offsMB,
   size_t offsMZ,
   Matrix &MA);