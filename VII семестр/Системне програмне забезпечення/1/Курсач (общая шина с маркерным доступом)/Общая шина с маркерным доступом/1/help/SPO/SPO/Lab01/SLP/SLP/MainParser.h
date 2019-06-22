#ifndef _MAIN_PARSER
#define _MAIN_PARSER

#include <stdio.h>

#include "MultiRowCP.h"
#include "NameParser.h"
#include "SingleRowCP.h"
#include "ValueParser.h"

class MainParser;

class MainParser
{
private:
	static char letterClasses[256];
	// parser actions
	void error(char c);
	void errorCycle(char c);
	void fromError(char c);
	void skipDividers(char c);
	void singleRowComment(char c);
	void slashFound(char c);
	void multiRowComment(char c);
	void nameFound(char c);
	void equalFound(char c);
	void endValue(char c);
	void parametrFound(char c);
	void subSection(char c);
	void ruleLower(char c);
	void endSection(char c);
	// initialization
	void letterClassesInit();
	void functionsInit();
	// state information
	bool goMore;
	static int rules[7][10];
	char state;
	char* token;
	unsigned int tokenIndex;
	void (MainParser::*actions[14])(char);
	//context
	char* obuf;
	int* obufLen;
	FILE** osrc;
	int* opos;
public:
	MainParser* subParser;
	MainParser* curr;
	MultiRowCommentParser mrcp;
	NameParser np;
	SingleRowCommentParser srcp;
	ValueParser vp;
	// payload
	void initialize();
	char* getToken(char* buf, int &bufLen, FILE* src, int &pos);
};

#endif //_MAIN_PARSER