/**
* -------------------------------------------------------------------------
*                 Паралельні та розподілені обчислення
*                Лабораторна робота №8. Бібліотека MPI
*
* Завдання: MA = MB + alpha*MZ*MK
*
* Виконав: Дремов Андрей
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
const int H = N / P;

int main(int args, char* argv[]) {

   MPI_Init(&args, &argv);
   int rank;
   MPI_Comm_rank(WORLD, &rank); 

   cout << "Task " << rank+1 << " started" << endl;

   int rows_MA = H, rows_MB = H, rows_MZ = H;

   switch(rank) {
   case 0:
      rows_MB = 2*H;
      rows_MZ = 2*H;
      break;
   case 1:
      break;
   case 2:
      rows_MA = 2*H;
      break;
   case 3:
      rows_MA = N;
      break;
   case 4:
      rows_MA = 6*H;
      rows_MB = 2*H;
      rows_MZ = 2*H;
      break;
   case 5:
      rows_MA = 3*H;
      rows_MB = 3*H;
      rows_MZ = N;
      break;
   case 6:
      rows_MA = 2*H;
      rows_MB = 6*H;
      rows_MZ = 6*H;
      break;
   case 7:
      rows_MB = N;
      rows_MZ = 3*H;
      break;
   case 8:
      rows_MA = 2*H;
      rows_MB = 2*H;
      rows_MZ = 2*H;
      break;
   }

   Matrix MA(rows_MA, N), MB(rows_MB, N), MK(N), MZ(rows_MZ, N);
   int alpha;
   Matrix copy_MB(MB), copy_MZ(MZ), copy_MA(MA);
   
   switch(rank) {
      case 0:
         // 1. Прийняти alpha, MB2H, MK, MZ2H від задачі T8
         MPI_Recv(&alpha, 1, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MB.get_adress(0), 2*H*N, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), 2*H*N, MPI_INT, 7, 0, WORLD, IGNORE);

         // 2. Передати alpha, MBH, MK, MZ2H задачі T2
         MPI_Send(&alpha, 1, MPI_INT, 1, 0, WORLD);
         MPI_Send(MB.get_adress(H*N), H*N, MPI_INT, 1, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 1, 0, WORLD);
         MPI_Send(MZ.get_adress(H*N), H*N, MPI_INT, 1, 0, WORLD);

         // 3. Обчислення MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 0, 0, 0, MA);

         // 4. Передати MAH задачі T9
         MPI_Send(MA.get_adress(0), H*N, MPI_INT, 8, 0, WORLD);

         break;

      case 1:

         // 1. Прийняти alpha, MBH, MK, MZH від задачі T1
         MPI_Recv(&alpha, 1, MPI_INT, 0, 0, WORLD, IGNORE);
         MPI_Recv(MB.get_adress(0), H*N, MPI_INT, 0, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 0, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), H*N, MPI_INT, 0, 0, WORLD, IGNORE);

         // 2. Обчислення MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 0, 0, 0, MA);

         // 3. Передати MAH задачі T3
         MPI_Send(MA.get_adress(0), H*N, MPI_INT, 2, 0, WORLD);

         break;

      case 2:

         // 1. Прийняти alpha, MBH, MK, MZH від задачі T9
         MPI_Recv(&alpha, 1, MPI_INT, 8, 0, WORLD, IGNORE);
         MPI_Recv(MB.get_adress(0), H*N, MPI_INT, 8, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 8, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), H*N, MPI_INT, 8, 0, WORLD, IGNORE);

         // 2. Обчислення MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, H, 0, 0, MA);

         // 3. Прийняти MAH від задачі T2
         MPI_Recv(MA.get_adress(0), H*N, MPI_INT, 1, 0, WORLD, IGNORE);

         // 4. Передати MA2H задачі T4
         MPI_Send(MA.get_adress(0), 2*H*N, MPI_INT, 3, 0, WORLD);


         break;

      case 3:

         // 1. Прийняти alpha, MBH, MK, MZH від задачі T5
         MPI_Recv(&alpha, 1, MPI_INT, 4, 0, WORLD, IGNORE);
         MPI_Recv(MB.get_adress(0), H*N, MPI_INT, 4, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 4, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), H*N, MPI_INT, 4, 0, WORLD, IGNORE);

         // 2. Обчислення MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 2*H, 0, 0, MA);

         // 3. Прийняти MA2H від задачі T3
         MPI_Recv(MA.get_adress(0), 2*H*N, MPI_INT, 2, 0, WORLD, IGNORE);

         // 4. Прийняти MA6H від задачі T6
         MPI_Recv(MA.get_adress(3*H*N), 6*H*N, MPI_INT, 4, 0, WORLD, IGNORE);

         MA.copy(copy_MA);
         for (size_t i = 0; i < H; i++) {
            for (size_t j = 0; j < N; j++) {
               MA.set(i, j, copy_MA.get(i+3*H, j));
               MA.set(i+H, j, copy_MA.get(i, j));
               MA.set(i+2*H, j, copy_MA.get(i+H, j));
               MA.set(i+3*H, j, copy_MA.get(i+2*H, j));
               MA.set(i+4*H, j, copy_MA.get(i+5*H, j));
               MA.set(i+5*H, j, copy_MA.get(i+6*H, j));
               MA.set(i+6*H, j, copy_MA.get(i+7*H, j));
               MA.set(i+7*H, j, copy_MA.get(i+8*H, j));
               MA.set(i+8*H, j, copy_MA.get(i+4*H, j));
            }
         }

         break;

      case 4:

         // 1. Прийняти alpha, MB2H, MK, MZ2H від задачі T6
         MPI_Recv(&alpha, 1, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MB.get_adress(0), 2*H*N, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), 2*H*N, MPI_INT, 5, 0, WORLD, IGNORE);

         // 2. Передати alpha, MBH, MK, MZH задачі T4
         MPI_Send(&alpha, 1, MPI_INT, 3, 0, WORLD);
         MPI_Send(MB.get_adress(0), H*N, MPI_INT, 3, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 3, 0, WORLD);
         MPI_Send(MZ.get_adress(0), H*N, MPI_INT, 3, 0, WORLD);

         // 3. Обчислення MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 2*H, H, H, MA);

         // 4. Прийняти MA2H від задачі T9
         MPI_Recv(MA.get_adress(0), 2*H*N, MPI_INT, 8, 0, WORLD, IGNORE);

         // 5. Прийняти MA3H від задачі T6
         MPI_Recv(MA.get_adress(3*H*N), 3*H*N, MPI_INT, 5, 0, WORLD, IGNORE);

         // 6. Передати MA6H задачі T4
         MPI_Send(MA.get_adress(0), 6*H*N, MPI_INT, 3, 0, WORLD);

         break;

      case 5:

         // 1. Введення alpha, MZ
         alpha = 1;
         MZ.fill(1);

         // 2. Прийняти MB3H, MK від задачі T7
         MPI_Recv(MB.get_adress(0), 3*H*N, MPI_INT, 6, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 6, 0, WORLD, IGNORE);

         MZ.copy(copy_MZ);
         for (size_t i = 0; i < H; i++) {
            for (size_t j = 0; j < N; j++) {
               for (size_t k = 3; k < 6; k++) {
                  MZ.set(i+k*H, j, copy_MZ.get(i+(k+3)*H, j));
                  MZ.set(i+(k+3)*H, j, copy_MZ.get(i+k*H, j));
               }
            }
         }

         // 3. Передати alpha, MZ6H задачі T7
         MPI_Send(&alpha, 1, MPI_INT, 6, 0, WORLD);
         MPI_Send(MZ.get_adress(0), 6*H*N, MPI_INT, 6, 0, WORLD);

         // 4. Передати alpha, MB2H, MK, MZ2H задачі T5
         MPI_Send(&alpha, 1, MPI_INT, 4, 0, WORLD);
         MPI_Send(MB.get_adress(0), 2*H*N, MPI_INT, 4, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 4, 0, WORLD);
         MPI_Send(MZ.get_adress(6*H*N), 2*H*N, MPI_INT, 4, 0, WORLD);

         // 5. Обчислення MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 0, 2*H, 8*H, MA);

         // 6. Прийняти MA2H від задачі T7
         MPI_Recv(MA.get_adress(H*N), 2*H*N, MPI_INT, 6, 0, WORLD, IGNORE);

         // 7. Передати MA3H задачі T5
         MPI_Send(MA.get_adress(0), 3*H*N, MPI_INT, 4, 0, WORLD);

         break;

      case 6:

         // 1. Прийняти MB6H, MK від задачі T8
         MPI_Recv(MB.get_adress(0), 6*H*N, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 7, 0, WORLD, IGNORE);

         // 2. Передати MB3H, MK задачі T6
         MPI_Send(MB.get_adress(H*N), 3*H*N, MPI_INT, 5, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 5, 0, WORLD);

         MB.copy(copy_MB);
         for (size_t i = 0; i < H; i++) {
            for (size_t j = 0; j < N; j++) {
               MB.set(i, j, copy_MB.get(i+4*H, j));
               MB.set(i+4*H, j, copy_MB.get(i, j));
            }
         }

         // 3. Прийняти alpha, MZ6H від задачі T6
         MPI_Recv(&alpha, 1, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), 6*H*N, MPI_INT, 5, 0, WORLD, IGNORE);

         MZ.copy(copy_MZ);
         for (size_t i = 0; i < H; i++) {
            for (size_t j = 0; j < N; j++) {
               MZ.set(i+2*H, j, copy_MZ.get(i+4*H, j));
               MZ.set(i+4*H, j, copy_MZ.get(i+2*H, j));
            }
         }

         // 4. Передати alpha, MZ3H задачі T8
         MPI_Send(&alpha, 1, MPI_INT, 7, 0, WORLD);
         MPI_Send(MZ.get_adress(0), 3*H*N, MPI_INT, 7, 0, WORLD);

         // 5. Передати alpha, MB2H, MK, MZ2H задачі T9
         MPI_Send(&alpha, 1, MPI_INT, 8, 0, WORLD);
         MPI_Send(MB.get_adress(4*H*N), 2*H*N, MPI_INT, 8, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 8, 0, WORLD);
         MPI_Send(MZ.get_adress(4*H*N), 2*H*N, MPI_INT, 8, 0, WORLD);

         // 6. Обчислення MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 0, 0, 3*H, MA);

         // 7. Прийняти MAH від задачі T8
         MPI_Recv(MA.get_adress(H*N), H*N, MPI_INT, 7, 0, WORLD, IGNORE);

         // 8. Передати MA2H задачі T6
         MPI_Send(MA.get_adress(0), 2*H*N, MPI_INT, 5, 0, WORLD);


         break;

      case 7:
         // 1. Введення MB, MK
         MB.fill(1);
         MK.fill(1);


         MB.copy(copy_MB);
         for (size_t i = 0; i < H; i++) {
            for (size_t j = 0; j < N; j++) {
               MB.set(i+7*H, j, copy_MB.get(i+8*H, j));
               MB.set(i+8*H, j, copy_MB.get(i+7*H, j));
            }
         }
         
         // 2. Передати MB6H, MK задачі T7
         MPI_Send(MB.get_adress(2*H*N), 6*H*N, MPI_INT, 6, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 6, 0, WORLD);

         // 3. Прийняти alpha, MZ3H від задачі T7
         MPI_Recv(&alpha, 1, MPI_INT, 6, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), 3*H*N, MPI_INT, 6, 0, WORLD, IGNORE);

         // 4. Передати alpha, MB2H, MK задачі T1
         MPI_Send(&alpha, 1, MPI_INT, 0, 0, WORLD);
         MPI_Send(MB.get_adress(0), 2*H*N, MPI_INT, 0, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 0, 0, WORLD);
         MPI_Send(MZ.get_adress(0), 2*H*N, MPI_INT, 0, 0, WORLD);

         // 5. Обчислення MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 0, 8*H, 2*H, MA);

         // 6. Передати MAH задачі T7
         MPI_Send(MA.get_adress(0), H*N, MPI_INT, 6, 0, WORLD);

         break;

      case 8:

         // 1. Прийняти alpha, MB2H, MK, MZ2H від задачі T7
         MPI_Recv(&alpha, 1, MPI_INT, 6, 0, WORLD, IGNORE);
         MPI_Recv(MB.get_adress(0), 2*H*N, MPI_INT, 6, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 6, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), 2*H*N, MPI_INT, 6, 0, WORLD, IGNORE);

         // 2. Передати alpha, MBH, MK, MZH задачі T3
         MPI_Send(&alpha, 1, MPI_INT, 2, 0, WORLD);
         MPI_Send(MB.get_adress(0), H*N, MPI_INT, 2, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 2, 0, WORLD);
         MPI_Send(MZ.get_adress(0), H*N, MPI_INT, 2, 0, WORLD);

         // 3. Обчислення MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, H, H, H, MA);

         // 4. Прийняти MAH від задачі T1
         MPI_Recv(MA.get_adress(0), H*N, MPI_INT, 0, 0, WORLD, IGNORE);

         // 5. Передати MA2H задачі T5
         MPI_Send(MA.get_adress(0), 2*H*N, MPI_INT, 4, 0, WORLD);

         break;
   }

   cout << "Task " << rank+1 << " finished" << endl;
   MPI_Finalize();

   if(rank == 3) {
      // Виведення результату
      cout << MA << endl;
      system("pause");
   }

   return 0;
}