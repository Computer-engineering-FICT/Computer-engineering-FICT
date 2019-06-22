// PRO lab8 MPI
// Naumova Kristina IO-01
// A = B + C(MO*MX)alpha
// 04.05.2013


#include <mpi.h>
#include "data.h"

//N=P: 1, 2, 3, 4, 5, 6
//p:   1, 2, 2, 2, 2, 2
//k:   0, 0, 1, 2, 3, 4

//N = P = (p - 1) * k + p
const int N = 6;
const int p = 2;
const int k = 4;
int P, 
   H; 

int *getFirstRanks()
{
   int *firstRanks = new int[p];
   int value = 1;
   for(int i = 0; i < p; i++)
   {
      firstRanks[i] = value;
      value += (k+1);
   }
   return firstRanks;
}

bool isFirstRank(int rank)
{
   int* array = getFirstRanks();
   for(int i = 0; i < p; i++)
   {
      if(rank == array[i])
      {
         return true;
      }
   }
   return false;
}

int getFirstRank(int secondRank)
{
   int *array = getFirstRanks();
   for(int i = 0; i < p; i++)
   {
      if(secondRank > array[i] && secondRank < array[i+1])
      {
         return array[i];
      }
   }
}


int main(int args, char* argv[])
{

   MPI_Init(&args, &argv);
   int rank;
   MPI_Comm_rank(MPI_COMM_WORLD, &rank);
   MPI_Comm_size(MPI_COMM_WORLD, &P); 
   H = N / P;

   cout << "Task " << rank << " started" << endl;
   
   int alpha = 0, cols_A_B = H, rows_MX = H;
   if(rank == 0)
   {
      cols_A_B = N;
      rows_MX = N;
   } else if(isFirstRank(rank))
   {
      cols_A_B = (k+1) * H;
      rows_MX = (k+1) * H;
   }
   
   Vector A(cols_A_B);
   Vector B(cols_A_B);
   Vector C(N);
   Matrix MO(N);
   Matrix MX(rows_MX, N);

   
   // Ввод данных
   if(rank == 0)
   {
      alpha = 1;
      B.fill(1);
      C.fill(1);
      MO.fill(1);
      MX.fill(1);
      MX.transpose();
   }

   if(rank == 0)
   {
      int firstRank = 1;
      int firstAdress = H;

      // Передать alpha, MO, C, B_(k+1)H, MX_(k+1)H задачам T(1)..T(P-1)
      for(int i = 1; i < p; i++)
      {
         MPI_Send(&alpha, 1, MPI_INT, firstRank, 0, MPI_COMM_WORLD);
         MPI_Send(MO.get_adress(0), N*N, MPI_INT, firstRank, 0, MPI_COMM_WORLD);
         MPI_Send(C.get_adress(0), N, MPI_INT, firstRank, 0, MPI_COMM_WORLD);
         MPI_Send(B.get_adress(firstAdress), (k+1)*H, MPI_INT, firstRank, 0, MPI_COMM_WORLD);
         MPI_Send(MX.get_adress(firstAdress * N), (k+1)*H*N, MPI_INT, firstRank, 0, MPI_COMM_WORLD);
         firstRank += (k+1);
         firstAdress += (k+1)*H;
      }
   } else if(isFirstRank(rank)) {
      // Принять alpha, MO, C, B_(k+1)H, MX_(k+1)H от задачи T0
      MPI_Recv(&alpha, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
      MPI_Recv(MO.get_adress(0), N*N, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
      MPI_Recv(C.get_adress(0), N, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
      MPI_Recv(B.get_adress(0), (k+1)*H, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
      MPI_Recv(MX.get_adress(0), (k+1)*H*N, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

      int secondRank = rank+1;

      // Передать alpha, MO, C, BH, MXH задачам T((P-1)1)..T((P-1)k)
      for(int i = 0; i < k; i++)
      {
         MPI_Send(&alpha, 1, MPI_INT, secondRank, 0, MPI_COMM_WORLD);
         MPI_Send(MO.get_adress(0), N*N, MPI_INT, secondRank, 0, MPI_COMM_WORLD);
         MPI_Send(C.get_adress(0), N, MPI_INT, secondRank, 0, MPI_COMM_WORLD);
         MPI_Send(B.get_adress(H*i+H), H, MPI_INT, secondRank, 0, MPI_COMM_WORLD);
         MPI_Send(MX.get_adress((H*i+H)*N), H*N, MPI_INT, secondRank, 0, MPI_COMM_WORLD);
         ++secondRank;
      }
   }
   else
   {
      // Принять alpha, MO, C, BH, MXH от задач T(1)..T(P-1)
      MPI_Recv(&alpha, 1, MPI_INT, getFirstRank(rank), 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
      MPI_Recv(MO.get_adress(0), N*N, MPI_INT, getFirstRank(rank), 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
      MPI_Recv(C.get_adress(0), N, MPI_INT, getFirstRank(rank), 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
      MPI_Recv(B.get_adress(0), H, MPI_INT, getFirstRank(rank), 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
      MPI_Recv(MX.get_adress(0), H*N, MPI_INT, getFirstRank(rank), 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
   }
   
   Vector A_H(H);
   // Счет AH = BH + C*(MO*MXH)*alpha
   calculation(0, H, alpha, B, C, MO, MX, A_H);
   
   if(rank == 0)
   {
      // Принять AH от всех задач
      MPI_Gather(A_H.get_adress(0), H, MPI_INT, A.get_adress(0), H, MPI_INT, 0, MPI_COMM_WORLD);
      // Вывод результата A
      A.output();
   }
   else
   {
      // Передать AH задаче T(0)
      MPI_Gather(A_H.get_adress(0), H, MPI_INT, NULL, 0, MPI_INT, 0, MPI_COMM_WORLD);
   }
   
   cout << "Task " << rank << " finished" << endl;

   MPI_Finalize();
   if(rank == 0)
   {
      system("pause");
   }
   
   return 0;
}
