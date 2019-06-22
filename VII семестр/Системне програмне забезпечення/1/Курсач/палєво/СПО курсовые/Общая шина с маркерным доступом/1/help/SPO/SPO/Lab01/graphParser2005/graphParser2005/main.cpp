#include <fstream>
#include <iostream>
#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include "mailStruct.h"
using namespace std;

int main()
{
	cout << "Program for parsing list of emails \n";
	//create file stream
	char fileName[20];
	cout << "Input name of target file\n";
	cin >> fileName;
	cout << "\n";
	FILE *fp;
	if ((fp = fopen(fileName, "r")) == NULL)
	{
		cout << "Unopened file\n";
		_getch();
		return 0;
	}
	mailParser parser = mailParser();
	parser.getFile(fp);
	parser.parserInit();
	MailStruct* token = NULL;
	int length = 0;
	char* buf = NULL;
	while (!(feof(fp)))
	{
		token = parser.getNextMail(length, buf);
		if (token == NULL)
			cout << "error in mailList!\n";
		else 
		{
			token->output();
			delete token;
		}
	}
	/*int ch;
	while ((ch = getc(fp)) != EOF)
	{
		cout << (char)ch;
	}
	cout << "End of file";//*/
	fclose(fp);
 	// get and output tokens in cycle
	_getch();
	return 0;
}