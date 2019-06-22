#include "data.h"

void vector_matrix_multiply(const int start, const int end,
   const Vector &B, const Matrix &MO, Vector &T)
{
   int sum;
    for (int i = start; i < end; i++)
   {
      sum = 0;
      for (int j = 0; j < B.cols; j++)
      {
         sum += B.get(j) * MO.get(i, j);
         }
      T.set(i, sum);
    }
}


//AH = BH + C(MO*MXH)alpha
//AH = T(MY*MTH + alpha*MXH)
void calculation(const int start, const int end, const int alpha,
   const Vector &B, const Vector &C, const Matrix &MO, const Matrix &MX,
   Vector &A)
{
   long int sum1, sum2;

   for(int i = start; i < end; i++) {
      sum2 = 0;
      for(int j = 0; j < MO.cols; j++) {
         sum1 = 0;
         for(int k = 0; k < MO.cols; k++) {
            sum1 += MX.get(i, k) * MO.get(j, k) * alpha;
         }
         sum2 += C.get(j) * sum1;
      }
      sum2 += B.get(i);
      A.set(i, sum2);
   }
}