#include "Vector.h"

using std::cout;
using std::endl;

Vector::Vector() {}
void Vector::init(int n) {
    value = new int[n];
    length = n;
}
Vector::~Vector() {
    delete[] value;
    value = NULL;
}
void Vector::fill(int a) {
    for (int i = 0; i < length; i++) {
        value[i] = a;
    }
}
Vector * Vector::operator + (const Vector & rhs) const {
    Vector * result = new Vector();
    result->init(length);
    for (int i = 0; i < length; i++) {
        result->value[i] = value[i] + rhs.value[i];
    }
    return result;
}
Vector & Vector::operator += (const Vector & rhs) {
    for (int i = 0; i < length; i++) {
        value[i] += rhs.value[i];
    }
    return *this;
}
Vector * Vector::operator * (const Matrix & rhs) const {
    Vector * result = new Vector();
    result->init(length);
    for (int i = 0; i < length; i++) {
        result->value[i] = 0;
        for (int j = 0; j < length; j++) {
            result->value[i] += value[i] * rhs.value[i].value[j];
        }
    }

    return result;
}
Vector & Vector::operator *= (const Matrix & rhs) {
    Vector result;
    result.init(length);

    for (int i = 0; i < length; i++) {
        result.value[i] = 0;
        for (int j = 0; j < length; j++) {
            result.value[i] += value[i] * rhs.value[i].value[j];
        }
        value[i] = result.value[i];
    }

    return *this;
}
void Vector::print() const {
    cout << "(" << value[0];
    for (int i = 1; i < length; i++) {
        cout << ",\t" << value[i];
    }
    cout << ")";
}
void Vector::println() const {
    print();
    cout << endl;
}
void Vector::sort() {
    for (int i = 0; i < length - 1; i++) {
        int min = value[i];
        int minpos = i;
        for (int j = i + 1; j < length; j++) {
            if (value[j] < min) {
                min = value[j];
                minpos = j;
            }
        }
        if (minpos != i) {
            int buf = value[i];
            value[i] = value[minpos];
            value[minpos] = buf;
        }
    }
}