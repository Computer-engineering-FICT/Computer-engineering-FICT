


#include "stdafx.h"
#include <stdio.h>
#include <math.h>
#include <iostream>
#include <fstream>		// ��� ifstream � ofstream
#include <conio.h>		// ��� _getch()
#include <Windows.h>	// ��� SetConsoleTitle();

using namespace std;

typedef int Matrix[40][40];
typedef int Array[40];

bool inputInfo(Array, Array, int &, int &);					// ���������� ���������� ����� �� �����

void Full_Matrix_Sum(Matrix, int, int, Array, Array);		// ���������� ���������� ������� ��������
void Full_Matrix_In(Matrix, int, int, Array, Array);		// ���������� ���������� ������� ������������
void Full_Matrix_Degree(Matrix, int, int, Matrix, int);		// ���������� ���������� ������� �������
void Full_Matrix_Dist(Matrix, Matrix, int);					// ���������� ���������� ������� ��������
void Full_Matrix_yarus(Matrix, Matrix, int, int &, int &);	// ���������� ���������� ������� ��������� �������������, ���������� ������ � �������
bool Def_Odnorod(Matrix, int);								// ���������� ���������� ����������
bool Def_Izo(Matrix, int);									// ���������� ���������� ����������� ������
bool Def_Vys(Matrix, int);									// ���������� ���������� ������� ������

void Output_Array(Array, Array, int);						// ���������� ��������� ������ �� �����
void Output_Matrix(Matrix, int, int);						// ���������� ��������� ������� �� �����
void Output_Matrix_Degree(Matrix, int, int);				// ���������� ��������� ������i ������� ����� �� �����
void Output_IzoVys(Matrix, int);							// ���������� ��������� ��� ����������� �� ������� ������
void Output_Metric(Matrix, int, int, int);					// ���������� ��������� ��������� ������������� 
void Record_File(Matrix, int, int, ofstream &);				// ���������� ������ ���������� � ����
void Record_File_Degree(Matrix, int, int, ofstream &);		// ���������� ������ ������� ������� ����� � ����
void Record_File_IzoVys(Matrix, int, ofstream &);			// ���������� ������ ���������� ��� ���������� �� ������ ������ � ����
void Record_File_Metric(Matrix, int, int, int, ofstream &);	// ���������� ������ ��������� ������������� � ����

void sort_Matrix_row_Inc(Matrix, int, int);					// ����������� ������� �� ���������� �������� ��������� �����
void swap_col(Matrix, int, int, int);						// ���� ������ ���� �������� ������� �������
void swap(int *, int *);									// ���� ���������� ���� ������

