#include "matrix.h"


Matrix::Matrix(int rows, int cols) :
   Vector(rows * cols),
   rows(rows),
   cols(cols)
{
}


Matrix::Matrix(int N) :
   Vector(N * N),
   rows(N),
   cols(N)
{
}

Matrix::Matrix(const Matrix &other) :
   Vector(other.rows * other.cols),
   rows(other.rows),
   cols(other.cols)
{
   for(int i = 0; i < this->rows; i++)
   {
      for(int j = 0; j < this->cols; j++)
      {
         Matrix::set(i, j, other.get(i, j));
      }
   }
}


Matrix::~Matrix()
{
}


void Matrix::output()
{
   for(int i = 0; i < this->rows; i++)
   {
      for(int j = 0; j < this->cols; j++)
      {
         cout << Vector::get(i * this->cols + j) << "\t";
      }
      cout << endl;
   }
}

void Matrix::get_column(int col, Vector &vector)
{
   assert(col < this->cols);
   for(int i = 0; i < this->rows; i++)
   {
      Vector::set(i, Vector::get(i * this->cols + col));
   }
}

void Matrix::transpose()
{
   Matrix copy(*this);
   for(int i = 0; i < this->rows; i++)
   {
      for(int j = 0; j < this->cols; j++)
      {
         Matrix::set(j, i, copy.get(i, j));
      }
   }
}