/**
 * -------------------------------------------------------------------------
 *                 ��������� �� ��������� ����������
 *                ����������� ������ �8. ��������� MPI
 *
 * ��������: MA = max(MO)*ME + alpha*MK*MR
 *
 * �������: ������� ������
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
         // 1. �������� ME3H, MR �� ������ T4
         MPI_Recv(ME.get_adress(0), 3*H*N, MPI_INT, 3, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 3, 0, WORLD, IGNORE);

         // 2. �������� ME2H, MR2H ������ T2
         MPI_Send(ME.get_adress(H*N), 2*H*N, MPI_INT, 1, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 1, 0, WORLD);

         // 3. �������� alpha, MKH, MOH �� ������ T2
         MPI_Recv(&alpha, 1, MPI_INT, 1, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), H*N, MPI_INT, 1, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), H*N, MPI_INT, 1, 0, WORLD, IGNORE);

         // 4. ���������� a=max(MOH)
         a = maxValue(MO, 0, H);

         // 5. �������� a ������ T2
         MPI_Send(&a, 1, MPI_INT, 1, 0, WORLD);

         // 6. �������� a �� ������ T2
         MPI_Recv(&a, 1, MPI_INT, 1, 0, WORLD, IGNORE);

         // 7. ���������� MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, 0, 0, MA);
         
         // 8. �������� MAH ������ T2
         MPI_Send(MA.get_adress(0), H*N, MPI_INT, 1, 0, WORLD);

         break;

      case 1:

         // 1. �������� ME2H, MR �� ������ T1
         MPI_Recv(ME.get_adress(0), 2*H*N, MPI_INT, 0, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 0, 0, WORLD, IGNORE);

         // 2. �������� MEH, MR ������ T3
         MPI_Send(ME.get_adress(H*N), H*N, MPI_INT, 2, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 2, 0, WORLD);
         
         // 3. �������� alpha, MK2H, MO2H �� ������ T3
         MPI_Recv(&alpha, 1, MPI_INT, 2, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), 2*H*N, MPI_INT, 2, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), 2*H*N, MPI_INT, 2, 0, WORLD, IGNORE);

         // 4. �������� alpha, MKH, MOH ������ T1
         MPI_Send(&alpha, 1, MPI_INT, 0, 0, WORLD);
         MPI_Send(MK.get_adress(0), H*N, MPI_INT, 0, 0, WORLD);
         MPI_Send(MO.get_adress(0), H*N, MPI_INT, 0, 0, WORLD);

         // 5. ���������� a=max(MOH)
         a = maxValue(MO, H, 2*H);

         // 6. �������� a1 �� ������ T1
         MPI_Recv(&aBuf, 1, MPI_INT, 0, 0, WORLD, IGNORE);

         // 7. ���������� a=max(a, a1)
         if(aBuf > a) {
            a = aBuf;
         }

         // 8. �������� a3 �� ������ T3
         MPI_Recv(&aBuf, 1, MPI_INT, 2, 0, WORLD, IGNORE);

         // 9. ���������� a=max(a, a3)
         if(aBuf > a) {
            a = aBuf;
         }

         // 10. �������� a ������ T5
         MPI_Send(&a, 1, MPI_INT, 4, 0, WORLD);

         // 11. �������� a �� ������ T5
         MPI_Recv(&a, 1, MPI_INT, 4, 0, WORLD, IGNORE);

         // 12. �������� a ������ T1
         MPI_Send(&a, 1, MPI_INT, 0, 0, WORLD);

         // 13. �������� a ������ T3
         MPI_Send(&a, 1, MPI_INT, 2, 0, WORLD);

         // 14. ���������� MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, H, 0, MA);

         // 15. �������� MAH �� ������ T1
         MPI_Recv(MA.get_adress(0), H*N, MPI_INT, 0, 0, WORLD, IGNORE);

         // 16. �������� MA2H ������ T3
         MPI_Send(MA.get_adress(0), 2*H*N, MPI_INT, 2, 0, WORLD);


         break;

      case 2:

         // 1. �������� alpha, MK3H, MO3H T6
         MPI_Recv(&alpha, 1, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), 3*H*N, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), 3*H*N, MPI_INT, 5, 0, WORLD, IGNORE);

         // 2. �������� MEH, MR �� ������ T2
         MPI_Recv(ME.get_adress(0), H*N, MPI_INT, 1, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 1, 0, WORLD, IGNORE);
         
         // 3. �������� alpha, MK2H, MO2H ������ T2
         MPI_Send(&alpha, 1, MPI_INT, 1, 0, WORLD);
         MPI_Send(MK.get_adress(0), 2*H*N, MPI_INT, 1, 0, WORLD);
         MPI_Send(MO.get_adress(0), 2*H*N, MPI_INT, 1, 0, WORLD);

         // 4. ���������� a=max(MOH)
         a = maxValue(MO, 2*H, 3*H);

         // 5. �������� a ������ T2
         MPI_Send(&a, 1, MPI_INT, 1, 0, WORLD);

         // 6. �������� a �� ������ T2
         MPI_Recv(&a, 1, MPI_INT, 1, 0, WORLD,IGNORE);

         // 7. ���������� MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, 2*H, 0, MA);

         // 8. �������� MA2H �� ������ T2
         MPI_Recv(MA.get_adress(0), 2*H*N, MPI_INT, 1, 0, WORLD, IGNORE);

         // 9. �������� MA3H ������ T6
         MPI_Send(MA.get_adress(0), 3*H*N, MPI_INT, 5, 0, WORLD);

         break;

      case 3:

         // 1. �������� ME, MR
         ME.fill(1);
         MR.fill(1);
         
         // 2. �������� ME3H, MR ������ T1
         MPI_Send(ME.get_adress(0), 3*H*N, MPI_INT, 0, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 0, 0, WORLD);

         // 3. �������� ME3H, MR ������ T7
         MPI_Send(ME.get_adress(6*H*N), 3*H*N, MPI_INT, 6, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 6, 0, WORLD);

         // 4. �������� ME2H, MR ������ T5
         MPI_Send(ME.get_adress(4*H*N), 2*H*N, MPI_INT, 4, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 4, 0, WORLD);

         // 5. �������� alpha, MKH, MOH �� ������ T5
         MPI_Recv(&alpha, 1, MPI_INT, 4, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), H*N, MPI_INT, 4, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), H*N, MPI_INT, 4, 0, WORLD, IGNORE);

         // 6. ���������� a=max(MOH)
         a = maxValue(MO, 0, H);

         // 7. �������� a ������ T5
         MPI_Send(&a, 1, MPI_INT, 4, 0, WORLD);

         // 8. �������� a �� ������ T5
         MPI_Recv(&a, 1, MPI_INT, 4, 0, WORLD, IGNORE);

         // 9. ���������� MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, 0, 3*H, MA);

         // 10. �������� MAH ������ T5
         MPI_Send(MA.get_adress(0), H*N, MPI_INT, 4, 0, WORLD);

         break;

      case 4:

         // 1. �������� ME2H, MR �� ������ T4
         MPI_Recv(ME.get_adress(0), 2*H*N, MPI_INT, 3, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 3, 0, WORLD, IGNORE);

         // 2. �������� MEH, MR ������ T6
         MPI_Send(ME.get_adress(H*N), H*N, MPI_INT, 5, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 5, 0, WORLD);

         // 3. �������� alpha, MK2H, MO2H �� ������ T6
         MPI_Recv(&alpha, 1, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), 2*H*N, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), 2*H*N, MPI_INT, 5, 0, WORLD, IGNORE);

         // 4. �������� alpha, MKH, MOH ������ T4
         MPI_Send(&alpha, 1, MPI_INT, 3, 0, WORLD);
         MPI_Send(MK.get_adress(0), H*N, MPI_INT, 3, 0, WORLD);
         MPI_Send(MO.get_adress(0), H*N, MPI_INT, 3, 0, WORLD);

         // 5. ���������� a=max(MOH)
         a = maxValue(MO, H, 2*H);

         // 6. �������� a4 �� ������ T4
         MPI_Recv(&aBuf, 1, MPI_INT, 3, 0, WORLD, IGNORE);

         // 7. ���������� a=max(a, a4)
         if(aBuf > a) {
            a = aBuf;
         }

         // 8. �������� a6 �� ������ T6
         MPI_Recv(&aBuf, 1, MPI_INT, 5, 0, WORLD, IGNORE);

         // 9. ���������� a=max(a, a6)
         if(aBuf > a) {
            a = aBuf;
         }

         // 10. �������� a2 �� ������ T2
         MPI_Recv(&aBuf, 1, MPI_INT, 1, 0, WORLD, IGNORE);

         // 11. ���������� a=max(a, a2)
         if(aBuf > a) {
            a = aBuf;
         }

         // 12. �������� a6 �� ������ T8
         MPI_Recv(&aBuf, 1, MPI_INT, 7, 0, WORLD, IGNORE);

         // 13. ���������� a=max(a, a8)
         if(aBuf > a) {
            a = aBuf;
         }

         // 14. �������� a ������ T2
         MPI_Send(&a, 1, MPI_INT, 1, 0, WORLD);

         // 15. �������� a ������ T8
         MPI_Send(&a, 1, MPI_INT, 7, 0, WORLD);

         // 16. �������� a ������ T4
         MPI_Send(&a, 1, MPI_INT, 3, 0, WORLD);

         // 17. �������� a ������ T6
         MPI_Send(&a, 1, MPI_INT, 5, 0, WORLD);

         // 18. ���������� MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, H, 0, MA);

         // 19. �������� MAH �� ������ T4
         MPI_Recv(MA.get_adress(0), H*N, MPI_INT, 3, 0, WORLD, IGNORE);

         // 20. �������� MA2H ������ T6
         MPI_Send(MA.get_adress(0), 2*H*N, MPI_INT, 5, 0, WORLD);

         break;

      case 5:

         // 1. �������� alpha, MK, MO
         alpha = 1;
         MK.fill(1);
         MO.fill(1);

         // 2. �������� alpha, MK3H, MO3H ������ T3
         MPI_Send(&alpha, 1, MPI_INT, 2, 0, WORLD);
         MPI_Send(MK.get_adress(0), 3*H*N, MPI_INT, 2, 0, WORLD);
         MPI_Send(MO.get_adress(0), 3*H*N, MPI_INT, 2, 0, WORLD);
         f
         // 3. �������� alpha, MK3H, MO3H ������ T9
         MPI_Send(&alpha, 1, MPI_INT, 8, 0, WORLD);
         MPI_Send(MK.get_adress(6*H*N), 3*H*N, MPI_INT, 8, 0, WORLD);
         MPI_Send(MO.get_adress(6*H*N), 3*H*N, MPI_INT, 8, 0, WORLD);

         // 4. �������� MEH, MR �� ������ T5
         MPI_Recv(ME.get_adress(0), H*N, MPI_INT, 4, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 4, 0, WORLD, IGNORE);

         // 5. �������� alpha, MK2H, MO2H ������ T5
         MPI_Send(&alpha, 1, MPI_INT, 4, 0, WORLD);
         MPI_Send(MK.get_adress(3*H*N), 2*H*N, MPI_INT, 4, 0, WORLD);
         MPI_Send(MO.get_adress(3*H*N), 2*H*N, MPI_INT, 4, 0, WORLD);

         // 6. ���������� a=max(MOH)
         a = maxValue(MO, 5*H, 6*H);

         // 7. �������� a ������ T5
         MPI_Send(&a, 1, MPI_INT, 4, 0, WORLD);

         // 8. �������� a �� ������ T5
         MPI_Recv(&a, 1, MPI_INT, 4, 0, WORLD, IGNORE);

         // 9. ���������� MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, 5*H, 0, MA);

         // 8. �������� MA2H �� ������ T5
         MPI_Recv(MA.get_adress(3*H*N), 2*H*N, MPI_INT, 4, 0, WORLD, IGNORE);

         // 9. �������� MA3H �� ������ T3
         MPI_Recv(MA.get_adress(0), 3*H*N, MPI_INT, 2, 0, WORLD, IGNORE);

         // 10. �������� MA3H �� ������ T9
         MPI_Recv(MA.get_adress(6*H*N), 3*H*N, MPI_INT, 8, 0, WORLD, IGNORE);

         break;

      case 6:

         // 1. �������� ME3H, MR �� ������ T4
         MPI_Recv(ME.get_adress(0), 3*H*N, MPI_INT, 3, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 3, 0, WORLD, IGNORE);

         // 2. �������� ME2H, MR ������ T8
         MPI_Send(ME.get_adress(H*N), 2*H*N, MPI_INT, 7, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 7, 0, WORLD);

         // 3. �������� alpha, MK, MOH �� ������ T8
         MPI_Recv(&alpha, 1, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), H*N, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), H*N, MPI_INT, 7, 0, WORLD, IGNORE);

         // 4. ���������� a=max(MOH)
         a = maxValue(MO, 0, H);

         // 5. �������� a ������ T8
         MPI_Send(&a, 1, MPI_INT, 7, 0, WORLD);

         // 6. �������� a �� ������ T8
         MPI_Recv(&a, 1, MPI_INT, 7, 0, WORLD, IGNORE);

         // 7. ���������� MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, 0, 0, MA);

         // 8. �������� MAH ������ T8
         MPI_Send(MA.get_adress(0), H*N, MPI_INT, 7, 0, WORLD);

         break;

      case 7:

         // 1. �������� ME2H, MR �� ������ T7
         MPI_Recv(ME.get_adress(0), 2*H*N, MPI_INT, 6, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 6, 0, WORLD, IGNORE);

         // 2. �������� MEH, MR ������ T9
         MPI_Send(ME.get_adress(H*N), H*N, MPI_INT, 8, 0, WORLD);
         MPI_Send(MR.get_adress(0), N*N, MPI_INT, 8, 0, WORLD);

         // 3. �������� alpha, MK2H, MO2H �� ������ T9
         MPI_Recv(&alpha, 1, MPI_INT, 8, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), 2*H*N, MPI_INT, 8, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), 2*H*N, MPI_INT, 8, 0, WORLD, IGNORE);

         // 4. �������� alpha, MKH, MOH ������ T7
         MPI_Send(&alpha, 1, MPI_INT, 6, 0, WORLD);
         MPI_Send(MK.get_adress(0), H*N, MPI_INT, 6, 0, WORLD);
         MPI_Send(MO.get_adress(0), H*N, MPI_INT, 6, 0, WORLD);

         // 5. ���������� a=max(MOH)
         a = maxValue(MO, H, 2*H);

         // 6. �������� a7 �� ������ T7
         MPI_Recv(&aBuf, 1, MPI_INT, 6, 0, WORLD, IGNORE);

         // 7. ���������� a=max(a, a7)
         if(aBuf > a) {
            a = aBuf;
         }

         // 8. �������� a9 �� ������ T9
         MPI_Recv(&aBuf, 1, MPI_INT, 8, 0, WORLD, IGNORE);

         // 9. ���������� a=max(a, a9)
         if(aBuf > a) {
            a = aBuf;
         }

         // 10. �������� a ������ T5
         MPI_Send(&a, 1, MPI_INT, 4, 0, WORLD);

         // 11. �������� a �� ������ T5
         MPI_Recv(&a, 1, MPI_INT, 4, 0, WORLD, IGNORE);

         // 12. �������� a ������ T7
         MPI_Send(&a, 1, MPI_INT, 6, 0, WORLD);

         // 13. �������� a ������ T9
         MPI_Send(&a, 1, MPI_INT, 8, 0, WORLD);

         // 14. ���������� MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, H, 0, MA);

         // 15. �������� MAH �� ������ T7
         MPI_Recv(MA.get_adress(0), H*N, MPI_INT, 6, 0, WORLD, IGNORE);

         // 16. �������� MA2H ������ T9
         MPI_Send(MA.get_adress(0), 2*H*N, MPI_INT, 8, 0, WORLD);


         break;

      case 8:

         // 1. �������� alpha, MK3H, MO3H �� ������ T6
         MPI_Recv(&alpha, 1, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MK.get_adress(0), 3*H*N, MPI_INT, 5, 0, WORLD, IGNORE);
         MPI_Recv(MO.get_adress(0), 3*H*N, MPI_INT, 5, 0, WORLD, IGNORE);

         // 2. �������� MEH, MR �� ������ T8
         MPI_Recv(ME.get_adress(0), H*N, MPI_INT, 7, 0, WORLD, IGNORE);
         MPI_Recv(MR.get_adress(0), N*N, MPI_INT, 7, 0, WORLD, IGNORE);

         // 3. �������� alpha, MK2H, MO2H ������ T8
         MPI_Send(&alpha, 1, MPI_INT, 7, 0, WORLD);
         MPI_Send(MK.get_adress(0), 2*H*N, MPI_INT, 7, 0, WORLD);
         MPI_Send(MO.get_adress(0), 2*H*N, MPI_INT, 7, 0, WORLD);

         // 4. ���������� a=max(MOH)
         a = maxValue(MO, 2*H, 3*H);

         // 5. �������� a ������ T8
         MPI_Send(&a, 1, MPI_INT, 7, 0, WORLD);

         // 6. �������� a �� ������ T8
         MPI_Recv(&a, 1, MPI_INT, 7, 0, WORLD, IGNORE);

         // 7. ���������� MAH = a*MEH + alpha*MKH*MR
         calculation(a, alpha, ME, MK, MR, H, 2*H, 0, MA);

         // 8. �������� MA2H �� ������ T8
         MPI_Recv(MA.get_adress(0), 2*H*N, MPI_INT, 7, 0, WORLD, IGNORE);

         // 9. �������� MA3H ������ T6
         MPI_Send(MA.get_adress(0), 3*H*N, MPI_INT, 5, 0, WORLD);

         break;
   }

   cout << "Task " << rank+1 << " finished" << endl;
   MPI_Finalize();

   if(rank == 5) {
      // ��������� ����������
      cout << MA << endl;
      system("pause");
   }
   
   return 0;
}