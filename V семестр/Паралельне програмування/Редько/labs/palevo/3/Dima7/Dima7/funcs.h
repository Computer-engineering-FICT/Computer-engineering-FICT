 	/* * Водопьянов Дмитрий Вадимович, группа ИО-91
 * Лаб. №7. Потоки MPI
 * 1.16 d=(A+B)*C
 * 2.17 a = MAX(MA - MB)
 * 3.11 D = SORT(A - M)*TRANS(MC)*/  
  #pragma once 
  int const N = 200; 
  struct Matrix{ 
      int mas[N][N]; 
  }; 
  struct Vector{ 
      int mas[N]; 
  };
  void F1(int A[], int B[], int C[]); 
  void F2(Matrix MA, Matrix MB); 
  void F3(Matrix MC, Vector A, Vector M); 