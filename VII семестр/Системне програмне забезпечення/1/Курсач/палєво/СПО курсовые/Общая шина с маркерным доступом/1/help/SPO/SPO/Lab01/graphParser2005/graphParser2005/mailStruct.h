#ifndef _MAIL_STRUCT
#define _MAIL_STRUCT

#include <stdio.h>
#include <STDLIB.H>
//#include <fstream>
#include <iostream>
using namespace std;

class subDomain
{
public:
	subDomain* next;
	unsigned char size, first; 
};

class MailStruct
{
	friend class mailParser;
private:
	subDomain* subdmns;
	unsigned char charIndex;
	char dmns;
public:
	char* container;
	unsigned char name;
	MailStruct()
	{
		subdmns = NULL;
		container = new char[255];
		charIndex = 0;
		dmns = 0;
	}
	void addChar(char c);
	void output();
};

// mail parser is service
class mailParser
{
private:
	FILE* src;
	unsigned char classes[256];
	unsigned char automat[8][6];
	unsigned char state;
	MailStruct* token;
	bool going;
	void (mailParser::*actions[16])(char&);
	//automat actions
	void toErr(char &c);
	void fromErr(char &c);
	void borderCycle(char &c);
	void toName(char &c);
	void toNameDef(char &c);
	void fromNameDef(char &c);
	void nameCycle(char &c);
	void endName(char &c);
	void toSubdomain(char &c);
	void toSubdomainDef(char &c);
	void fromSubdomainDef(char &c);
	void toDot(char &c);
	void fromDot(char &c);
	void subdomainCycle(char &c);
	void endToken(char &c);
	void errCycle(char &c);
public:
	void getFile(FILE* fsrc);
	void parserInit();
	void initClasses();
	void initAutomat();
	MailStruct* getNextMail(int& currBufferLength, char*& buffer);
};

#endif //_MAIL_STRUCT