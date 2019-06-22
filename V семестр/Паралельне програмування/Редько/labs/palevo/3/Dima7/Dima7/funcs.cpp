 	/* * Водопьянов Дмитрий Вадимович, группа ИО-91
 * Лаб. №7. Потоки MPI
 * 1.16 d=(A+B)*C
 * 2.17 a = MAX(MA - MB)
 * 3.11 D = SORT(A - M)*TRANS(MC)*/ 
  #include "StdAfx.h" 
  #include "funcs.h" 
  #include <iostream> 
  #include <fstream> 
 
  int* PLUS(int ARG1[], int ARG2[]){ 
      static int RESULT[N]; 
      for(int i=0; i < N; i++) 
          RESULT[i] = ARG1[i] + ARG2[i]; 
      return RESULT; 
  } 
  int MUL(int ARG1[], int ARG2[]){ 
      int RESULT = 0; 
      for(int i=0; i < N; i++) 
          RESULT += ARG1[i] * ARG2[i]; 
      return RESULT; 
  } 
  int MAX(int ARG[]){
	  int RESULT = 0;
	  for (int i=0; i<N; i++)
		  if (RESULT<ARG[i])
			  RESULT = ARG[i];
	  return RESULT;
  }
  int MAX (Matrix ARG){
  	  int RESULT = 0;
          for (int i=0; i<N; i++)
          	  for (int j=0; j<N; j++)
		          if (RESULT<ARG.mas[i][j])
				RESULT = ARG.mas[i][j];
          return RESULT;
  }
  Matrix MINUS(Matrix ARG1, Matrix ARG2){ 
       static Matrix RESULT; 
       for(int i=0; i < N; i++) 
           for(int j=0; j < N; j++) 
               RESULT.mas[i][j] = ARG1.mas[i][j] - ARG2.mas[i][j]; 
       return RESULT; 
  } 
  Matrix MUL(Matrix ARG1, Matrix ARG2){ 
       static Matrix RESULT; 
       for(int i=0; i<N; i++) 
           for(int j=0; j<N; j++) {
			   RESULT.mas[i][j]=0;
               for(int k=0; k<N; k++) 
                   RESULT.mas[i][j] += ARG1.mas[i][k] * ARG2.mas[k][j];
		   }
       return RESULT; 
  } 
  Matrix SORT(Matrix ARG){ 
       for(int i=0; i<N; i++) 
           for(int j=0; j<N; j++){ 
               for(int k=j+1; k<N; k++)
				   if (ARG.mas[i][j] < ARG.mas[i][k]){ 
                       int t = ARG.mas[i][j]; 
                       ARG.mas[i][j] = ARG.mas[i][k]; 
                       ARG.mas[i][k] = t; 
                   }    
               for(int k=i+1; k<N; k++) 
                   for(int m=0; m<N; m++) 
                       if (ARG.mas[i][j] < ARG.mas[k][m]){ 
                           int t = ARG.mas[i][j]; 
                           ARG.mas[i][j] = ARG.mas[k][m]; 
                           ARG.mas[k][m] = t; 
                       }  
            } 
        return ARG; 
  } 
  Matrix TRANS(Matrix ARG){
	  Matrix Buf;
	  for (int i=0; i<N; i++)
		  for (int j=0; j<N; j++)
			  Buf.mas[i][j]=ARG.mas[j][i];
	  return Buf;
  }
  Vector MUL(Matrix ARG1, Vector ARG2){ 
       static Vector RESULT; 
       for(int i=0; i<N; i++){
           RESULT.mas[i] = 0;
           for(int j=0; j<N; j++) 
               RESULT.mas[i] += ARG1.mas[i][j] * ARG2.mas[j];
       }
       return RESULT; 
  } 
  Vector SORT(Vector ARG){ 
      for(int i=0; i<N-1; i++) 
          for(int j=i+1; j<N; j++) 
              if (ARG.mas[i] > ARG.mas[j]){ 
                  int t = ARG.mas[j]; 
                  ARG.mas[j] = ARG.mas[i]; 
                  ARG.mas[i] = t; 
              }    
      return ARG; 
  }
  Vector MINUS(Vector ARG1, Vector ARG2){
       static Vector RESULT;
       for (int i=0; i<N; i++)
            RESULT.mas[i]=ARG1.mas[i]-ARG2.mas[i];
       return RESULT;
}
       
  void F1(int A[], int B[], int C[]){ 
      int d = MUL(PLUS(A,B),C);  
      std:: ofstream out("F1.txt"); 
      out << "" << d; 
      out.close(); 
   } 
  void F2(Matrix MA, Matrix MB){ 
      int a = MAX(MINUS(MA,MB));  
      std:: ofstream out("F2.txt"); 
      out << "" << a; 
      out.close(); 
   } 
  void F3(Matrix MC, Vector A, Vector M){ 
      Vector D=SORT(MUL(TRANS(MC),MINUS(A,M)));
     std:: ofstream out("F3.txt"); 
    out << "" << std::endl; 
      for(int i = 0; i < N; i++) 
         out << D.mas[i] << ' '; 
     out << std::endl; 
     out.close(); 
  } 