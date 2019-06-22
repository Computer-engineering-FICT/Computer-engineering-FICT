#include "MainParser.h"

char MainParser::letterClasses[256];
int MainParser::rules[7][10];

//initialization
void MainParser::letterClassesInit()
{
	obuf = NULL;
	obufLen = new int;
	osrc = new FILE*;
	opos = new int;
	for (int i = 0; i < 256; i++)
		letterClasses[i] = 0;
	for (int i = 48; i < 58; i++)
		letterClasses[i] = 1;
	for (int i = 65; i < 91; i++)
		letterClasses[i] = 1;
	for (int i = 97; i < 123; i++)
		letterClasses[i] = 1;
	letterClasses[' '] = 2;
	letterClasses['\n'] = 2;
	letterClasses['#'] = 3;
	letterClasses['*'] = 4;
	letterClasses['/'] = 5;
	letterClasses['='] = 6;
	letterClasses[';'] = 7;
	letterClasses['{'] = 8;
	letterClasses['}'] = 9;
}

void MainParser::functionsInit()
{
	actions[0] = &MainParser::error;
	actions[1] = &MainParser::errorCycle;
	actions[2] = &MainParser::fromError;
	actions[3] = &MainParser::skipDividers;
	actions[4] = &MainParser::singleRowComment;
	actions[5] = &MainParser::slashFound;
	actions[6] = &MainParser::multiRowComment;
	actions[7] = &MainParser::nameFound;
	actions[8] = &MainParser::equalFound;
	actions[9] = &MainParser::endValue;
	actions[10] = &MainParser::parametrFound;
	actions[11] = &MainParser::subSection;
	actions[12] = &MainParser::ruleLower;
	actions[13] = &MainParser::endSection;
	rules[0][0] = 1; rules[0][1] = 1; rules[0][2] = 2; rules[0][3] = 4; rules[0][4] = 1;
	rules[0][5] = 5; rules[0][6] = 1; rules[0][7] = 1; rules[0][8] = 1; rules[0][9] = 13;
	rules[1][0] = 0; rules[1][1] = 7; rules[1][2] = 3; rules[1][3] = 4; rules[1][4] = 0;
	rules[1][5] = 5; rules[1][6] = 0; rules[1][7] = 0; rules[1][8] = 1; rules[1][9] = 13;
	rules[2][0] = 0; rules[2][1] = 0; rules[2][2] = 0; rules[2][3] = 0; rules[2][4] = 6;
	rules[2][5] = 0; rules[2][6] = 0; rules[2][7] = 0; rules[2][8] = 0; rules[2][9] = 0;
	rules[3][0] = 0; rules[3][1] = 10; rules[3][2] = 3; rules[3][3] = 4; rules[3][4] = 0;
	rules[3][5] = 5; rules[3][6] = 8; rules[3][7] = 0; rules[3][8] = 11; rules[3][9] = 0;
	rules[4][0] = 0; rules[4][1] = 0; rules[4][2] = 0; rules[4][3] = 0; rules[4][4] = 0;
	rules[4][5] = 0; rules[4][6] = 0; rules[4][7] = 9; rules[4][8] = 0; rules[4][9] = 13;
	rules[5][0] = 0; rules[5][1] = 0; rules[5][2] = 3; rules[5][3] = 4; rules[5][4] = 0;
	rules[5][5] = 5; rules[5][6] = 0; rules[5][7] = 0; rules[5][8] = 11; rules[5][9] = 0;
	rules[6][0] = 12; rules[6][1] = 12; rules[6][2] = 12; rules[6][3] = 12; rules[6][4] = 12;
	rules[6][5] = 12; rules[6][6] = 12; rules[6][7] = 12; rules[6][8] = 12; rules[6][9] = 13;
	subParser = NULL;
	mrcp = MultiRowCommentParser();
	mrcp.initialize();
	np = NameParser();
	np.initialize();
	srcp = SingleRowCommentParser();
	srcp.initialize();
	vp = ValueParser();
	vp.initialize();
}

