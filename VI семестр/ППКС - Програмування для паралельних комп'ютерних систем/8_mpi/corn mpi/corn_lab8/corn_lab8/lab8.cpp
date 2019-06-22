/**
 * -------------------------------------------------------------------------
 *                 Паралельні та розподілені обчислення
 *                Лабораторна робота №8. Бібліотека MPI
 *
 * Завдання: MA = max(MO)*ME + alpha*MK*MR
 *
 * Виконав: Корнієнко Дмитро
 * Група: ІО-01
 * Дата: 06.06.13
 * --------------------------------------------------------------------------
 */

#define WORLD MPI_COMM_WORLD
#define IGNORE MPI_STATUS_IGNORE

#include <iostream>
#include <mpi.h>
#include "functions.h"

using namespace std;

const int N = 9;
const int P = 9;
int   H;

int main(int args, char* argv[]) {

   MPI_Init(&args, &argv);
   int rank;
   MPI_Comm_rank(WORLD, &rank); 
   H = N / P;

   cout << "Task " << rank+1 << " started" << endl;

   int rowsME = H, rowsMA_MO_MK = H;

   switch(rank) {
      case 0:
         rowsME = 3*H;
         break;
      case 1:
         rowsMA_MO_MK = 2*H;
         rowsME = 2*H;
         break;
      case 2:
         rowsMA_MO_MK = 3*H;
         break;
      case 3:
         rowsME = N;
         break;
      case 4:
         rowsMA_MO_MK = 2*H;
         rowsME = 2*H;
         break;
      case 5:
         rowsMA_MO_MK = N;
         break;
      case 6:
         rowsME = 3*H;
         break;
      case 7:
         rowsMA_MO_MK = 2*H;
         rowsME = 2*H;
         break;
      case 8:
         rowsMA_MO_MK = 3*H;
         break;
   }
   
   Matrix MA(rowsMA_MO_MK, N), ME(rowsME, N), MK(rowsMA_MO_MK, N), MO(rowsMA_MO_MK, N), MR(N);
   int alpha;
   int a = INT_MIN;
   int aBuf = INT_MIN;

   switch(rank) {

      case 0:
         // 1. Прийняти ME3H, MR від задачі T4
         MPI_Recv(ME.get_adress(0), 3*H*N, MPI_INT, 3, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 3, 0, WORLD, IGNORE);

         // 2. Передати ME2H, MR2H задачі T2
         MPI_Send(ME.get_adress(H*N), 2*H*N, MPI_INT, 1, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 1, 0, WORLD);

         // 3. Прийняти alpha, MKH, MOH від задачі T2
         MPI_Recv(&alpha, 1, MPI_INT, 1, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), H*N, MPI_INT, 1, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), H*N, MPI_INT, 1, 0, WORLD, IGNORE);

         // 4. Обчислення a=max(MOH)
         a = maxValue(MO, 0, H);

         // 5. Передати a задачі T2
         MPI_Send(&a, 1, MPI_INT, 1, 0, WORLD);

         // 6. Прийняти a від задачі T2
         MPI_Recv(&a, 1, MPI_INT, 1, 0, WORLD, IGNORE);

         // 7. Обчислення MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, 0, 0, MA);
         
         // 8. Передати MAH задачі T2
         MPI_Send(MA.get_adress(0), H*N, MPI_INT, 1, 0, WORLD);

         break;

      case 1:

         // 1. Прийняти ME2H, MR від задачі T1
         MPI_Recv(ME.get_adress(0), 2*H*N, MPI_INT, 0, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 0, 0, WORLD, IGNORE);

         // 2. Передати MEH, MR задачі T3
         MPI_Send(ME.get_adress(H*N), H*N, MPI_INT, 2, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 2, 0, WORLD);
         
         // 3. Прийняти alpha, MK2H, MO2H від задачі T3
         MPI_Recv(&alpha, 1, MPI_INT, 2, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), 2*H*N, MPI_INT, 2, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), 2*H*N, MPI_INT, 2, 0, WORLD, IGNORE);

         // 4. Передати alpha, MKH, MOH задачі T1
         MPI_Send(&alpha, 1, MPI_INT, 0, 0, WORLD);
         MPI_Send(MK.get_adress(0), H*N, MPI_INT, 0, 0, WORLD);
         MPI_Send(MO.get_adress(0), H*N, MPI_INT, 0, 0, WORLD);

         // 5. Обчислення a=max(MOH)
         a = maxValue(MO, H, 2*H);

         // 6. Прийняти a1 від задачі T1
         MPI_Recv(&aBuf, 1, MPI_INT, 0, 0, WORLD, IGNORE);

         // 7. Обчислення a=max(a, a1)
         if(aBuf > a) {
            a = aBuf;
         }

         // 8. Прийняти a3 від задачі T3
         MPI_Recv(&aBuf, 1, MPI_INT, 2, 0, WORLD, IGNORE);

         // 9. Обчислення a=max(a, a3)
         if(aBuf > a) {
            a = aBuf;
         }

         // 10. Передати a задачі T5
         MPI_Send(&a, 1, MPI_INT, 4, 0, WORLD);

         // 11. Прийняти a від задачі T5
         MPI_Recv(&a, 1, MPI_INT, 4, 0, WORLD, IGNORE);

         // 12. Передати a задачі T1
         MPI_Send(&a, 1, MPI_INT, 0, 0, WORLD);

         // 13. Передати a задачі T3
         MPI_Send(&a, 1, MPI_INT, 2, 0, WORLD);

         // 14. Обчислення MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, H, 0, MA);

         // 15. Прийняти MAH від задачі T1
         MPI_Recv(MA.get_adress(0), H*N, MPI_INT, 0, 0, WORLD, IGNORE);

         // 16. Передати MA2H задачі T3
         MPI_Send(MA.get_adress(0), 2*H*N, MPI_INT, 2, 0, WORLD);


         break;

      case 2:

         // 1. Прийняти alpha, MK3H, MO3H T6
         MPI_Recv(&alpha, 1, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), 3*H*N, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), 3*H*N, MPI_INT, 5, 0, WORLD, IGNORE);

         // 2. Прийняти MEH, MR від задачі T2
         MPI_Recv(ME.get_adress(0), H*N, MPI_INT, 1, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 1, 0, WORLD, IGNORE);
         
         // 3. Передати alpha, MK2H, MO2H задачі T2
         MPI_Send(&alpha, 1, MPI_INT, 1, 0, WORLD);
         MPI_Send(MK.get_adress(0), 2*H*N, MPI_INT, 1, 0, WORLD);
         MPI_Send(MO.get_adress(0), 2*H*N, MPI_INT, 1, 0, WORLD);

         // 4. Обчислення a=max(MOH)
         a = maxValue(MO, 2*H, 3*H);

         // 5. Передати a задачі T2
         MPI_Send(&a, 1, MPI_INT, 1, 0, WORLD);

         // 6. Прийняти a від задачі T2
         MPI_Recv(&a, 1, MPI_INT, 1, 0, WORLD,IGNORE);

         // 7. Обчислення MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, 2*H, 0, MA);

         // 8. Прийняти MA2H від задачі T2
         MPI_Recv(MA.get_adress(0), 2*H*N, MPI_INT, 1, 0, WORLD, IGNORE);

         // 9. Передати MA3H задачі T6
         MPI_Send(MA.get_adress(0), 3*H*N, MPI_INT, 5, 0, WORLD);

         break;

      case 3:

         // 1. Введення ME, MR
         ME.fill(1);
         MR.fill(1);
         
         // 2. Передати ME3H, MR задачі T1
         MPI_Send(ME.get_adress(0), 3*H*N, MPI_INT, 0, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 0, 0, WORLD);

         // 3. Передати ME3H, MR задачі T7
         MPI_Send(ME.get_adress(6*H*N), 3*H*N, MPI_INT, 6, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 6, 0, WORLD);

         // 4. Передати ME2H, MR задачі T5
         MPI_Send(ME.get_adress(4*H*N), 2*H*N, MPI_INT, 4, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 4, 0, WORLD);

         // 5. Прийняти alpha, MKH, MOH від задачі T5
         MPI_Recv(&alpha, 1, MPI_INT, 4, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), H*N, MPI_INT, 4, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), H*N, MPI_INT, 4, 0, WORLD, IGNORE);

         // 6. Обчислення a=max(MOH)
         a = maxValue(MO, 0, H);

         // 7. Передати a задачі T5
         MPI_Send(&a, 1, MPI_INT, 4, 0, WORLD);

         // 8. Прийняти a від задачі T5
         MPI_Recv(&a, 1, MPI_INT, 4, 0, WORLD, IGNORE);

         // 9. Обчислення MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, 0, 3*H, MA);

         // 10. Передати MAH задачі T5
         MPI_Send(MA.get_adress(0), H*N, MPI_INT, 4, 0, WORLD);

         break;

      case 4:

         // 1. Прийняти ME2H, MR від задачі T4
         MPI_Recv(ME.get_adress(0), 2*H*N, MPI_INT, 3, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 3, 0, WORLD, IGNORE);

         // 2. Передати MEH, MR задачі T6
         MPI_Send(ME.get_adress(H*N), H*N, MPI_INT, 5, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 5, 0, WORLD);

         // 3. Прийняти alpha, MK2H, MO2H від задачі T6
         MPI_Recv(&alpha, 1, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), 2*H*N, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), 2*H*N, MPI_INT, 5, 0, WORLD, IGNORE);

         // 4. Передати alpha, MKH, MOH задачі T4
         MPI_Send(&alpha, 1, MPI_INT, 3, 0, WORLD);
         MPI_Send(MK.get_adress(0), H*N, MPI_INT, 3, 0, WORLD);
         MPI_Send(MO.get_adress(0), H*N, MPI_INT, 3, 0, WORLD);

         // 5. Обчислення a=max(MOH)
         a = maxValue(MO, H, 2*H);

         // 6. Прийняти a4 від задачі T4
         MPI_Recv(&aBuf, 1, MPI_INT, 3, 0, WORLD, IGNORE);

         // 7. Обчислення a=max(a, a4)
         if(aBuf > a) {
            a = aBuf;
         }

         // 8. Прийняти a6 від задачі T6
         MPI_Recv(&aBuf, 1, MPI_INT, 5, 0, WORLD, IGNORE);

         // 9. Обчислення a=max(a, a6)
         if(aBuf > a) {
            a = aBuf;
         }

         // 10. Прийняти a2 від задачі T2
         MPI_Recv(&aBuf, 1, MPI_INT, 1, 0, WORLD, IGNORE);

         // 11. Обчислення a=max(a, a2)
         if(aBuf > a) {
            a = aBuf;
         }

         // 12. Прийняти a6 від задачі T8
         MPI_Recv(&aBuf, 1, MPI_INT, 7, 0, WORLD, IGNORE);

         // 13. Обчислення a=max(a, a8)
         if(aBuf > a) {
            a = aBuf;
         }

         // 14. Передати a задачі T2
         MPI_Send(&a, 1, MPI_INT, 1, 0, WORLD);

         // 15. Передати a задачі T8
         MPI_Send(&a, 1, MPI_INT, 7, 0, WORLD);

         // 16. Передати a задачі T4
         MPI_Send(&a, 1, MPI_INT, 3, 0, WORLD);

         // 17. Передати a задачі T6
         MPI_Send(&a, 1, MPI_INT, 5, 0, WORLD);

         // 18. Обчислення MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, H, 0, MA);

         // 19. Прийняти MAH від задачі T4
         MPI_Recv(MA.get_adress(0), H*N, MPI_INT, 3, 0, WORLD, IGNORE);

         // 20. Передати MA2H задачі T6
         MPI_Send(MA.get_adress(0), 2*H*N, MPI_INT, 5, 0, WORLD);

         break;

      case 5:

         // 1. Введення alpha, MK, MO
         alpha = 1;
         MK.fill(1);
         MO.fill(1);

         // 2. Передати alpha, MK3H, MO3H задачі T3
         MPI_Send(&alpha, 1, MPI_INT, 2, 0, WORLD);
         MPI_Send(MK.get_adress(0), 3*H*N, MPI_INT, 2, 0, WORLD);
         MPI_Send(MO.get_adress(0), 3*H*N, MPI_INT, 2, 0, WORLD);
         f
         // 3. Передати alpha, MK3H, MO3H задачі T9
         MPI_Send(&alpha, 1, MPI_INT, 8, 0, WORLD);
         MPI_Send(MK.get_adress(6*H*N), 3*H*N, MPI_INT, 8, 0, WORLD);
         MPI_Send(MO.get_adress(6*H*N), 3*H*N, MPI_INT, 8, 0, WORLD);

         // 4. Прийняти MEH, MR від задачі T5
         MPI_Recv(ME.get_adress(0), H*N, MPI_INT, 4, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 4, 0, WORLD, IGNORE);

         // 5. Передати alpha, MK2H, MO2H задачі T5
         MPI_Send(&alpha, 1, MPI_INT, 4, 0, WORLD);
         MPI_Send(MK.get_adress(3*H*N), 2*H*N, MPI_INT, 4, 0, WORLD);
         MPI_Send(MO.get_adress(3*H*N), 2*H*N, MPI_INT, 4, 0, WORLD);

         // 6. Обчислення a=max(MOH)
         a = maxValue(MO, 5*H, 6*H);

         // 7. Передати a задачі T5
         MPI_Send(&a, 1, MPI_INT, 4, 0, WORLD);

         // 8. Прийняти a від задачі T5
         MPI_Recv(&a, 1, MPI_INT, 4, 0, WORLD, IGNORE);

         // 9. Обчислення MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, 5*H, 0, MA);

         // 8. Прийняти MA2H від задачі T5
         MPI_Recv(MA.get_adress(3*H*N), 2*H*N, MPI_INT, 4, 0, WORLD, IGNORE);

         // 9. Прийняти MA3H від задачі T3
         MPI_Recv(MA.get_adress(0), 3*H*N, MPI_INT, 2, 0, WORLD, IGNORE);

         // 10. Прийняти MA3H від задачі T9
         MPI_Recv(MA.get_adress(6*H*N), 3*H*N, MPI_INT, 8, 0, WORLD, IGNORE);

         break;

      case 6:

         // 1. Прийняти ME3H, MR від задачі T4
         MPI_Recv(ME.get_adress(0), 3*H*N, MPI_INT, 3, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 3, 0, WORLD, IGNORE);

         // 2. Передати ME2H, MR задачі T8
         MPI_Send(ME.get_adress(H*N), 2*H*N, MPI_INT, 7, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 7, 0, WORLD);

         // 3. Прийняти alpha, MK, MOH від задачі T8
         MPI_Recv(&alpha, 1, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), H*N, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), H*N, MPI_INT, 7, 0, WORLD, IGNORE);

         // 4. Обчислення a=max(MOH)
         a = maxValue(MO, 0, H);

         // 5. Передати a задачі T8
         MPI_Send(&a, 1, MPI_INT, 7, 0, WORLD);

         // 6. Прийняти a від задачі T8
         MPI_Recv(&a, 1, MPI_INT, 7, 0, WORLD, IGNORE);

         // 7. Обчислення MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, 0, 0, MA);

         // 8. Передати MAH задачі T8
         MPI_Send(MA.get_adress(0), H*N, MPI_INT, 7, 0, WORLD);

         break;

      case 7:

         // 1. Прийняти ME2H, MR від задачі T7
         MPI_Recv(ME.get_adress(0), 2*H*N, MPI_INT, 6, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 6, 0, WORLD, IGNORE);

         // 2. Передати MEH, MR задачі T9
         MPI_Send(ME.get_adress(H*N), H*N, MPI_INT, 8, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 8, 0, WORLD);

         // 3. Прийняти alpha, MK2H, MO2H від задачі T9
         MPI_Recv(&alpha, 1, MPI_INT, 8, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), 2*H*N, MPI_INT, 8, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), 2*H*N, MPI_INT, 8, 0, WORLD, IGNORE);

         // 4. Передати alpha, MKH, MOH задачі T7
         MPI_Send(&alpha, 1, MPI_INT, 6, 0, WORLD);
         MPI_Send(MK.get_adress(0), H*N, MPI_INT, 6, 0, WORLD);
         MPI_Send(MO.get_adress(0), H*N, MPI_INT, 6, 0, WORLD);

         // 5. Обчислення a=max(MOH)
         a = maxValue(MO, H, 2*H);

         // 6. Прийняти a7 від задачі T7
         MPI_Recv(&aBuf, 1, MPI_INT, 6, 0, WORLD, IGNORE);

         // 7. Обчислення a=max(a, a7)
         if(aBuf > a) {
            a = aBuf;
         }

         // 8. Прийняти a9 від задачі T9
         MPI_Recv(&aBuf, 1, MPI_INT, 8, 0, WORLD, IGNORE);

         // 9. Обчислення a=max(a, a9)
         if(aBuf > a) {
            a = aBuf;
         }

         // 10. Передати a задачі T5
         MPI_Send(&a, 1, MPI_INT, 4, 0, WORLD);

         // 11. Прийняти a від задачі T5
         MPI_Recv(&a, 1, MPI_INT, 4, 0, WORLD, IGNORE);

         // 12. Передати a задачі T7
         MPI_Send(&a, 1, MPI_INT, 6, 0, WORLD);

         // 13. Передати a задачі T9
         MPI_Send(&a, 1, MPI_INT, 8, 0, WORLD);

         // 14. Обчислення MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, H, 0, MA);

         // 15. Прийняти MAH від задачі T7
         MPI_Recv(MA.get_adress(0), H*N, MPI_INT, 6, 0, WORLD, IGNORE);

         // 16. Передати MA2H задачі T9
         MPI_Send(MA.get_adress(0), 2*H*N, MPI_INT, 8, 0, WORLD);


         break;

      case 8:

         // 1. Прийняти alpha, MK3H, MO3H від задачі T6
         MPI_Recv(&alpha, 1, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), 3*H*N, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), 3*H*N, MPI_INT, 5, 0, WORLD, IGNORE);

         // 2. Прийняти MEH, MR від задачі T8
         MPI_Recv(ME.get_adress(0), H*N, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 7, 0, WORLD, IGNORE);

         // 3. Передати alpha, MK2H, MO2H задачі T8
         MPI_Send(&alpha, 1, MPI_INT, 7, 0, WORLD);
         MPI_Send(MK.get_adress(0), 2*H*N, MPI_INT, 7, 0, WORLD);
         MPI_Send(MO.get_adress(0), 2*H*N, MPI_INT, 7, 0, WORLD);

         // 4. Обчислення a=max(MOH)
         a = maxValue(MO, 2*H, 3*H);

         // 5. Передати a задачі T8
         MPI_Send(&a, 1, MPI_INT, 7, 0, WORLD);

         // 6. Прийняти a від задачі T8
         MPI_Recv(&a, 1, MPI_INT, 7, 0, WORLD, IGNORE);

         // 7. Обчислення MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, 2*H, 0, MA);

         // 8. Прийняти MA2H від задачі T8
         MPI_Recv(MA.get_adress(0), 2*H*N, MPI_INT, 7, 0, WORLD, IGNORE);

         // 9. Передати MA3H задачі T6
         MPI_Send(MA.get_adress(0), 3*H*N, MPI_INT, 5, 0, WORLD);

         break;
   }

   cout << "Task " << rank+1 << " finished" << endl;
   MPI_Finalize();

   if(rank == 5) {
      // Виведення результату
      cout << MA << endl;
      system("pause");
   }
   
   return 0;
}