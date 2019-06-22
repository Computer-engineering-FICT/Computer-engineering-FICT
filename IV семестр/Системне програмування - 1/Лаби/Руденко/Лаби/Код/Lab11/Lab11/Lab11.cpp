// Lab11.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "Lab11.h"
#include "vectsse.h"
#include "vectfpu.h"
#include "module.h"
#include <string>

#define MAX_LOADSTRING 100

// Global Variables:
HINSTANCE hInst;								// current instance
TCHAR szTitle[MAX_LOADSTRING];					// The title bar text
TCHAR szWindowClass[MAX_LOADSTRING];			// the main window class name

// Forward declarations of functions included in this code module:
ATOM				MyRegisterClass(HINSTANCE hInstance);
BOOL				InitInstance(HINSTANCE, int);
LRESULT CALLBACK	WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK	About(HWND, UINT, WPARAM, LPARAM);

int APIENTRY _tWinMain(_In_ HINSTANCE hInstance,
                     _In_opt_ HINSTANCE hPrevInstance,
                     _In_ LPTSTR    lpCmdLine,
                     _In_ int       nCmdShow)
{
	UNREFERENCED_PARAMETER(hPrevInstance);
	UNREFERENCED_PARAMETER(lpCmdLine);

 	// TODO: Place code here.
	MSG msg;
	HACCEL hAccelTable;

	// Initialize global strings
	LoadString(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
	LoadString(hInstance, IDC_LAB11, szWindowClass, MAX_LOADSTRING);
	MyRegisterClass(hInstance);

	// Perform application initialization:
	if (!InitInstance (hInstance, nCmdShow))
	{
		return FALSE;
	}

	hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_LAB11));

	// Main message loop:
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
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
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
	wcex.hIcon			= LoadIcon(hInstance, MAKEINTRESOURCE(IDI_LAB11));
	wcex.hCursor		= LoadCursor(NULL, IDC_ARROW);
	wcex.hbrBackground	= (HBRUSH)(COLOR_WINDOW+1);
	wcex.lpszMenuName	= MAKEINTRESOURCE(IDC_LAB11);
	wcex.lpszClassName	= szWindowClass;
	wcex.hIconSm		= LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));

	return RegisterClassEx(&wcex);
}

//
//   FUNCTION: InitInstance(HINSTANCE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
   HWND hWnd;

   hInst = hInstance; // Store instance handle in our global variable

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

void myVectSSE(HWND hWnd)

{
	float oA[8] = { 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0 };
	float oB[8] = { 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 };
	float result0 = 0;

	VectSSE(&result0, oB, oA, 8);
	std::string text = std::to_string(result0);
	MessageBox(hWnd, text.c_str(), "—кал€рний добуток SSE", MB_OK);

	SYSTEMTIME st;
	long tst, ten;
	GetLocalTime(&st);
	tst = 60000 * (long)st.wMinute + 1000 * (long)st.wSecond + (long)st.wMilliseconds;

	for (long i = 0; i<1000000; i++) //повторюЇмо м≥льйон раз≥в 
	{
		VectSSE(&result0, oB, oA, 8);
	}

	GetLocalTime(&st);
	ten = 60000 * (long)st.wMinute + 1000 * (long)st.wSecond + (long)st.wMilliseconds - tst;

	
	std::string text2 = std::to_string(ten);
	MessageBox(hWnd, text2.c_str(), "„ас виконанн€", MB_OK);
}

void myVectFPU(HWND hWnd)

{

	float oA[8] = { 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0 };
	float oB[8] = { 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 };
	float result0 = 0;

	VectFPU(&result0, oB, oA, 8);
	std::string text = std::to_string(result0);
	MessageBox(hWnd, text.c_str(), "—кал€рний добуток FPU", MB_OK);

	SYSTEMTIME st;
	long tst, ten;
	GetLocalTime(&st);
	tst = 60000 * (long)st.wMinute + 1000 * (long)st.wSecond + (long)st.wMilliseconds;

	for (long i = 0; i<1000000; i++) //повторюЇмо м≥льйон раз≥в 
	{
		VectFPU(&result0, oB, oA, 8);
	}
	GetLocalTime(&st);
	ten = 60000 * (long)st.wMinute + 1000 * (long)st.wSecond + (long)st.wMilliseconds - tst;

	std::string text2 = std::to_string(ten);
	MessageBox(hWnd, text2.c_str(), "„ас виконанн€", MB_OK);

}

void myVectC(HWND hWnd)

{
	double oA[8] = { 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0 };
	double oB[8] = { 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 };
	double result = 0;

	SYSTEMTIME st;
	long tst, ten;
	GetLocalTime(&st);
	tst = 60000 * (long)st.wMinute + 1000 * (long)st.wSecond + (long)st.wMilliseconds;

	for (long i = 0; i<1000000; i++)
	{
		result = 0;
		for (long i = 0; i < 8; i++)
		{
			result = result + oA[i] * oB[i];
		}

	}

	GetLocalTime(&st);
	ten = 60000 * (long)st.wMinute + 1000 * (long)st.wSecond + (long)st.wMilliseconds - tst;

	TCHAR buf[32];

	_itoa_s(result, buf, 10);	
	MessageBox(hWnd, buf, "—кал€рний добуток —++", MB_OK);

	_itoa_s(ten, buf, 10);
	MessageBox(hWnd, buf, "„ас виконанн€", MB_OK);

}

//
//  FUNCTION: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  PURPOSE:  Processes messages for the main window.
//
//  WM_COMMAND	- process the application menu
//  WM_PAINT	- Paint the main window
//  WM_DESTROY	- post a quit message and return
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
		// Parse the menu selections:
		switch (wmId)
		{
		case IDM_ABOUT:
			DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);
			break;
		case IDM_EXIT:
			DestroyWindow(hWnd);
			break;
		case ID_EXECUTE_SSE:
			myVectSSE(hWnd);
			break;
		case ID_EXECUTE_FPU:
			myVectFPU(hWnd);
			break;
		case ID_EXECUTE_C:
			myVectC(hWnd);
			break;
		default:
			return DefWindowProc(hWnd, message, wParam, lParam);
		}
		break;
	case WM_PAINT:
		hdc = BeginPaint(hWnd, &ps);
		// TODO: Add any drawing code here...
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

// Message handler for about box.
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
