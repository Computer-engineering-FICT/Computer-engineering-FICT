extern "C" {
	void  addLongop(int* C, int* B, int* A, int length);
	void subLongop(int* C, int* B, int* A, int length);
	void mulN_x_N(int* C, int* B, int* A, int length);
	void strDec(int* number, char* text, int length);
}
