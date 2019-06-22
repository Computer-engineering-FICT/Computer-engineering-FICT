#ifndef _MULTI_ROW_COMMENT_PARSER
#define _MULTI_ROW_COMMENT_PARSER

#include "stdio.h"

class MultiRowCommentParser
{
private:
	static char letterClasses[256];
	// parser actions
	void error(char c);
	void errorCycle(char c);
	void fromError(char c);
	void skipDividers(char c);
	void slashBeginGet(char c);
	void commentBegin(char c);
	void readComment(char c);
	void starFound(char c);
	void notEnd(char c);
	void commentEnd(char c);
	// initialization
	void letterClassesInit();
	void functionsInit();
	// state information
	bool goMore;
	int rules[5][4];
	char state;
	char* token;
	unsigned int tokenIndex;
	void (MultiRowCommentParser::*actions[10])(char);
public:
	void initialize();
	char* getToken(char* buf, int bufLen, FILE* src, int &pos);
};

#endif //_MULTI_ROW_COMMENT_PARSER