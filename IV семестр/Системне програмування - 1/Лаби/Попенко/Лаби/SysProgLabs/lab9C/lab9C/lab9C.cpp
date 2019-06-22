// lab9C.cpp: ���������� ����� ����� ��� ����������.
//
#include <ctime>


#include "stdafx.h"
#include "lab9C.h"
#include "longop.h"
#include "module.h" 
#include "vectsse.h"
#include "vectfpu.h"


#define MAX_LOADSTRING 100

// ���������� ����������:
HINSTANCE hInst;								// ������� ���������
TCHAR szTitle[MAX_LOADSTRING];					// ����� ������ ���������
TCHAR szWindowClass[MAX_LOADSTRING];			// ��� ������ �������� ����

// ��������� ���������� �������, ���������� � ���� ������ ����:
ATOM				MyRegisterClass(HINSTANCE hInstance);
BOOL				InitInstance(HINSTANCE, int);
LRESULT CALLBACK	WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK	About(HWND, UINT, WPARAM, LPARAM);
void                MyWork1(HWND hWnd);
void                MyMulVectFPU(HWND hWnd);
void                MyMulVectSSE(HWND hWnd);
void                MyMulVectC(HWND hWnd);

int APIENTRY _tWinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPTSTR    lpCmdLine,
                     int       nCmdShow)
{
	UNREFERENCED_PARAMETER(hPrevInstance);
	UNREFERENCED_PARAMETER(lpCmdLine);

 	// TODO: ���������� ��� �����.
	MSG msg;
	HACCEL hAccelTable;

	// ������������� ���������� �����
	LoadString(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
	LoadString(hInstance, IDC_LAB9C, szWindowClass, MAX_LOADSTRING);
	MyRegisterClass(hInstance);

	// ��������� ������������� ����������:
	if (!InitInstance (hInstance, nCmdShow))
	{
		return FALSE;
	}

	hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_LAB9C));

	// ���� ��������� ���������:
	while (GetMessage(&msg, NULL, 0, 0))
	{
		if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg))
		{
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}
	}

	return (int) msg.wParam;
}



//
//  �������: MyRegisterClass()
//
//  ����������: ������������ ����� ����.
//
//  �����������:
//
//    ��� ������� � �� ������������� ���������� ������ � ������, ���� �����, ����� ������ ���
//    ��� ��������� � ��������� Win32, �� �������� ������� RegisterClassEx'
//    ������� ���� ��������� � Windows 95. ����� ���� ������� ����� ��� ����,
//    ����� ���������� �������� "������������" ������ ������ � ���������� �����
//    � ����.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
	WNDCLASSEX wcex;

	wcex.cbSize = sizeof(WNDCLASSEX);

	wcex.style			= CS_HREDRAW | CS_VREDRAW;
	wcex.lpfnWndProc	= WndProc;
	wcex.cbClsExtra		= 0;
	wcex.cbWndExtra		= 0;
	wcex.hInstance		= hInstance;
	wcex.hIcon			= LoadIcon(hInstance, MAKEINTRESOURCE(IDI_LAB9C));
	wcex.hCursor		= LoadCursor(NULL, IDC_ARROW);
	wcex.hbrBackground	= (HBRUSH)(COLOR_WINDOW+1);
	wcex.lpszMenuName	= MAKEINTRESOURCE(IDC_LAB9C);
	wcex.lpszClassName	= szWindowClass;
	wcex.hIconSm		= LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));

	return RegisterClassEx(&wcex);
}

//
//   �������: InitInstance(HINSTANCE, int)
//
//   ����������: ��������� ��������� ���������� � ������� ������� ����.
//
//   �����������:
//
//        � ������ ������� ���������� ���������� ����������� � ���������� ����������, � �����
//        ��������� � ��������� �� ����� ������� ���� ���������.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
   HWND hWnd;

   hInst = hInstance; // ��������� ���������� ���������� � ���������� ����������

   hWnd = CreateWindow(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, NULL, NULL, hInstance, NULL);

   if (!hWnd)
   {
      return FALSE;
   }

   ShowWindow(hWnd, nCmdShow);
   UpdateWindow(hWnd);

   return TRUE;
}

//
//  �������: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  ����������:  ������������ ��������� � ������� ����.
//
//  WM_COMMAND	- ��������� ���� ����������
//  WM_PAINT	-��������� ������� ����
//  WM_DESTROY	 - ������ ��������� � ������ � ���������.
//
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	int wmId, wmEvent;
	PAINTSTRUCT ps;
	HDC hdc;

	switch (message)
	{
	case WM_COMMAND:
		wmId    = LOWORD(wParam);
		wmEvent = HIWORD(wParam);
		// ��������� ����� � ����:
		switch (wmId)
		{
		case ID_32772: // ���� ������ ���� 
			MyWork1(hWnd); 
			 break; 
		case ID_32774: // ���� ������ ���� 
			MyMulVectC(hWnd); 
			 break; 
		case ID_32776: // ���� ������ ���� 
			MyMulVectSSE(hWnd); 
			 break; 
		case ID_32777: // ���� ������ ���� 
			MyMulVectFPU(hWnd); 
			 break; 

		case IDM_ABOUT:
			DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);
			break;
		case IDM_EXIT:
			DestroyWindow(hWnd);
			break;
		default:
			return DefWindowProc(hWnd, message, wParam, lParam);
		}
		break;
	case WM_PAINT:
		hdc = BeginPaint(hWnd, &ps);
		// TODO: �������� ����� ��� ���������...
		EndPaint(hWnd, &ps);
		break;
	case WM_DESTROY:
		PostQuitMessage(0);
		break;
	default:
		return DefWindowProc(hWnd, message, wParam, lParam);
	}
	return 0;
}

