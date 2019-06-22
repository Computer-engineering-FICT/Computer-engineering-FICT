#include "Matrix.h"

using std::cout;
using std::endl;

Matrix::Matrix() {}
void Matrix::init(int n) {
    value = new Vector[n];
    length = n;
    for (int i = 0; i < n; i++) {
        value[i].init();
    }
}
Matrix::~Matrix() {
    for (int i = 0; i < length; i++) {
        delete[] value[i].value;
        value[i].value = NULL;
    }
    delete[] value;
    value = NULL;
}
void Matrix::fill(int a) {
    for (int i = 0; i < length; i++) {
        value[i].fill(a);
    }
}
Matrix * Matrix::operator - (const Matrix & rhs) const {
    Matrix * result = new Matrix();
    result->init(length);
    for (int i = 0; i < length; i++) {
        for (int j = 0; j < length; j++) {
            result->value[i].value[j] = this->value[i].value[j] - rhs.value[i].value[j];
        }
    }
    return result;
}