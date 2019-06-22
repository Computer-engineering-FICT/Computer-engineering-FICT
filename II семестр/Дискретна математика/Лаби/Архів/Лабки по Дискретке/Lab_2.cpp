


#include "stdafx.h"
#include <stdio.h>
#include <math.h>
#include <iostream>
#include <fstream>		// ддя ifstream і ofstream
#include <conio.h>		// для _getch()
#include <Windows.h>	// для SetConsoleTitle();

using namespace std;

typedef int Matrix[40][40];
typedef int Array[40];

bool inputInfo(Array, Array, int &, int &);					// підпрограма зчитування даних із файлу

void Full_Matrix_Sum(Matrix, int, int, Array, Array);		// підпрограма заповнення матриці суміжності
void Full_Matrix_In(Matrix, int, int, Array, Array);		// підпрограма заповнення матриці інцидентності
void Full_Matrix_Degree(Matrix, int, int, Matrix, int);		// підпрограма заповнення матриці степенів
void Full_Matrix_Dist(Matrix, Matrix, int);					// підпрограма заповнення матриці відстаней
void Full_Matrix_yarus(Matrix, Matrix, int, int &, int &);	// підпрограма заповнення матриці метричних характеристик, визначення радіуса і діаметра
bool Def_Odnorod(Matrix, int);								// підпрограма визначення однорідності
bool Def_Izo(Matrix, int);									// підпрограма визначення ізольованих вершин
bool Def_Vys(Matrix, int);									// підпрограма визначення висячих вершин

void Output_Array(Array, Array, int);						// підпрограма виведення масиву на екран
void Output_Matrix(Matrix, int, int);						// підпрограма виведення матриці на екран
void Output_Matrix_Degree(Matrix, int, int);				// підпрограма виведення матрицi степенів графу на екран
void Output_IzoVys(Matrix, int);							// підпрограма виведення про ізольованих та висячих вершин
void Output_Metric(Matrix, int, int, int);					// підпрограма виведення метричних характеристик 
void Record_File(Matrix, int, int, ofstream &);				// підпрограма запису інформації у файл
void Record_File_Degree(Matrix, int, int, ofstream &);		// підпрограма запису матриці степенів графу у файл
void Record_File_IzoVys(Matrix, int, ofstream &);			// підпрограма запису інформації про ізольованиі та висячі вершин у файл
void Record_File_Metric(Matrix, int, int, int, ofstream &);	// підпрограма запису метричних характеристик у файл

void sort_Matrix_row_Inc(Matrix, int, int);					// відсортувати матрицю за зростанням елементів вказаного рядка
void swap_col(Matrix, int, int, int);						// обмін місцями двох вказаних колонок матриці
void swap(int *, int *);									// обмін значеннями двох змінних