int main()
{
	Matrix	Matrix_Sum,			// ������� ��������
			Matrix_In,			// ������� ������������
			Matrix_Degree,		// ������� �������
			Matrix_Dist,		// ������� ��������
			Matrix_yarus;		// �������  ��������� ������������� (�� ������)
	Array	Array_From,			// ����� ������� ������ �����
			Array_To;			// ����� ������� ����� �����
	int		kol_top,			// ������� ������
			kol_edge,			// ������� �����
			min_ecc,			// ��������� ������������ (����� �����)
			max_ecc,			// ������������ ������������ (������ �����)
			Key = 0,			// ����� ���������
			DegreeCol = 4;		// ������� ������� � ������� �������
	ofstream outFile;			// ���� � ���� (��� ������)

	SetConsoleTitle(TEXT("�������� ��� ��������� ������"));	// ��������� ����
	setlocale(LC_ALL, "Ukrainian");							// ��������� ���������

	if (inputInfo(Array_From, Array_To, kol_top, kol_edge)) {	// ���������� ����� �� �����, ���� �����, ���������� ������� ����������
		printf("������� ����\n�i���i��� ������%4d\n�i���i��� �����%4d\n", kol_top, kol_edge);
		printf("\n������� �����	\t�i���� �����\n");
		Output_Array(Array_From, Array_To, kol_edge);			// ������� ���������� ���� �� �����

		Full_Matrix_Sum(Matrix_Sum, kol_top, kol_edge, Array_From, Array_To);			// ���������� ������� ��������	
		Full_Matrix_In(Matrix_In, kol_top, kol_edge, Array_From, Array_To);				// ���������� ������� ������������ 
		Full_Matrix_Degree(Matrix_Degree, kol_top, kol_edge, Matrix_In, DegreeCol);		// ���������� ������� ������� 
		Full_Matrix_Dist(Matrix_Dist, Matrix_Sum, kol_top);								// ���������� ������� ��������
		Full_Matrix_yarus(Matrix_Dist, Matrix_yarus, kol_top, min_ecc, max_ecc);		// ���������� ������� ��������� �������������, ���������� ������ � �������

		/* �� ��� �������� ����������� �������� �������
		printf("\n������� ���i�����i �����\n\n");
		Output_Matrix(Matrix_Sum, kol_top, kol_top);			// ������� ������� ���i�����i �� �����
		printf("\n������� �i������� �����\n\n");
		Output_Matrix(Matrix_Dist, kol_top, kol_top);			// ������� ������� �i������� �� �����
		*/
		outFile.open("output.txt");		// ������� ���� ��� ������ (���� ���� �� ���� - ��������)

		do {
			printf("\n1 - ������� ������i ������ ����� �� �����\n2 - �������� ������i ������ ����� � ����");
			printf("\n3 - ������� �����i� ������� �� i���������� ������ ����� �� �����\n4 - �������� �����i� ������� �� i���������� ������ ����� � ����");
			printf("\n5 - ������� ������i �������������� ����� �� �����\n6 - �������� ������i �������������� ����� � ����");
			printf("\nEsc - ���i� i� ��������\n\n");
			printf("������i�� �i����i��� ����i�� ��� ������ �i�:\n");
			Key = _getch();		// �������� ��������� ������ (� Key ����������� �� ���)
			switch (Key) {
			case 49:			// ��������� 1
				Output_Matrix_Degree(Matrix_Degree, kol_top, DegreeCol);		// ������� ������� ������� ����� �� �����
				break;
			case 50:			// ��������� 2
				Record_File_Degree(Matrix_Degree, kol_top, DegreeCol, outFile);	// ����� ������� ������� ����� � ����
				break;
			case 51:			// ��������� 3
				Output_IzoVys(Matrix_Degree, kol_top);							// ��������� � ������� �� ����� ��������� �� ������ �������
				break;
			case 52:			// ��������� 4
				Record_File_IzoVys(Matrix_Degree, kol_top, outFile);			// ��������� � ������� � ���� ��������� �� ������ �������
				break;
			case 53:			// ��������� 5		
				// ��������: �� ����� ����� ���������� ��������� �������? ���� �� ��������, �� �� �������� ����? 
				Output_Metric(Matrix_yarus, kol_top, min_ecc, max_ecc);			// ������� �� ����� ������� �������������� �����
				break;
			case 54:			// ��������� 6
				Record_File_Metric(Matrix_yarus, kol_top, min_ecc, max_ecc, outFile);	// ������� � ���� ������� �������������� �����
				break;
			default:
				printf("\n���i� �������� �����������.\n\n");
			}
		} while (Key != 27);	// Esc 

		outFile.close();		// ������� ���� (���� ��� ������)
	}
	exit(0);
}

