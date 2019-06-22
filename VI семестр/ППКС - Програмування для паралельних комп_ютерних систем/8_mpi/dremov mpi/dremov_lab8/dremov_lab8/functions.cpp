#include "functions.h"


void calculation (
   const int alpha,
   const Matrix &MB,
   const Matrix &MK,
   const Matrix &MZ,
   size_t H,
   size_t offsMA,
   size_t offsMB,
   size_t offsMZ,
   Matrix &MA)
{
   int sum;
   for(size_t i = 0; i < H; i++) {
      for(size_t j = 0; j < MA.cols; j++) {
         sum = 0;
         for(size_t k = 0; k < MA.cols; k++) {
            sum += MZ.get(i + offsMZ, k) * MK.get(k, j);
         }
         sum = MB.get(i + offsMB, j) + alpha * sum;
         MA.set(i + offsMA, j, sum);
      }
   }
}