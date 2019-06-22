/**
* -------------------------------------------------------------------------
*                 ��������� �� ��������� ����������
*                ����������� ������ �8. ��������� MPI
*
* ��������: MA = MB + alpha*MZ*MK
*
* �������: ������ ������
* �����: ��-01
* ����: 06.06.13
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
         // 1. �������� alpha, MB2H, MK, MZ2H �� ������ T8
         MPI_Recv(&alpha, 1, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MB.get_adress(0), 2*H*N, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), 2*H*N, MPI_INT, 7, 0, WORLD, IGNORE);

         // 2. �������� alpha, MBH, MK, MZ2H ������ T2
         MPI_Send(&alpha, 1, MPI_INT, 1, 0, WORLD);
         MPI_Send(MB.get_adress(H*N), H*N, MPI_INT, 1, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 1, 0, WORLD);
         MPI_Send(MZ.get_adress(H*N), H*N, MPI_INT, 1, 0, WORLD);

         // 3. ���������� MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 0, 0, 0, MA);

         // 4. �������� MAH ������ T9
         MPI_Send(MA.get_adress(0), H*N, MPI_INT, 8, 0, WORLD);

         break;

      case 1:

         // 1. �������� alpha, MBH, MK, MZH �� ������ T1
         MPI_Recv(&alpha, 1, MPI_INT, 0, 0, WORLD, IGNORE);
         MPI_Recv(MB.get_adress(0), H*N, MPI_INT, 0, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 0, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), H*N, MPI_INT, 0, 0, WORLD, IGNORE);

         // 2. ���������� MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 0, 0, 0, MA);

         // 3. �������� MAH ������ T3
         MPI_Send(MA.get_adress(0), H*N, MPI_INT, 2, 0, WORLD);

         break;

      case 2:

         // 1. �������� alpha, MBH, MK, MZH �� ������ T9
         MPI_Recv(&alpha, 1, MPI_INT, 8, 0, WORLD, IGNORE);
         MPI_Recv(MB.get_adress(0), H*N, MPI_INT, 8, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 8, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), H*N, MPI_INT, 8, 0, WORLD, IGNORE);

         // 2. ���������� MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, H, 0, 0, MA);

         // 3. �������� MAH �� ������ T2
         MPI_Recv(MA.get_adress(0), H*N, MPI_INT, 1, 0, WORLD, IGNORE);

         // 4. �������� MA2H ������ T4
         MPI_Send(MA.get_adress(0), 2*H*N, MPI_INT, 3, 0, WORLD);


         break;

      case 3:

         // 1. �������� alpha, MBH, MK, MZH �� ������ T5
         MPI_Recv(&alpha, 1, MPI_INT, 4, 0, WORLD, IGNORE);
         MPI_Recv(MB.get_adress(0), H*N, MPI_INT, 4, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 4, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), H*N, MPI_INT, 4, 0, WORLD, IGNORE);

         // 2. ���������� MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 2*H, 0, 0, MA);

         // 3. �������� MA2H �� ������ T3
         MPI_Recv(MA.get_adress(0), 2*H*N, MPI_INT, 2, 0, WORLD, IGNORE);

         // 4. �������� MA6H �� ������ T6
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

         // 1. �������� alpha, MB2H, MK, MZ2H �� ������ T6
         MPI_Recv(&alpha, 1, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MB.get_adress(0), 2*H*N, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), 2*H*N, MPI_INT, 5, 0, WORLD, IGNORE);

         // 2. �������� alpha, MBH, MK, MZH ������ T4
         MPI_Send(&alpha, 1, MPI_INT, 3, 0, WORLD);
         MPI_Send(MB.get_adress(0), H*N, MPI_INT, 3, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 3, 0, WORLD);
         MPI_Send(MZ.get_adress(0), H*N, MPI_INT, 3, 0, WORLD);

         // 3. ���������� MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 2*H, H, H, MA);

         // 4. �������� MA2H �� ������ T9
         MPI_Recv(MA.get_adress(0), 2*H*N, MPI_INT, 8, 0, WORLD, IGNORE);

         // 5. �������� MA3H �� ������ T6
         MPI_Recv(MA.get_adress(3*H*N), 3*H*N, MPI_INT, 5, 0, WORLD, IGNORE);

         // 6. �������� MA6H ������ T4
         MPI_Send(MA.get_adress(0), 6*H*N, MPI_INT, 3, 0, WORLD);

         break;

      case 5:

         // 1. �������� alpha, MZ
         alpha = 1;
         MZ.fill(1);

         // 2. �������� MB3H, MK �� ������ T7
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

         // 3. �������� alpha, MZ6H ������ T7
         MPI_Send(&alpha, 1, MPI_INT, 6, 0, WORLD);
         MPI_Send(MZ.get_adress(0), 6*H*N, MPI_INT, 6, 0, WORLD);

         // 4. �������� alpha, MB2H, MK, MZ2H ������ T5
         MPI_Send(&alpha, 1, MPI_INT, 4, 0, WORLD);
         MPI_Send(MB.get_adress(0), 2*H*N, MPI_INT, 4, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 4, 0, WORLD);
         MPI_Send(MZ.get_adress(6*H*N), 2*H*N, MPI_INT, 4, 0, WORLD);

         // 5. ���������� MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 0, 2*H, 8*H, MA);

         // 6. �������� MA2H �� ������ T7
         MPI_Recv(MA.get_adress(H*N), 2*H*N, MPI_INT, 6, 0, WORLD, IGNORE);

         // 7. �������� MA3H ������ T5
         MPI_Send(MA.get_adress(0), 3*H*N, MPI_INT, 4, 0, WORLD);

         break;

      case 6:

         // 1. �������� MB6H, MK �� ������ T8
         MPI_Recv(MB.get_adress(0), 6*H*N, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 7, 0, WORLD, IGNORE);

         // 2. �������� MB3H, MK ������ T6
         MPI_Send(MB.get_adress(H*N), 3*H*N, MPI_INT, 5, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 5, 0, WORLD);

         MB.copy(copy_MB);
         for (size_t i = 0; i < H; i++) {
            for (size_t j = 0; j < N; j++) {
               MB.set(i, j, copy_MB.get(i+4*H, j));
               MB.set(i+4*H, j, copy_MB.get(i, j));
            }
         }

         // 3. �������� alpha, MZ6H �� ������ T6
         MPI_Recv(&alpha, 1, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), 6*H*N, MPI_INT, 5, 0, WORLD, IGNORE);

         MZ.copy(copy_MZ);
         for (size_t i = 0; i < H; i++) {
            for (size_t j = 0; j < N; j++) {
               MZ.set(i+2*H, j, copy_MZ.get(i+4*H, j));
               MZ.set(i+4*H, j, copy_MZ.get(i+2*H, j));
            }
         }

         // 4. �������� alpha, MZ3H ������ T8
         MPI_Send(&alpha, 1, MPI_INT, 7, 0, WORLD);
         MPI_Send(MZ.get_adress(0), 3*H*N, MPI_INT, 7, 0, WORLD);

         // 5. �������� alpha, MB2H, MK, MZ2H ������ T9
         MPI_Send(&alpha, 1, MPI_INT, 8, 0, WORLD);
         MPI_Send(MB.get_adress(4*H*N), 2*H*N, MPI_INT, 8, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 8, 0, WORLD);
         MPI_Send(MZ.get_adress(4*H*N), 2*H*N, MPI_INT, 8, 0, WORLD);

         // 6. ���������� MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 0, 0, 3*H, MA);

         // 7. �������� MAH �� ������ T8
         MPI_Recv(MA.get_adress(H*N), H*N, MPI_INT, 7, 0, WORLD, IGNORE);

         // 8. �������� MA2H ������ T6
         MPI_Send(MA.get_adress(0), 2*H*N, MPI_INT, 5, 0, WORLD);


         break;

      case 7:
         // 1. �������� MB, MK
         MB.fill(1);
         MK.fill(1);


         MB.copy(copy_MB);
         for (size_t i = 0; i < H; i++) {
            for (size_t j = 0; j < N; j++) {
               MB.set(i+7*H, j, copy_MB.get(i+8*H, j));
               MB.set(i+8*H, j, copy_MB.get(i+7*H, j));
            }
         }
         
         // 2. �������� MB6H, MK ������ T7
         MPI_Send(MB.get_adress(2*H*N), 6*H*N, MPI_INT, 6, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 6, 0, WORLD);

         // 3. �������� alpha, MZ3H �� ������ T7
         MPI_Recv(&alpha, 1, MPI_INT, 6, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), 3*H*N, MPI_INT, 6, 0, WORLD, IGNORE);

         // 4. �������� alpha, MB2H, MK ������ T1
         MPI_Send(&alpha, 1, MPI_INT, 0, 0, WORLD);
         MPI_Send(MB.get_adress(0), 2*H*N, MPI_INT, 0, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 0, 0, WORLD);
         MPI_Send(MZ.get_adress(0), 2*H*N, MPI_INT, 0, 0, WORLD);

         // 5. ���������� MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, 0, 8*H, 2*H, MA);

         // 6. �������� MAH ������ T7
         MPI_Send(MA.get_adress(0), H*N, MPI_INT, 6, 0, WORLD);

         break;

      case 8:

         // 1. �������� alpha, MB2H, MK, MZ2H �� ������ T7
         MPI_Recv(&alpha, 1, MPI_INT, 6, 0, WORLD, IGNORE);
         MPI_Recv(MB.get_adress(0), 2*H*N, MPI_INT, 6, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), N*N, MPI_INT, 6, 0, WORLD, IGNORE);
         MPI_Recv(MZ.get_adress(0), 2*H*N, MPI_INT, 6, 0, WORLD, IGNORE);

         // 2. �������� alpha, MBH, MK, MZH ������ T3
         MPI_Send(&alpha, 1, MPI_INT, 2, 0, WORLD);
         MPI_Send(MB.get_adress(0), H*N, MPI_INT, 2, 0, WORLD);
         MPI_Send(MK.get_adress(0), N*N, MPI_INT, 2, 0, WORLD);
         MPI_Send(MZ.get_adress(0), H*N, MPI_INT, 2, 0, WORLD);

         // 3. ���������� MAH = MBH + alpha*MZH*MK
         calculation(alpha, MB, MK, MZ, H, H, H, H, MA);

         // 4. �������� MAH �� ������ T1
         MPI_Recv(MA.get_adress(0), H*N, MPI_INT, 0, 0, WORLD, IGNORE);

         // 5. �������� MA2H ������ T5
         MPI_Send(MA.get_adress(0), 2*H*N, MPI_INT, 4, 0, WORLD);

         break;
   }

   cout << "Task " << rank+1 << " finished" << endl;
   MPI_Finalize();

   if(rank == 3) {
      // ��������� ����������
      cout << MA << endl;
      system("pause");
   }

   return 0;
}