// ------------------------ ���������� ���������� ����� �� ����� -----------------------------
bool inputInfo(Array Array_From, Array Array_To, int &kol_top, int &kol_edge) {
	ifstream inFile;	// ���� �� ����� (��� �������)
	int zero_top = 0,	// ������� ������� � �������� 0
		real_edge = 0;	// ����� ������� ���������� � ����� �����

	printf("������� ����i � ��i����� �����\n\n");
	inFile.open("input.txt");		// ������� ���� ��� �������
	if (inFile) {					// ���� � ������� ���� 
		inFile >> kol_top >> kol_edge;
		while (!inFile.eof() && !zero_top) {		// ���� �� ����� ����� � �� ���������� ������� � ������� 0 
			inFile >> Array_From[real_edge] >> Array_To[real_edge];
			zero_top = (Array_From[real_edge] == 0 || Array_To[real_edge] == 0);  // ���� �������� ������� � ������� 0, ������ ���������
			++real_edge;
		}
	}
	else {
		printf("���� �� i���\n\n������i�� ����-��� ����i�� ��� ������");
		_getch();
		return false;
	}
	if (zero_top) {	// ���� �������� ������� ������� 
		printf("����������i ��i��i ���i\n");
		_getch();
		return false;
	}
	int max_top = Array_From[0];
	for (int i = 0; i < kol_edge; i++) {	// ����� ������ ����������� ������� �����
		if (max_top < Array_From[i]) max_top = Array_From[i];
		if (max_top < Array_To[i]) max_top = Array_To[i];
	}
	// ���� �-��� ���������� ����� <> ������������� �-� (�� ������� �����) ��� �-�� ������ < �������� �-�� ���������� ������
	if (kol_edge != real_edge || kol_top < max_top) {
		printf("����������i ��i��i ���i\n");
		_getch();
		return false;
	}
	return true;
}
// ------------------------ ���������� ���������� ������� �������� -----------------------------
void Full_Matrix_Sum(Matrix sum, int _top, int _edge, Array _From, Array _To) {
	for (int i = 0; i < _top; i++)
	for (int j = 0; j < _top; j++) sum[i][j] = 0;	// �������� �������� ������� ��������
	for (int i = 0; i < _edge; i++)
		sum[_From[i] - 1][_To[i] - 1] = 1;				// ��������� "1" �������� ������	
}
// ------------------------ ���������� ���������� ������� �������� -----------------------------
void Full_Matrix_Dist(Matrix _Dist, Matrix _Sum, int _top) {
	for (int i = 0; i < _top; i++)
	for (int j = 0; j < _top; j++)
		_Dist[i][j] = (i == j) ? 0 : _Sum[i][j];	// ������� �������� = 0, ����� = ��������� ������� ������� � ������� �������� (�������� �������), 

	for (int k = 0; k < _top; k++)
	for (int i = 0; i < _top; i++)
	for (int j = 0; j < _top; j++)
	if (_Dist[i][k] && _Dist[k][j])			// ?????
	if (_Dist[i][k] + _Dist[k][j] < _Dist[i][j] || _Dist[i][j] == 0) _Dist[i][j] = _Dist[i][k] + _Dist[k][j];
	for (int i = 0; i < _top; i++) _Dist[i][i] = 0;		// �������� ������� �������� ������� �������� 			
}
// ------------------ ���������� ���������� ������� ��������� ������������� ---------------------
void Full_Matrix_yarus(Matrix _Dist, Matrix _yarus, int _top, int &min_, int &max_) {
	for (int i = 0; i < 2; i++)
	for (int j = 0; j < _top; j++) _yarus[i][j] = 0;	// �������� �������

	// http://www.rpz-dt.org.ua/wp-content/uploads/2015/02/04_graf2.pdf (����. 15)
	// http://atomlex.narod.ru/discret/examples.htm (���. 7)
	for (int i = 0; i < _top; i++) {
		_yarus[0][i] = _Dist[i][0];
		_yarus[1][i] = i + 1;
		for (int j = 0; j < _top; j++) _yarus[0][i] = (_Dist[i][j] > _yarus[0][i]) ? _Dist[i][j] : _yarus[0][i];
	}
	min_ = _yarus[0][0], max_ = _yarus[0][0];
	for (int i = 0; i < _top; i++) {
		min_ = (min_ >_yarus[0][i] && _yarus[0][i] != 0) ? _yarus[0][i] : min_;	// ������ ��������� ������������ - �����	
		max_ = (max_ < _yarus[0][i]) ? _yarus[0][i] : max_;	// ������ ������������ ������������ - ������
	}
	sort_Matrix_row_Inc(_yarus, 0, _top);	// ����������� ������� ������������� �� ���������� ������� ����� (������������)
}
// ------------------------ ���������� ���������� ������� ������������ -------------------------
void Full_Matrix_In(Matrix In, int _top, int _edge, Array _From, Array _To) {
	for (int i = 0; i < _top; i++)
	for (int j = 0; j < _edge; j++) In[i][j] = 0;	// �������� �������� ������� ������������
	for (int j = 0; j < _edge; j++) {
		if (_From[j] - 1 != _To[j] - 1) 	{
			In[_From[j] - 1][j] = -1;					// ����� � �������
			In[_To[j] - 1][j] = 1;						// ���� � �������
		}
		else In[_From[j] - 1][j] = 2;					// ����� � ������
	}
}
// ------------------------ ���������� ���������� ������� ������� -----------------------------
void Full_Matrix_Degree(Matrix _degree, int _top, int _edge, Matrix In, int _degreeCol) {
	for (int i = 0; i < _top; i++)
	for (int j = 0; j < _degreeCol; j++) _degree[i][j] = 0;	// �������� �������� ������� �������
	for (int i = 0; i < _top; i++) {
		int in = 0, out = 0;
		_degree[i][0] = i + 1;
		for (int j = 0; j < _edge; j++) {
			_degree[i][1] += (In[i][j] == 1 || (In[i][j]) == 2) ? 1 : 0;
			_degree[i][2] += (In[i][j] == -1 || (In[i][j]) == 2) ? 1 : 0;
			_degree[i][3] = _degree[i][1] + _degree[i][2];
		}
	}
}
// ------------------------ ���������� ���������� ���������� -----------------------------
bool Def_Odnorod(Matrix _degree, int _top) {
	int flag = 0;
	for (int i = 1; i < _top; i++) 	flag += (_degree[i - 1][3] != _degree[i][3]) ? 1 : 0;
	return flag ? true : false;
}
// ------------------------ ���������� ���������� ����������� ������ -----------------------------
bool Def_Izo(Matrix _degree, int _top) {
	int flag = 0;
	for (int i = 0; i < _top; i++)	flag += (!_degree[i][3]) ? 1 : 0;
	return flag ? true : false;
}
// ------------------------ ���������� ���������� ������� ������ -----------------------------
bool Def_Vys(Matrix _degree, int _top) {
	int flag = 0;
	for (int i = 0; i < _top; i++) flag += (_degree[i][3] == 1) ? 1 : 0;
	return flag ? true : false;
}
//--------------------- ���� ���������� ���� ������ ----------------------------------
void swap(int *n, int *m) {
	int tmp = *n;
	*n = *m;
	*m = tmp;
}
//--------------------- ���� ������ ���� �������� ������� ������� -----------------------------
void swap_col(Matrix M, int _top, int col_in, int col_to) {
	for (int i = 0; i < _top; i++)
		swap(M[i][col_in], M[i][col_to]);
}
//----------------- ����������� ������� �� ���������� �������� ��������� ����� ---------------
void sort_Matrix_row_Inc(Matrix M, int row, int _top) {
	int flag = 1;
	while (flag) {
		flag = 0;
		for (int j = 0; j < _top - 1; j++)
		if (M[row][j]>M[row][j + 1]) { swap_col(M, _top, j, j + 1); flag = 1; }
	}
}
// ------------------------ ���������� ��������� ������ -----------------------------
void Output_Array(Array _From, Array _To, int n) {
	for (int i = 0; i < n; i++)
		printf("%4d\t\t\t%4d\n", _From[i], _To[i]);
	printf("\n");
}
// ------------------------ ���������� ��������� ������� -----------------------------
void Output_Matrix(Matrix M, int row, int col) {
	for (int i = 0; i < row; i++) 	{
		for (int j = 0; j < col; j++) printf("%4d", M[i][j]);
		printf("\n\n");
	}
}
// ------------------------ ���������� ��������� ������i ������� ����� �� ����� ---------------------
void Output_Matrix_Degree(Matrix _Degree, int _top, int col){
	printf("\n������i ������ �����\n\n   v    d-(v)   d+(v)   d(v)\n");
	for (int i = 0; i < _top; i++) 	{
		for (int j = 0; j < col; j++) printf("%4d   ", _Degree[i][j]);
		printf("\n");
	}
	if (Def_Odnorod(_Degree, _top))					// ��������� ������ ���������� ����� 
		printf("\n���� �������i����\n\n");
	else printf("\n���� �����i����. ����i�� �����i�����i -%3d\n\n", _Degree[0][3]);
}
// ------------------------ ���������� ��������� ����������� �� ������� ������ ------------------------
void Output_IzoVys(Matrix _Degree, int row) {
	printf("I��������i �� �����i ������� �����:\n - i��������i �������:\t");
	if (Def_Izo(_Degree, row)) {		// ���� � ��������� �������
		for (int i = 0; i < row; i++) if (_Degree[i][3] == 0) printf("%3d;", i + 1);		// ������� �� ����� ��������� �������
		printf("\n");
	}
	else printf(" - �i�����i\n");
	printf(" - �����i �������:\t");
	if (Def_Vys(_Degree, row)) {		// ���� � ������ �������
		for (int i = 0; i < row; i++) if (_Degree[i][3] == 1) printf("%3d;", i + 1);		// ������� �� ����� ������ �������
		printf("\n");
	}
	else printf(" - �i�����i\n");
}
// ------------------------ ���������� ��������� ��������� �������������  -----------------------------
void Output_Metric(Matrix _yarus, int _top, int min_, int max_) {
	printf("�������i ������������ �����:\n");
	printf(" - �i����� �����: %3d\n", max_);
	printf(" - ���i�� �����:  %3d\n", min_);
	int k = 0;
	printf(" - ����� �����: {");
	for (int i = 0; i < _top; i++)
	if (_yarus[0][i] == min_) {
		++k;
		if (k > 1) printf(";");
		printf("%2d", _yarus[1][i]);
	}
	printf(" }\n");

	printf(" - ����� �����:  ");
	k = 0;
	while (k < _top) {
		//		if (_yarus[0][k]>0) { �������� �������
		printf("D(v,%2d) = {%2d", _yarus[0][k], _yarus[1][k]);
		++k;
		while (_yarus[0][k] == _yarus[0][k - 1]) {
			printf(";%2d", _yarus[1][k]);
			++k;
		}
		printf(" } ");
		//		}
		//		else ++k;
	}
	printf("\n");
}
// ------------------------ ���������� ������ ���������� � ���� -----------------------------
void Record_File(Matrix M, int row, int col, ofstream &f) {
	for (int i = 0; i < row; i++) {
		for (int j = 0; j < col; j++) {
			if (M[i][j] < 0) f << "  "; else f << "   ";  // ������� ��� ������� ������
			f << M[i][j];
		}
		f << "\n";
	}
	f << "\n";
	printf("\nI�������i� �������� � ����\n\n");
}
// ------------------- ���������� ������ ������� ������� ����� � ���� ------------------------
void Record_File_Degree(Matrix _Degree, int _top, int col, ofstream &f) {
	f << "\n������i ������ �����\n\n   v    d-(v)   d+(v)   d(v)\n";
	for (int i = 0; i < _top; i++) 	{
		for (int j = 0; j < col; j++) f << "   " << _Degree[i][j] << "   ";
		f << "\n";
	}
	if (Def_Odnorod(_Degree, _top))					// ��������� ������ ���������� ����� 
		f << "\n���� �������i����\n\n";
	else f << "\n���� �����i����. ����i�� �����i�����i - " << _Degree[0][3] << "\n\n";
	printf("\nI�������i� �������� � ����\n\n");
}
// ------------------- ���������� ������ ���������� ���������� �� ������ ������ ��� � ���� -------------
void Record_File_IzoVys(Matrix _Degree, int row, ofstream &f) {
	f << "I�������� �� ������ ������� �����:\n - i��������i �������:\t";
	if (Def_Izo(_Degree, row)) {		// ���� � ��������� �������
		for (int i = 0; i < row; i++) if (_Degree[i][3] == 0) f << i + 1 << "; ";		// ������� � ���� ��������� �������
		f << "\n";
	}
	else f << " - �i�����i\n";
	f << " - �����i ��������:\t";
	if (Def_Vys(_Degree, row)) {		// ���� � ������ �������
		for (int i = 0; i < row; i++) if (_Degree[i][3] == 1) f << i + 1 << "; ";		// ������� � ���� ������ �������
		f << "\n";
	}
	else f << " - �i�����i\n";
	printf("\nI�������i� �������� � ����\n\n");
}
// ---------------------- ���������� ������ ��������� ������������� � ����� ---------------------------
void Record_File_Metric(Matrix _yarus, int _top, int min_, int max_, ofstream &f) {
	f << "�������i ������������ �����:\n";
	f << " - �i����� �����: " << max_ << "\n";
	f << " - ���i�� �����:  " << min_ << "\n";
	int k = 0;
	f << " - ����� �����: { ";
	for (int i = 0; i < _top; i++)
	if (_yarus[0][i] == min_) {
		++k;
		if (k > 1) f << ";";
		f << _yarus[1][i];
	}
	f << " }\n";

	f << " - ����� �����:  ";
	k = 0;
	while (k < _top) {
		if (_yarus[0][k]>0) {
			f << "D(v," << _yarus[0][k] << ") = { " << _yarus[1][k];
			++k;
			while (_yarus[0][k] == _yarus[0][k - 1]) {
				f << "; " << _yarus[1][k];
				++k;
			}
			f << " } ";
		}
		else k++;
	}
	f << "\n";
	printf("\nI�������i� �������� � ����\n\n");
}

