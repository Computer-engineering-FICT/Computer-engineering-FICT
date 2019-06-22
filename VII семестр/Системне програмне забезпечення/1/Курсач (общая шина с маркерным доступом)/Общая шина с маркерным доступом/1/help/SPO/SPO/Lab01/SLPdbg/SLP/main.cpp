#include <iostream>
#include <conio.h>

#include "SingleRowCP.h"
#include "ValueParser.h"
#include "NameParser.h"
#include "MultiRowCP.h"
#include "MainParser.h"

using namespace std;

//#define dbg

int main()
{
	cout << "Initializing parser...\n";
	MainParser mp = MainParser();
	mp.initialize();
	int pos = 0;
	/*cout << "Input name of file: \n";
	char fileName[20];
	cin >> fileName;
	cout << "\n";*/
	FILE *fp = NULL;
	/*if ((fp = fopen(fileName, "r")) == NULL)
	{
		cout << "Unopened file\n";
		_getch();
		return 0;
	}*/
	char* buf = NULL;
	int length = 0;
	while (true)
	{
		char* token = mp.getToken(buf, length, fp, pos);
		if (token == NULL)
			cout << "error happened!\n";
		else 
			cout << token << "\n";
	}
	//fclose(fp);
	_getch();
	return 0;
}