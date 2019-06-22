#ifndef _SINGLE_ROW_COMMENT_PARSER
#define _SINGLE_ROW_COMMENT_PARSER

#include <stdio.h>

class SingleRowCommentParser
{
private:
	static char letterClasses[256];
	void letterClassesInit();
	void functionsInit();
	// internal parser functions
	void error(char c);
	void skipDividers(char c);
	void commentBegin(char c);
	void readComment(char c);
	void commentEnd(char c);
	void fromError(char c);
	void errorCycle(char c);
	// state variables
	char state;
	bool goMore;
	char* token;
	unsigned int tokenIndex;
	void (SingleRowCommentParser::*actions[7])(char);
	int rules[3][4];
public:
	void initialize();
	char* getToken(char* buf, int bufLen, FILE* src, int &pos);
};

#endif //_SINGLE_ROW_COMMENT_PARSER