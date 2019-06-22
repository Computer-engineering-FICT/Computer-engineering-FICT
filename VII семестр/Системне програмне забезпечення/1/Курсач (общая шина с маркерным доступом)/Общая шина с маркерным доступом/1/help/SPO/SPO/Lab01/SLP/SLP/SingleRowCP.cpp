#include <iostream>

#include "SingleRowCP.h"

using namespace std;

char SingleRowCommentParser::letterClasses[256];

// internal actions of parser
void SingleRowCommentParser::error(char c)
{
//	printf("error!\n");
	state = 0;
	delete[] token;
	tokenIndex = 0;
}

void SingleRowCommentParser::skipDividers(char c)
{
}

void SingleRowCommentParser::commentBegin(char c)
{
//	printf("comment begin\n");
	token[tokenIndex++] = c;
	state = 2;
}

void SingleRowCommentParser::readComment(char c)
{
//	printf("reading\n");
	token[tokenIndex++] = c;
}

void SingleRowCommentParser::commentEnd(char c)
{
//	printf("End of comment\n");
	token[tokenIndex++] = 0;
	state = 1;
	goMore = false;
}

void SingleRowCommentParser::fromError(char c)
{
	state = 1; 
	goMore = false;
}

void SingleRowCommentParser::errorCycle(char c)
{
}

// initialization
void SingleRowCommentParser::letterClassesInit()
{
	for (int i = 0; i < 256; i++)
		letterClasses[i] = 0; // all symbols
	letterClasses['#'] = 1; // begin of comment
	letterClasses['\n'] = 2; // end of comment // after debug need to change onto '\n'
	letterClasses[' '] = 3; // place
}

void SingleRowCommentParser::functionsInit()
{
	actions[0] = &SingleRowCommentParser::error;
	actions[1] = &SingleRowCommentParser::skipDividers;
	actions[2] = &SingleRowCommentParser::commentBegin;
	actions[3] = &SingleRowCommentParser::readComment;
	actions[4] = &SingleRowCommentParser::commentEnd;
	actions[5] = &SingleRowCommentParser::fromError;
	actions[6] = &SingleRowCommentParser::errorCycle;
	rules[0][0] = 6; rules[0][1] = 6; rules[0][2] = 5; rules[0][3] = 5;
	rules[1][0] = 0; rules[1][1] = 2; rules[1][2] = 1; rules[1][3] = 0;
	rules[2][0] = 3; rules[2][1] = 3; rules[2][2] = 4; rules[2][3] = 3;
	state = 1;
}

void SingleRowCommentParser::initialize()
{
	letterClassesInit();
	functionsInit();
}

char* SingleRowCommentParser::getToken(char *buf, int bufLen, FILE *src, int &pos)
{
	cout << " parsing single row comment\n";
	// init parser
	state = 1;
	goMore = true;
	token = new char[250];
	tokenIndex = 0;
	// working cycle
	char c;
	for (; (pos < bufLen) && goMore; pos++)
	{
//		printf(buf);
		c = buf[pos];
		(this->*actions[rules[state][letterClasses[c]]])(c);
	}
	if (goMore) 
	{
		pos = 0;
		delete[] buf;
		buf = NULL;
		bufLen = 0;
		// continue cycle
		while (goMore && ((c = (char)getc(src)) != EOF))
		{
			(this->*actions[rules[state][letterClasses[c]]])(c);
		}
	}
	if (token != NULL) 
		token[tokenIndex++] = 0;
	// return result
	return token;
}