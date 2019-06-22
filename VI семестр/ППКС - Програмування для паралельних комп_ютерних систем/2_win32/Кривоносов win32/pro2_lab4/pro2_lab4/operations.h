/*
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*                                                             *
*            Програмування паралельний комп'ютерних сисем     *
*             Лабораторна робота №4. Бібліотека OpenMP        *
*                                                             *
* Завдання: A = A=sort(alfa*B+Z(MO*MK))                       *
*                                                             *
* Автор Кривоносов Олексій                                    *
* Група ІО-34                                                 *
* Дата 02.04.16                                               *
*                                                             *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*/
typedef int* vector;
typedef int** matrix;


const int N = 8;


vector inputVector(int);
matrix inputMatrix(int);
void output(vector);

void sort(int, int);
void merge(int, int, int,int, vector);
vector copyVector(vector);
matrix copyMatrix(matrix);
matrix initMatrix();
vector initVector();