int main()
{
	Matrix	Matrix_Sum,			// матриця суміжності
			Matrix_In,			// матриця інцидентності
			Matrix_Degree,		// матриця степенів
			Matrix_Dist,		// матриця відстаней
			Matrix_yarus;		// матриця  метричних характеристик (по ярусах)
	Array	Array_From,			// масив вершини виходу ребра
			Array_To;			// масив вершини входу ребра
	int		kol_top,			// кількість вершин
			kol_edge,			// кількість ребер
			min_ecc,			// мінімальний ексцентритет (радіус графу)
			max_ecc,			// максимальний ексцентритет (діаметр графу)
			Key = 0,			// буфер клавіатури
			DegreeCol = 4;		// кількість колонок в матриці степенів
	ofstream outFile;			// потік у файл (для запису)

	SetConsoleTitle(TEXT("Операції над матрицями графів"));	// заголовок вікна
	setlocale(LC_ALL, "Ukrainian");							// українська розкладка

	if (inputInfo(Array_From, Array_To, kol_top, kol_edge)) {	// зчитування даних із файлу, якщо вдало, продовжити обробку інформації
		printf("Заданий граф\nКiлькiсть вершин%4d\nКiлькiсть ребер%4d\n", kol_top, kol_edge);
		printf("\nпочаток ребра	\tкiнець ребра\n");
		Output_Array(Array_From, Array_To, kol_edge);			// вивести прочитаний граф на екран

		Full_Matrix_Sum(Matrix_Sum, kol_top, kol_edge, Array_From, Array_To);			// заповнення матриці суміжності	
		Full_Matrix_In(Matrix_In, kol_top, kol_edge, Array_From, Array_To);				// заповнення матриці інцидентності 
		Full_Matrix_Degree(Matrix_Degree, kol_top, kol_edge, Matrix_In, DegreeCol);		// заповнення матриці степенів 
		Full_Matrix_Dist(Matrix_Dist, Matrix_Sum, kol_top);								// заповнення матриці відстаней
		Full_Matrix_yarus(Matrix_Dist, Matrix_yarus, kol_top, min_ecc, max_ecc);		// заповнення матриці метричних характеристик, визначення радіуса і діаметра

		/* це для перевірки правильності побудови матриць
		printf("\nМатриця сумiжностi графа\n\n");
		Output_Matrix(Matrix_Sum, kol_top, kol_top);			// вивести матрицю сумiжностi на екран
		printf("\nМатриця вiдстаней графа\n\n");
		Output_Matrix(Matrix_Dist, kol_top, kol_top);			// вивести матрицю вiдстаней на екран
		*/
		outFile.open("output.txt");		// відкрити файл для запису (якщо його не існує - створити)

		do {
			printf("\n1 - вивести степенi вершин графу на екран\n2 - записати степенi вершин графу у файл");
			printf("\n3 - вивести перелiк висячих та iзольованих вершин графу на екран\n4 - записати перелiк висячих та iзольованих вершин графу у файл");
			printf("\n5 - вивести метричi характеристики графу на екран\n6 - записати метричi характеристики графу у файл");
			printf("\nEsc - вихiд iз програми\n\n");
			printf("Натиснiть вiдповiдну клавiшу для вибору дiї:\n");
			Key = _getch();		// перехват натиснутої клавіши (в Key заганяється її код)
			switch (Key) {
			case 49:			// натиснуто 1
				Output_Matrix_Degree(Matrix_Degree, kol_top, DegreeCol);		// вивести матрицю степенів графу на екран
				break;
			case 50:			// натиснуто 2
				Record_File_Degree(Matrix_Degree, kol_top, DegreeCol, outFile);	// запис матриці степенів графу у файл
				break;
			case 51:			// натиснуто 3
				Output_IzoVys(Matrix_Degree, kol_top);							// визначити і вивести на екран ізольовані та висячі вершини
				break;
			case 52:			// натиснуто 4
				Record_File_IzoVys(Matrix_Degree, kol_top, outFile);			// визначити і вивести у файл ізольовані та висячі вершини
				break;
			case 53:			// натиснуто 5		
				// уточнити: до якого яруса відносяться ізольовані вершини? якщо до нульвого, то чи виводити його? 
				Output_Metric(Matrix_yarus, kol_top, min_ecc, max_ecc);			// вивести на екран метричні характеристики графу
				break;
			case 54:			// натиснуто 6
				Record_File_Metric(Matrix_yarus, kol_top, min_ecc, max_ecc, outFile);	// вивести у файл метричні характеристики графу
				break;
			default:
				printf("\nВибiр виконано неправильно.\n\n");
			}
		} while (Key != 27);	// Esc 

		outFile.close();		// закрити потік (файл для запису)
	}
	exit(0);
}