// ���������� ��������� ��� ���� "� ���������".
INT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	UNREFERENCED_PARAMETER(lParam);
	switch (message)
	{
	case WM_INITDIALOG:
		return (INT_PTR)TRUE;

	case WM_COMMAND:
		if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
		{
			EndDialog(hDlg, LOWORD(wParam));
			return (INT_PTR)TRUE;
		}
		break;
	}
	return (INT_PTR)FALSE;
}

void MyWork1(HWND hWnd) 
{ 
long oA[12]={0x00000002,0x00000000,0x00000000,0x00000000, 
 0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000}; 
long oB[12]={0x00000001,0x00000000,0x00000000,0x00000000, 
 0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000}; 
long oN[12]={0x00000002,0x00000000,0x00000000,0x00000000, 
 0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000}; 
long oC[12]={0x00000004,0x00000000,0x00000000,0x00000000, 
 0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000}; 
long result1[384];
long result2[384];
long result3[384];
long result4[384];
long result5[24] ={0x00000000,0x00000000,0x00000000,0x00000000, 
 0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000, 
 0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000};
char TextBuf[384]; 

Sub_Long(result4, oB, oA); 
Add_Long(result2, oC, oN);
Multlong(result5, result4, result2);
StrHex_MY(768, result5, TextBuf); 


MessageBox(hWnd, TextBuf, "��������� (A-B)(C+2)", MB_OK); 

} 

void MyMulVectC(HWND hWnd)
{
	double oA[8]={1.0,2.0,3.0,4.0, 
	5.0,6.0,7.0,8.0}; 
	double oB[8]={1.0,1.0,1.0,1.0, 
	1.0,1.0,1.0,1.0}; 
	double result = 0;



	SYSTEMTIME st; 
	long tst,ten; 
	GetLocalTime(&st); 
	tst = 60000*(long)st.wMinute 
	 + 1000*(long)st.wSecond 
	 + (long)st.wMilliseconds; 
	for (long i=0; i<1000000; i++) 
	 { 
		 result = 0;
		for(long i = 0; i < 8; i++)
		{
			result = result + oA[i]*oB[i];
		}
	 } 

	GetLocalTime(&st); 
	ten = 60000*(long)st.wMinute 
	+ 1000*(long)st.wSecond 
	+ (long)st.wMilliseconds - tst;


	TCHAR buf[32];
	_itot(result, buf, 10);
    
	MessageBox(hWnd,  buf, "��������� ������� �++", MB_OK); 
	_itot(ten, buf, 10);

	MessageBox(hWnd,  buf, "��� ���������", MB_OK);
}

void MyMulVectSSE(HWND hWnd)
{
	double oA[8]={1.0,2.0,3.0,4.0, 
	5.0,6.0,7.0,8.0}; 
	double oB[8]={1.0,1.0,1.0,1.0, 
	1.0,1.0,1.0,1.0}; 
	long result0[3] ={0x00000000,0x00000000,0x00000000};
	char TextBuf[384];

	SYSTEMTIME st; 
	long tst,ten; 
	GetLocalTime(&st); 
	tst = 60000*(long)st.wMinute 
	 + 1000*(long)st.wSecond 
	 + (long)st.wMilliseconds; 
	for (long i=0; i<1000000; i++) //���������� ������ ���� 
	 { 
	 //���, ��� ����� ������� ������� ��� 
	 } 

	GetLocalTime(&st); 
	ten = 60000*(long)st.wMinute 
	+ 1000*(long)st.wSecond 
	+ (long)st.wMilliseconds - tst; 

//	VectSSE(result0, oB, oA, 8);
	StrHex_MY(96, result0, TextBuf); 
	MessageBox(hWnd, TextBuf, "��������� ������� SSE", MB_OK);
	MessageBox(hWnd, "SSE", "��������� ������� SSE", MB_OK); 
}

void MyMulVectFPU(HWND hWnd)
{
	double oA[8]={1.0,2.0,3.0,4.0, 
	5.0,6.0,7.0,8.0}; 
	double oB[8]={1.0,1.0,1.0,1.0, 
	1.0,1.0,1.0,1.0}; 
	long result0[3] ={0x00000000,0x00000000,0x00000000};
	char TextBuf[384];

	SYSTEMTIME st; 
	long tst,ten; 
	GetLocalTime(&st); 
	tst = 60000*(long)st.wMinute 
	 + 1000*(long)st.wSecond 
	 + (long)st.wMilliseconds; 
	for (long i=0; i<1000000; i++) //���������� ������ ���� 
	 { 
	 //���, ��� ����� ������� ������� ��� 
	 } 

	GetLocalTime(&st); 
	ten = 60000*(long)st.wMinute 
	+ 1000*(long)st.wSecond 
	+ (long)st.wMilliseconds - tst; 

//	VectFPU(result0, oB, oA, 8);
	StrHex_MY(96, result0, TextBuf); 
	MessageBox(hWnd, TextBuf, "��������� ������� FPU", MB_OK);
	MessageBox(hWnd, "FPU", "��������� ������� FPU", MB_OK); 
}