void MainParser::initialize()
{
	letterClassesInit();
	functionsInit();
}

// parser actions
void MainParser::error(char c)
{
	delete[] token;
	tokenIndex = 0;
	state = 0;
}

void MainParser::errorCycle(char c)
{
}

void MainParser::fromError(char c)
{
	state = 1; 
	goMore = false;
}

void MainParser::skipDividers(char c)
{
}

void MainParser::singleRowComment(char c)
{
	delete[] token;
	if (obuf != NULL)
		*opos = *opos - 1;
	else 
	{
		obuf = new char[1];
		obuf[0] = '#';
		*obufLen = 1;
		*opos = 0;
	}
//	printf(obuf);
	token = srcp.getToken(obuf, *obufLen, *osrc, *opos);
	tokenIndex = strlen(token);
	goMore = false;
}

void MainParser::slashFound(char c)
{
	state = 2;
	token[tokenIndex++] = c;
}

void MainParser::multiRowComment(char c)
{
	delete[] token;
	if (*opos > 1)
		*opos = *opos - 2;
	else 
	{
		obuf = new char[2];
		obuf[0] = '/';
		obuf[1] = '*';
		*obufLen = 2;
		*opos = 0;
	}
	token = mrcp.getToken(obuf, *obufLen, *osrc, *opos);
	tokenIndex = strlen(token);
	goMore = false;
}

void MainParser::nameFound(char c)
{
	delete[] token;
	if (obuf != NULL)
		*opos = *opos - 1;
	else 
	{
		obuf = new char[1];
		obuf[0] = c;
		*obufLen = 1;
		*opos = 0;
	}
	token = np.getToken(obuf, *obufLen, *osrc, *opos);
	tokenIndex = strlen(token);
	goMore = false;
	state = 3;
}

void MainParser::equalFound(char c)
{
	delete[] token;
	token = vp.getToken (obuf, *obufLen, *osrc, *opos);
	printf(token);
	tokenIndex = strlen(token);
	goMore = false;
	state = 4;
}

void MainParser::endValue(char c)
{
	state = 1;
}

void MainParser::parametrFound(char c)
{
	if (*obuf != NULL)
		*opos = *opos - 1;
	else 
	{
		obuf = new char[1];
		obuf[0] = c;
		*obufLen = 1;
		*opos = 0;
	}
	delete[] token;
	token = vp.getToken (obuf, *obufLen, *osrc, *opos);
	tokenIndex = strlen(token);
	goMore = false;
	state = 5;
}

void MainParser::subSection(char c)
{
	if (subParser == NULL)
	{
		subParser = new MainParser();
		subParser->functionsInit();
	}
	else 
		subParser->subSection(c);
	state = 6;
}

void MainParser::ruleLower(char c)
{
	if (*obuf != NULL)
		*opos = *opos - 1;
	else 
	{
		obuf = new char[1];
		obuf[0] = c;
		*obufLen = 1;
		*opos = 0;
	}
	delete[] token;
	MainParser *t = new MainParser();
	while (t->subParser != NULL)
		t = t->subParser;
	token = t->getToken (obuf, *obufLen, *osrc, *opos);
	tokenIndex = strlen(token);
	goMore = false;
}

void MainParser::endSection(char c)
{
	if ((subParser != NULL) && (subParser->subParser == NULL))
	{
		delete subParser;
		subParser = NULL;
	}
	else 
		if (subParser != NULL)
			subParser->endSection(c);
}

char* MainParser::getToken(char *buf, int &bufLen, FILE *src, int &pos)
{
	cout << "Global dj's parsing... \n";
	// init parser
	state = 1;
	goMore = true;
	token = new char[250];
	tokenIndex = 0;
	// copy context
	obuf = buf;
	*obufLen = bufLen;
	*osrc = src;
	*opos = pos;
	// working cycle
	char c;
	for (; ((buf != NULL) && (pos < bufLen) && goMore); pos++)
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
	// return result
	return token;
}