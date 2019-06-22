#ifndef _MATRIX_H_
#define _MATRIX_H_ 1

#include <assert.h>
#include <ostream>


class Matrix {
public:
   Matrix(size_t rows, size_t cols);
   Matrix(size_t N);
   Matrix(Matrix const &other);
   ~Matrix();

   int get(size_t i, size_t j) const {
      assert(i < this->rows);
      assert(j < this->cols);
      return this->data[i * cols + j];
   }

   void set(size_t i, size_t j, int value) {
      assert(i < this->rows);
      assert(j < this->cols);
      this->data[i * cols + j] = value;
   }

   void* get_adress(size_t element) {
      return this->data + element;
   }

   void fill(int value);

   const size_t rows;
   const size_t cols;

private:
   int *data;
   friend std::ostream &operator<<(std::ostream &ostr, const Matrix &m);

};

#endif