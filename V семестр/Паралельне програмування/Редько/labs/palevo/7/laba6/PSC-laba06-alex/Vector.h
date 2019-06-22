#ifndef VECTOR_H
#define	VECTOR_H

#include <iostream>

class Matrix;

class Vector {
public:
    int length;
    int * value;
    Vector();
    void init(int n = 1000);
    virtual ~Vector();
    void fill(int a = 1);
    Vector * operator + (const Vector & rhs) const;
    Vector & operator += (const Vector & rhs);
    Vector * operator * (const Matrix & rhs) const;
    Vector & operator *= (const Matrix & rhs);
    void print() const;
    void println() const;
    void sort();
private:

};

#include "Matrix.h"

#endif	/* VECTOR_H */