#include "MultiRowCP.h"
#include <iostream>
using namespace std;

char MultiRowCommentParser::letterClasses[256];

// actions of parser
void MultiRowCommentParser::error(char c)
{
	delete[] token;
	tokenIndex = 0;
	state = 0;
}

void MultiRowCommentParser::errorCycle(char c)
{
}

void MultiRowCommentParser::fromError(char c)
{
	goMore = false;
	state = 1;
}

void MultiRowCommentParser::skipDividers(char c)
{
}

void MultiRowCommentParser::slashBeginGet(char c)
{
	state = 2;
	token[tokenIndex++] = c;
}

void MultiRowCommentParser::commentBegin(char c) 
{
	state = 3;
	token[tokenIndex++] = c;
}

void MultiRowCommentParser::readComment(char c)
{
	token[tokenIndex++] = c;
}

void MultiRowCommentParser::starFound(char c)
{
	state = 4;
	token[tokenIndex++] = c;
}

void MultiRowCommentParser::notEnd(char c)
{
	state = 3;
	token[tokenIndex++] = c;
}

void MultiRowCommentParser::commentEnd(char c)
{
	state = 1;
	token[tokenIndex++] = c;
	goMore = false;
}

// initialization
void MultiRowCommentParser::letterClassesInit()
{
	for (int i = 0; i < 256; i++)
		letterClasses[i] = 0;
	letterClasses[' '] = 1;
	letterClasses['\n'] = 1;
	letterClasses['/'] = 2;
	letterClasses['*'] = 3;
}

void MultiRowCommentParser::functionsInit()
{
	actions[0] = &MultiRowCommentParser::error;
	actions[1] = &MultiRowCommentParser::errorCycle;
	actions[2] = &MultiRowCommentParser::fromError;
	actions[3] = &MultiRowCommentParser::skipDividers;
	actions[4] = &MultiRowCommentParser::slashBeginGet;
	actions[5] = &MultiRowCommentParser::commentBegin;
	actions[6] = &MultiRowCommentParser::readComment;
	actions[7] = &MultiRowCommentParser::starFound;
	actions[8] = &MultiRowCommentParser::notEnd;
	actions[9] = &MultiRowCommentParser::commentEnd;
	rules[0][0] = 1; rules[0][1] = 2; rules[0][2] = 1; rules[0][3] = 1;
	rules[1][0] = 0; rules[1][1] = 3; rules[1][2] = 4; rules[1][3] = 0;
	rules[2][0] = 0; rules[2][1] = 0; rules[2][2] = 0; rules[2][3] = 5;
	rules[3][0] = 6; rules[3][1] = 6; rules[3][2] = 6; rules[3][3] = 7;
	rules[4][0] = 8; rules[4][1] = 8; rules[4][2] = 9; rules[4][3] = 8;
}

void MultiRowCommentParser::initialize()
{
	letterClassesInit();
	functionsInit();
}

// payload
char* MultiRowCommentParser::getToken(char *buf, int bufLen, FILE *src, int &pos)
{
	cout << " parsing multirow comment\n";
	// init parser
	state = 1;
	goMore = true;
	token = new char[250];
	tokenIndex = 0;
	// working cycle
	char c;
	for (; (pos < bufLen) && goMore; pos++)
	{
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
		while (goMore)
		{
			cin >> c;
			(this->*actions[rules[state][letterClasses[c]]])(c);
		}
	}
	if (token != NULL)
		token[tokenIndex++] = 0;
	// return result
	return token;
}
