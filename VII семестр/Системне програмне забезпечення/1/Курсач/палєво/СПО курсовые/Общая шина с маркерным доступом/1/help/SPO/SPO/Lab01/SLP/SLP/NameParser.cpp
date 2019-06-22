#include "NameParser.h"

char NameParser::letterClasses[256];

//parser actions
void NameParser::error(char c)
{
	state = 0;
	delete[] token;
	tokenIndex = 0;
}

void NameParser::errorCycle(char c)
{
}

void NameParser::fromError(char c)
{
	state = 1;
	goMore = false;
}

void NameParser::skipDividers(char c)
{
}

void NameParser::getFirst(char c)
{
	state = 2;
	token[tokenIndex++] = c;
}

void NameParser::readCycle(char c)
{
	token[tokenIndex++] = c;
}

void NameParser::endName(char c)
{
	goMore = false;
}

//initialization
void NameParser::letterClassesInit()
{
	for (int i = 0; i < 256; i++)
		letterClasses[i] = 0;
	// mark digits as 2 and letters as 1
	for (int i = 48; i < 58; i++)
		letterClasses[i] = 2;
	letterClasses['_'] = 2;
	for (int i = 65; i < 91; i++)
		letterClasses[i] = 1;
	for (int i = 97; i < 123; i++)
		letterClasses[i] = 1;
	letterClasses[' '] = 3;
	letterClasses['\n'] = 3;
	letterClasses['/'] = 4;
	letterClasses['='] = 4;
	letterClasses['{'] = 4;
}

void NameParser::functionsInit()
{
	actions[0] = &NameParser::error;
	actions[1] = &NameParser::errorCycle;
	actions[2] = &NameParser::fromError;
	actions[3] = &NameParser::skipDividers;
	actions[4] = &NameParser::getFirst;
	actions[5] = &NameParser::readCycle;
	actions[6] = &NameParser::endName;
	rules[0][0] = 1; rules[0][1] = 1; rules[0][2] = 1; rules[0][3] = 2; rules[0][4] = 1;
	rules[1][0] = 0; rules[1][1] = 4; rules[1][2] = 0; rules[1][3] = 3; rules[1][4] = 0;
	rules[2][0] = 0; rules[2][1] = 5; rules[2][2] = 5; rules[2][3] = 6; rules[2][4] = 6;
}

void NameParser::initialize()
{
	letterClassesInit();
	functionsInit();
}

//payload
char* NameParser::getToken(char *&buf, int &bufLen, FILE *src, int &pos)
{
	cout << " parsing name\n";
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