// ------------------------ підпрограма зчитування даних із файлу -----------------------------
bool inputInfo(Array Array_From, Array Array_To, int &kol_top, int &kol_edge) {
	ifstream inFile;	// потік із файла (для читання)
	int zero_top = 0,	// признак вершини з індексом 0
		real_edge = 0;	// дійсна кількість прочитаних з файла ребер

	printf("Зчитуємо даннi з вхiдного файлу\n\n");
	inFile.open("input.txt");		// відкрити файл для читання
	if (inFile) {					// якщо є вхідний файл 
		inFile >> kol_top >> kol_edge;
		while (!inFile.eof() && !zero_top) {		// поки не кінець файла і не попадалась вершина з номером 0 
			inFile >> Array_From[real_edge] >> Array_To[real_edge];
			zero_top = (Array_From[real_edge] == 0 || Array_To[real_edge] == 0);  // якщо попалась вершина з номером 0, підняти прапорець
			++real_edge;
		}
	}
	else {
		printf("Файл не iснує\n\nНатиснiть будь-яку клавiшу для виходу");
		_getch();
		return false;
	}
	if (zero_top) {	// якщо попалась нульова вершина 
		printf("Неправильнi вхiднi данi\n");
		_getch();
		return false;
	}
	int max_top = Array_From[0];
	for (int i = 0; i < kol_edge; i++) {	// пошук номера максимальної вершини графа
		if (max_top < Array_From[i]) max_top = Array_From[i];
		if (max_top < Array_To[i]) max_top = Array_To[i];
	}
	// якщо к-сть прочитаних ребер <> задекларованій к-ті (на початку файла) або к-ть вершин < фактичної к-сті прочитаних вершин
	if (kol_edge != real_edge || kol_top < max_top) {
		printf("Неправильнi вхiднi данi\n");
		_getch();
		return false;
	}
	return true;
}
// ------------------------ підпрограма заповнення матриці суміжності -----------------------------
void Full_Matrix_Sum(Matrix sum, int _top, int _edge, Array _From, Array _To) {
	for (int i = 0; i < _top; i++)
	for (int j = 0; j < _top; j++) sum[i][j] = 0;	// обнулити елементи матриці суміжності
	for (int i = 0; i < _edge; i++)
		sum[_From[i] - 1][_To[i] - 1] = 1;				// заповнити "1" елементи вершин	
}
// ------------------------ підпрограма заповнення матриці відстаней -----------------------------
void Full_Matrix_Dist(Matrix _Dist, Matrix _Sum, int _top) {
	for (int i = 0; i < _top; i++)
	for (int j = 0; j < _top; j++)
		_Dist[i][j] = (i == j) ? 0 : _Sum[i][j];	// головна діагональ = 0, решта = елементам матрицю сміжності в матрицю відстаней (стартова позиція), 

	for (int k = 0; k < _top; k++)
	for (int i = 0; i < _top; i++)
	for (int j = 0; j < _top; j++)
	if (_Dist[i][k] && _Dist[k][j])			// ?????
	if (_Dist[i][k] + _Dist[k][j] < _Dist[i][j] || _Dist[i][j] == 0) _Dist[i][j] = _Dist[i][k] + _Dist[k][j];
	for (int i = 0; i < _top; i++) _Dist[i][i] = 0;		// обнулити головну діагональ матриці відстаней 			
}
// ------------------ підпрограма заповнення матриці метричних характеристик ---------------------
void Full_Matrix_yarus(Matrix _Dist, Matrix _yarus, int _top, int &min_, int &max_) {
	for (int i = 0; i < 2; i++)
	for (int j = 0; j < _top; j++) _yarus[i][j] = 0;	// обнулити матрицю

	// http://www.rpz-dt.org.ua/wp-content/uploads/2015/02/04_graf2.pdf (стор. 15)
	// http://atomlex.narod.ru/discret/examples.htm (рис. 7)
	for (int i = 0; i < _top; i++) {
		_yarus[0][i] = _Dist[i][0];
		_yarus[1][i] = i + 1;
		for (int j = 0; j < _top; j++) _yarus[0][i] = (_Dist[i][j] > _yarus[0][i]) ? _Dist[i][j] : _yarus[0][i];
	}
	min_ = _yarus[0][0], max_ = _yarus[0][0];
	for (int i = 0; i < _top; i++) {
		min_ = (min_ >_yarus[0][i] && _yarus[0][i] != 0) ? _yarus[0][i] : min_;	// знайти мінімальний ексцентритет - радіус	
		max_ = (max_ < _yarus[0][i]) ? _yarus[0][i] : max_;	// знайти максимальний ексцентритет - діаметр
	}
	sort_Matrix_row_Inc(_yarus, 0, _top);	// відсортумати матрицю характеристик за зростанням першого рядка (ексцетритетів)
}
// ------------------------ підпрограма заповнення матриці інцидентності -------------------------
void Full_Matrix_In(Matrix In, int _top, int _edge, Array _From, Array _To) {
	for (int i = 0; i < _top; i++)
	for (int j = 0; j < _edge; j++) In[i][j] = 0;	// обнулити елементи матриці інцидентності
	for (int j = 0; j < _edge; j++) {
		if (_From[j] - 1 != _To[j] - 1) 	{
			In[_From[j] - 1][j] = -1;					// вихід з вершини
			In[_To[j] - 1][j] = 1;						// вхід у вершину
		}
		else In[_From[j] - 1][j] = 2;					// петля у вершині
	}
}
// ------------------------ підпрограма заповнення матриці степенів -----------------------------
void Full_Matrix_Degree(Matrix _degree, int _top, int _edge, Matrix In, int _degreeCol) {
	for (int i = 0; i < _top; i++)
	for (int j = 0; j < _degreeCol; j++) _degree[i][j] = 0;	// обнулити елементи матриці степенів
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
// ------------------------ підпрограма визначення однорідності -----------------------------
bool Def_Odnorod(Matrix _degree, int _top) {
	int flag = 0;
	for (int i = 1; i < _top; i++) 	flag += (_degree[i - 1][3] != _degree[i][3]) ? 1 : 0;
	return flag ? true : false;
}
// ------------------------ підпрограма визначення ізольованих вершин -----------------------------
bool Def_Izo(Matrix _degree, int _top) {
	int flag = 0;
	for (int i = 0; i < _top; i++)	flag += (!_degree[i][3]) ? 1 : 0;
	return flag ? true : false;
}
// ------------------------ підпрограма визначення висячих вершин -----------------------------
bool Def_Vys(Matrix _degree, int _top) {
	int flag = 0;
	for (int i = 0; i < _top; i++) flag += (_degree[i][3] == 1) ? 1 : 0;
	return flag ? true : false;
}
//--------------------- обмін значеннями двох змінних ----------------------------------
void swap(int *n, int *m) {
	int tmp = *n;
	*n = *m;
	*m = tmp;
}
//--------------------- обмін місцями двох вказаних колонок матриці -----------------------------
void swap_col(Matrix M, int _top, int col_in, int col_to) {
	for (int i = 0; i < _top; i++)
		swap(M[i][col_in], M[i][col_to]);
}
//----------------- відсортувати матрицю за зростанням елементів вказаного рядка ---------------
void sort_Matrix_row_Inc(Matrix M, int row, int _top) {
	int flag = 1;
	while (flag) {
		flag = 0;
		for (int j = 0; j < _top - 1; j++)
		if (M[row][j]>M[row][j + 1]) { swap_col(M, _top, j, j + 1); flag = 1; }
	}
}
// ------------------------ підпрограма виведення масиву -----------------------------
void Output_Array(Array _From, Array _To, int n) {
	for (int i = 0; i < n; i++)
		printf("%4d\t\t\t%4d\n", _From[i], _To[i]);
	printf("\n");
}
// ------------------------ підпрограма виведення матриці -----------------------------
void Output_Matrix(Matrix M, int row, int col) {
	for (int i = 0; i < row; i++) 	{
		for (int j = 0; j < col; j++) printf("%4d", M[i][j]);
		printf("\n\n");
	}
}
// ------------------------ підпрограма виведення матрицi степенів графу на екран ---------------------
void Output_Matrix_Degree(Matrix _Degree, int _top, int col){
	printf("\nСтепенi вершин графа\n\n   v    d-(v)   d+(v)   d(v)\n");
	for (int i = 0; i < _top; i++) 	{
		for (int j = 0; j < col; j++) printf("%4d   ", _Degree[i][j]);
		printf("\n");
	}
	if (Def_Odnorod(_Degree, _top))					// визначити степінь однорідності графу 
		printf("\nГраф неоднорiдний\n\n");
	else printf("\nГраф однорiдний. Степiнь однорiдностi -%3d\n\n", _Degree[0][3]);
}
// ------------------------ підпрограма виведення ізольованих та висячих вершин ------------------------
void Output_IzoVys(Matrix _Degree, int row) {
	printf("Iзольованi та висячi вершини графу:\n - iзольованi вершини:\t");
	if (Def_Izo(_Degree, row)) {		// якщо є ізольовані вершини
		for (int i = 0; i < row; i++) if (_Degree[i][3] == 0) printf("%3d;", i + 1);		// вивести на екран ізольовані вершини
		printf("\n");
	}
	else printf(" - вiдсутнi\n");
	printf(" - висячi вершини:\t");
	if (Def_Vys(_Degree, row)) {		// якщо є висячі вершини
		for (int i = 0; i < row; i++) if (_Degree[i][3] == 1) printf("%3d;", i + 1);		// вивести на екран висячі вершини
		printf("\n");
	}
	else printf(" - вiдсутнi\n");
}
// ------------------------ підпрограма виведення метричних характеристик  -----------------------------
void Output_Metric(Matrix _yarus, int _top, int min_, int max_) {
	printf("Метричнi характеристи графу:\n");
	printf(" - дiаметр графу: %3d\n", max_);
	printf(" - радiус графу:  %3d\n", min_);
	int k = 0;
	printf(" - центр графу: {");
	for (int i = 0; i < _top; i++)
	if (_yarus[0][i] == min_) {
		++k;
		if (k > 1) printf(";");
		printf("%2d", _yarus[1][i]);
	}
	printf(" }\n");

	printf(" - яруси графу:  ");
	k = 0;
	while (k < _top) {
		//		if (_yarus[0][k]>0) { ізольвані вершини
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
// ------------------------ підпрограма запису інформації у файл -----------------------------
void Record_File(Matrix M, int row, int col, ofstream &f) {
	for (int i = 0; i < row; i++) {
		for (int j = 0; j < col; j++) {
			if (M[i][j] < 0) f << "  "; else f << "   ";  // відступи для красоти вивода
			f << M[i][j];
		}
		f << "\n";
	}
	f << "\n";
	printf("\nIнформацiя записана у файл\n\n");
}
// ------------------- підпрограма запису матриці степенів графу у файл ------------------------
void Record_File_Degree(Matrix _Degree, int _top, int col, ofstream &f) {
	f << "\nСтепенi вершин графа\n\n   v    d-(v)   d+(v)   d(v)\n";
	for (int i = 0; i < _top; i++) 	{
		for (int j = 0; j < col; j++) f << "   " << _Degree[i][j] << "   ";
		f << "\n";
	}
	if (Def_Odnorod(_Degree, _top))					// визначити степінь однорідності графу 
		f << "\nГраф неоднорiдний\n\n";
	else f << "\nГраф однорiдний. Степiнь однорiдностi - " << _Degree[0][3] << "\n\n";
	printf("\nIнформацiя записана у файл\n\n");
}
// ------------------- підпрограма запису інформації ізольованиі та висячі вершин про у файл -------------
void Record_File_IzoVys(Matrix _Degree, int row, ofstream &f) {
	f << "Iзольовані та висячі вершини графу:\n - iзольованi вершини:\t";
	if (Def_Izo(_Degree, row)) {		// якщо є ізольовані вершини
		for (int i = 0; i < row; i++) if (_Degree[i][3] == 0) f << i + 1 << "; ";		// вивести у файл ізольовані вершини
		f << "\n";
	}
	else f << " - вiдсутнi\n";
	f << " - висячi вершиниу:\t";
	if (Def_Vys(_Degree, row)) {		// якщо є висячі вершини
		for (int i = 0; i < row; i++) if (_Degree[i][3] == 1) f << i + 1 << "; ";		// вивести у файл висячі вершини
		f << "\n";
	}
	else f << " - вiдсутнi\n";
	printf("\nIнформацiя записана у файл\n\n");
}
// ---------------------- підпрограма запису метричних характеристик у файлл ---------------------------
void Record_File_Metric(Matrix _yarus, int _top, int min_, int max_, ofstream &f) {
	f << "Метричнi характеристи графу:\n";
	f << " - дiаметр графу: " << max_ << "\n";
	f << " - радiус графу:  " << min_ << "\n";
	int k = 0;
	f << " - центр графу: { ";
	for (int i = 0; i < _top; i++)
	if (_yarus[0][i] == min_) {
		++k;
		if (k > 1) f << ";";
		f << _yarus[1][i];
	}
	f << " }\n";

	f << " - яруси графу:  ";
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
	printf("\nIнформацiя записана у файл\n\n");
}

