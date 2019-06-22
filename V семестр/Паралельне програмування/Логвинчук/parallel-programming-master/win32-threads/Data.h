class Vector {
private:
	int _size;
	int* _data;

public:
	Vector(int size, bool fill);

	~Vector();

	Vector* operator+(Vector &that);
	
	Vector* sort();

	void setElement(int index, int value);

	void print();

	int operator*(Vector &that);

	int getElement(int index);

	int max();
};

class Matrix {
private:
	int _size;
	int** _data;

public:
	Matrix(int size, bool fill);

	~Matrix();

	Matrix* operator+(Matrix &that);

	Matrix* operator*(Matrix &that);

	Vector* operator*(Vector &vector);

	Matrix* sort();

	Matrix* transpose();

	void print();
};
