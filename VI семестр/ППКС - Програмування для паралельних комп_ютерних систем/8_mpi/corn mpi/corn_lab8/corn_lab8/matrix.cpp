#include "matrix.h"


Matrix::Matrix(size_t N) :
   rows(N),
   cols(N),
   data(new int[N * N])
{
}

Matrix::Matrix(size_t rows, size_t cols) :
   rows(rows),
   cols(cols),
   data(new int[rows * cols])
{
}

Matrix::Matrix(const Matrix &other) :
   rows(other.rows),
   cols(other.cols),
   data(new int[other.rows * other.cols])
{
   for(size_t i = 0; i < this->rows * this->cols; i++) {
      this->data[i] = other.data[i];
   }
}

Matrix::~Matrix() {
   delete[] data;
}


void Matrix::fill(int value) {
   for(size_t i = 0; i < this->rows; i++) {
      for(size_t j = 0; j < this->cols; j++) {
         this->data[i * this->cols + j] = value;
      }
   }
}


std::ostream &operator<<(std::ostream &ostr, const Matrix &matrix) {
   for(size_t i = 0; i < matrix.rows; i++) {
      for(size_t j = 0; j < matrix.cols; j++) {
         ostr << matrix.data[i * matrix.cols + j] << " ";
      }
      ostr << std::endl;
   }
   return ostr;
}