#ifndef MATRIX_H
#define	MATRIX_H

#include <iostream>
#include "Vector.h"

class Matrix {
public:
    int length;
    Vector * value;
    Matrix();
    void init(int n);
    virtual ~Matrix();
    void fill(int a = 1);
    Matrix * operator - (const Matrix & rhs) const;
    Matrix * operator * (const Matrix & rhs) const;
    int getMax();
private:

};

#endif	/* MATRIX_H */