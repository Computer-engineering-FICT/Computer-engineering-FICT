#ifndef MATRIX_H
#define	MATRIX_H

#include <iostream>
#include "Vector.h"

class Matrix {
public:
    int length;
    Vector * value;
    Matrix();
    void init(int n = 1000);
    virtual ~Matrix();
    void fill(int a = 1);
    Matrix * operator - (const Matrix & rhs) const;
private:

};

#endif	/* MATRIX_H */