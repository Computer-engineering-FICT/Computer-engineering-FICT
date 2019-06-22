#include "functions.h"

int maxValue(
   const Matrix &MO,
   size_t start,
   size_t end)
{
   int result = INT_MIN;
   for(size_t i = start; i < end; i++) {
      for(size_t j = 0; j < MO.cols; j++) {
         int x = MO.get(i, j);
         if(x > result) {
            result = x;
         }
      }
   }
   return result;
}

void calculation(
   const int a,
   const int alpha,
   const Matrix &ME,
   const Matrix &MK,
   const Matrix &MR,
   size_t H,
   size_t offsMA,
   size_t offsME,
   Matrix &MA)
{
   int sum;
   for(size_t i = 0; i < H; i++) {
      for(size_t j = 0; j < MA.cols; j++) {
         sum = 0;
         for(size_t k = 0; k < MA.cols; k++) {
            sum += MK.get(i + offsMA, k) * MR.get(k, j);
         }
         sum = a * ME.get(i + offsME, j) + alpha * sum;
         MA.set(i + offsMA, j, sum);
      }
   }
}