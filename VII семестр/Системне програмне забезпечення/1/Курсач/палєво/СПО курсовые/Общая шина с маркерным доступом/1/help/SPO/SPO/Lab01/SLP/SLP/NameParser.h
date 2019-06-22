#ifndef _NAME_PARSER
#define _NAME_PARSER

#include <stdio.h>
#include <iostream>
using namespace std;

class NameParser
{
private:
	static char letterClasses[256];
	// parser actions
	void error(char c);
	void errorCycle(char c);
	void fromError(char c);
	void skipDividers(char c);
	void getFirst(char c);
	void readCycle(char c);
	void endName(char c);
	// initialization
	void letterClassesInit();
	void functionsInit();
	// state information
	bool goMore;
	int rules[3][5];
	char state;
	char* token;
	unsigned int tokenIndex;
	void (NameParser::*actions[7])(char);
public:
	void initialize();
	char* getToken(char* &buf, int &bufLen, FILE* src, int &pos);
};

#endif //_NAME_PARSER