#include <stdio.h>
#include <iostream>
using namespace std;

#include "ValueParser.h"

char ValueParser::letterClasses[256];

// initialization
void ValueParser::letterClassesInit()
{
	for (int i = 0; i < 256; i++)
		letterClasses[i] = 0;
	letterClasses[';'] = 1;
	letterClasses['/'] = 2;
	letterClasses['"'] = 3;
	letterClasses['n'] = 4;
	letterClasses['t'] = 4;
	letterClasses[39] = 4;
	letterClasses[44] = 4;
	letterClasses[96] = 4;
}

void ValueParser::functionsInit()
{
	actions[0] = &ValueParser::error;
	actions[1] = &ValueParser::errorCycle;
	actions[2] = &ValueParser::fromError;
	actions[3] = &ValueParser::readCycle;
	actions[4] = &ValueParser::stringFound;
	actions[5] = &ValueParser::readString;
	actions[6] = &ValueParser::slashFound;
	actions[7] = &ValueParser::serviceChar;
	actions[8] = &ValueParser::endString;
	actions[9] = &ValueParser::endValue;
	rules[0][0] = 1; rules[0][1] = 2; rules[0][2] = 1; rules[0][3] = 1; rules[0][4] = 1;
	rules[1][0] = 3; rules[1][1] = 9; rules[1][2] = 3; rules[1][3] = 4; rules[1][4] = 3;
	rules[2][0] = 5; rules[2][1] = 0; rules[2][2] = 6; rules[2][3] = 8; rules[2][4] = 5;
	rules[3][0] = 0; rules[3][1] = 0; rules[3][2] = 7; rules[3][3] = 7; rules[3][4] = 7;
}

void ValueParser::initialize()
{
	letterClassesInit();
	functionsInit();
}

// parser actions
void ValueParser::error(char c)
{
	delete[] token;
	tokenIndex = 0;
	state = 0;
}

void ValueParser::errorCycle(char c)
{
}

void ValueParser::fromError(char c)
{
	state = 1;
	goMore = false;
}

void ValueParser::readCycle(char c)
{
	token[tokenIndex++] = c;
}

void ValueParser::stringFound(char c)
{
	state = 2;
	token[tokenIndex++] = c;
}

void ValueParser::readString(char c)
{
	token[tokenIndex++] = c;
}

void ValueParser::slashFound(char c)
{
	token[tokenIndex++] = c;
	state = 3;
}

void ValueParser::serviceChar(char c)
{
	token[tokenIndex++] = c;
	state = 2;
}

void ValueParser::endString(char c)
{
	token[tokenIndex++] = c;
	state = 1;
}

void ValueParser::endValue(char c)
{
	token[tokenIndex++] = c;
	token[tokenIndex++] = 0;
	goMore = false;
}
// payload
char* ValueParser::getToken(char *&buf, int &bufLen, FILE *src, int &pos)
{
	cout << " parsing value\n";
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
		while (goMore && ((c = (char)getc(src)) != EOF))
		{
			(this->*actions[rules[state][letterClasses[c]]])(c);
		}
	}
	if (token != NULL)
		token[tokenIndex++] = 0;
	if (c != EOF)
	{
		if (buf != NULL)
			pos--;
		else
		{
			buf = new char[1];
			buf[0] = c;
			bufLen = 1;
			pos = 0;
		}
	}
	// return result
	return token;
}