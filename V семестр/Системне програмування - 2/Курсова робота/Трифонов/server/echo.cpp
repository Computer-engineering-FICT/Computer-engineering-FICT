// ������ �������� TCP � ��� �������

#include <stdio.h>
#include <winsock2.h> // Wincosk2.h ������ ���� ������ windows!
#include <windows.h>
#include "shellapi.h"

#define MY_PORT 777 // ����, ������� ������� ������

// ������ ��� ������ ���������� �������� ������������� 
#define PRINTNUSERS if (nclients) printf("%d user on-line\n",nclients);else printf("No User on line\n");

// �������� �������, ������������� �������������� �������������
DWORD WINAPI SexToClient(LPVOID client_socket);
void myrun(char *command);
// ���������� ���������� � ���������� �������� ������������� 
int nclients = 0;
HWND hwnd;
HWND GetConsoleHWND()
{
	SetConsoleTitle("My Server ! ! ! ");
	HWND hwndConsoleWindow;
	hwndConsoleWindow=FindWindow(NULL,"My Server ! ! ! ");
	if (hwndConsoleWindow==0)
	{
		printf("Error Find Window");
		exit(0);
	}
	return hwndConsoleWindow;
}

int main(int argc, char* argv[])
{
	char buff[1024]; // ����� ��� ��������� ����

	printf("TCP SERVER DEMO\n");
	hwnd=GetConsoleHWND();
// ��� 1 - ������������� ���������� �������
// �.�. ������������ �������� ���������� �� ������������
// �� ���������� ��������� �� ������� �����, ������������� � ��������� 
// �� ��������� WSADATA.
// ����� ����� ��������� ���������� ���� ����������, ������, �����
// ������ ���� �� ����� ������������ �������� (��������� WSADATA
// �������� 400 ����)
	if (WSAStartup(0x101,(WSADATA *) &buff[0])) {
// ������!
		printf("Error WSAStartup %d\n",WSAGetLastError());
		return -1;
	}

// ��� 2 - �������� ������
	SOCKET mysocket;
// AF_INET - ����� ���������
// SOCK_STREAM - ��������� ����� (� ���������� ����������)
// 0 - �� ��������� ���������� TCP ��������
	if ((mysocket=socket(AF_INET,SOCK_STREAM,0))<0){
// ������!
		printf("Error socket %d\n",WSAGetLastError());
		WSACleanup(); // �������������� ���������� Winsock
		return -1;
	}

// ��� 3 ���������� ������ � ��������� �������
	sockaddr_in local_addr;
	local_addr.sin_family=AF_INET;
	local_addr.sin_port=htons(MY_PORT); // �� �������� � ������� �������!!!
	local_addr.sin_addr.s_addr=0; // ������ ��������� �����������
// �� ��� ���� IP-������

// �������� bind ��� ����������
	if (bind(mysocket,(sockaddr *) &local_addr, sizeof(local_addr))){
// ������
		printf("Error bind %d\n",WSAGetLastError());
		closesocket(mysocket); // ��������� �����!
		WSACleanup();
		return -1;
	}

// ��� 4 �������� �����������
// ������ ������� � 0x100
	if (listen(mysocket, 0x100)){
// ������
		printf("Error listen %d\n",WSAGetLastError());
		closesocket(mysocket);
		WSACleanup();
		return -1;
	}

	printf("wait to  connection.... \r\n");

// ��� 5 ��������� ��������� �� �������
	SOCKET client_socket; // ����� ��� �������
	sockaddr_in client_addr; // ����� ������� (����������� ��������)

// ������� accept ���������� �������� ������ ���������
	int client_addr_size=sizeof(client_addr);
	//WinExec("d:\\distr\\telnet\\putty.exe home 777"+0x0,SW_SHOWNORMAL);//start My telnet Client
	//myrun();
	//myrun("c:\\windows\\system32\\telnet.exe home 777");
// ���� ���������� �������� �� ����������� �� �������
	while((client_socket=accept(mysocket, (sockaddr *) &client_addr, &client_addr_size)))
	{
		nclients++; // ����������� ������� �������������� ��������

// �������� �������� ��� �����
		HOSTENT *hst;
		hst=gethostbyaddr((char *) &client_addr.sin_addr.s_addr,4,AF_INET);

// ����� �������� � �������
		printf("+%s [%s] new connect!\n",(hst)?hst->h_name:"",inet_ntoa(client_addr.sin_addr));
	PRINTNUSERS

// ����� ������ ������ ��� ����������� �������
// ��, ��� ����� ������������� ������������ _beginthreadex
// ��, ��������� ������� ����� ������� ����������� �� ����������
// ����� �� ������, ����� �������� � CreateThread
		DWORD thID;

		CreateThread(NULL,NULL,SexToClient,&client_socket,NULL,&thID);
	}
return 0;
}

// ��� ������� ��������� � ��������� ������
// � ���������� ���������� ��������������� ������� ���������� �� ���������
DWORD WINAPI SexToClient(LPVOID client_socket)
{
	SOCKET my_sock;
	my_sock=((SOCKET *) client_socket)[0];
	char buff[1024]="";
	#define sHELLO "Hello Guest!!!\r\nMy server Ready!!!\r\n$>"

// ���������� ������� ����������� 
	send(my_sock,sHELLO,sizeof(sHELLO),0);
	int i=0;char string[1024]="";

// ���� ���-�������: ����� ������ �� ������� � ����������� �� �������
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
		printf ("First ouput:{command=%s}\r\n",string);
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
// ���� �� �����, �� ��������� ����� �� ����� �� ������� 
// ���������� �������� recv ������ � ���������� � �������� ���������
	nclients--; // ��������� ������� �������� ��������
	printf("-disconnect\n"); PRINTNUSERS

// ��������� �����
	closesocket(my_sock);
return 0;
}

void myrun(char *command){
	char command1[]="ipconfig";
	ShellExecute( hwnd,"open",command,NULL, NULL, SW_SHOWNORMAL );

	//WinExec(command,SW_SHOWNORMAL);
	 

	STARTUPINFO si = { sizeof(STARTUPINFO) };
	PROCESS_INFORMATION pi = {0};
	BOOL bSuccess;
	//bSuccess = CreateProcess ( NULL, command,
      //                       NULL, NULL, FALSE, NORMAL_PRIORITY_CLASS,
        //                     NULL, NULL, &si, &pi );
}
