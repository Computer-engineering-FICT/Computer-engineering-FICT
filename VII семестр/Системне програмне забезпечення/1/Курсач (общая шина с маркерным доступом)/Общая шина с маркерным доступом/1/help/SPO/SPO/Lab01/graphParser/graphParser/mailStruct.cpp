#include "mailStruct.h"
using namespace std;

void MailStruct::addChar(char c)
{
	container[charIndex] = c;
	charIndex++;
}

void mailParser::getFile(FILE *fsrc)
{
	src = fsrc;
}

//automat actions
void mailParser::toErr(char &c)
{
	state = 0;
	if (token!=NULL)
		delete token;
	token = NULL;
}

void mailParser::fromErr(char &c)
{
	state = 5;
	going = false;
}

void mailParser::borderCycle(char &c)
{
}

void mailParser::toName(char &c)
{
	state = 1;
	token = new MailStruct();
	token->addChar(c);
	token->name = 1;
}

void mailParser::nameCycle(char &c)
{
	token->name++;
	token->addChar(c);
}

void mailParser::toNameDef(char &c)
{
	token->name++;
	token->addChar(c);
	state = 6;
}

void mailParser::fromNameDef(char &c)
{
	token->name++;
	token->addChar(c);
	state = 1;
}

void mailParser::endName(char &c)
{
	state = 2;
	token->addChar(c);
}

void mailParser::toSubdomain(char &c)
{
	subDomain* sd = new subDomain();
	sd->next = token->subdmns;
	token->subdmns = sd;
	sd->first = token->charIndex;
	sd->size = 1;
	state = 3;
	token->addChar(c);
	token->dmns++;
}

void mailParser::toSubdomainDef(char &c)
{
	state = 7;
	token->addChar(c);
	token->subdmns->size++;
	//token->
}

void mailParser::fromSubdomainDef(char &c)
{
	state = 3;
	token->addChar(c);
	token->subdmns->size++;
}

void mailParser::toDot(char &c)
{
	state = 4;
	token->addChar(c);
}

void mailParser::fromDot(char &c)
{
	subDomain* sd = new subDomain();
	sd->next = token->subdmns;
	token->subdmns = sd;
	sd->first = token->charIndex;
	sd->size = 1;
	state = 3;
	token->addChar(c);
	token->dmns++;
}

void mailParser::subdomainCycle(char &c)
{
	token->addChar(c);
	token->subdmns->size++;
}

void mailParser::endToken(char &c)
{
	going = false;
	if (state != NULL)
		token->addChar('\0');
	state = 5;
}

void mailParser::errCycle(char &c)
{
	//token->addChar(c);
}

//service functions
void mailParser::initClasses()
{
	//prepare classes array
	for (int i = 0; i < 256; i++)
		classes[i] = 0;
	// mark digits and letters as 1
	for (int i = 48; i < 58; i++)
		classes[i] = 1;
	for (int i = 65; i < 91; i++)
		classes[i] = 1;
	for (int i = 97; i < 123; i++)
		classes[i] = 1;
	// mark "@" as 2
	classes[64] = 2;
	// mark "-" as 3
	classes[45] = 3;
	// mark "." as 4
	classes[46] = 4;
	// mark dividing symbols as 5
	for (int i = 0; i < 33; i++)
		classes[i] = 5;
}

void mailParser::initAutomat()
{
	// init actions
	actions[0] = &mailParser::toErr;
	actions[1] = &mailParser::fromErr;
	actions[2] = &mailParser::borderCycle;
	actions[3] = &mailParser::toName;
	actions[4] = &mailParser::nameCycle;
	actions[5] = &mailParser::toNameDef;
	actions[6] = &mailParser::fromNameDef;
	actions[7] = &mailParser::endName;
	actions[8] = &mailParser::toSubdomain;;
	actions[9] = &mailParser::toSubdomainDef;
	actions[10] = &mailParser::fromSubdomainDef;
	actions[11] = &mailParser::toDot;
	actions[12] = &mailParser::fromDot;
	actions[13] = &mailParser::subdomainCycle;
	actions[14] = &mailParser::endToken;
	actions[15] = &mailParser::errCycle;
	// init positions of automat
	for (int i = 0; i < 8; i++)
		for (int j = 0; j < 6; j++)
			automat[i][j] = 0;
	for (int i = 0; i < 5; i++)
		automat[0][i] = 15;
	automat[0][5] = 1;
	automat[1][1] = 4; automat[1][2] = 7; automat[1][3] = 5;
	automat[2][1] = 8;
	automat[3][1] = 13; automat[3][3] = 9; automat[3][4] = 11; automat[3][5] = 14;
	automat[4][1] = 12;
	automat[5][1] = 3; automat[5][5] = 2;
	automat[6][1] = 6;
	automat[7][1] = 10;
}

void mailParser::parserInit()
{
	initClasses();
	state = 5;
	going = false;
	initAutomat();
	token = NULL;
}

MailStruct* mailParser::getNextMail(int& currBufferLength, char*& buffer)
{
	going = true;
	char buf;
	bool managed = false;
	for(int i = 0; i < currBufferLength; i++)
	{
		buf = buffer[i];
		if (going && !managed) 
		{
			(this->*actions[automat [state] [classes [buf]]])(buf);
		}
		else if(!managed)
		{
			int diff = currBufferLength - i;
			char* newBuffer = new char[currBufferLength - i];
			for (int j = 0; j < diff; j++)
				newBuffer[j] = buffer[i + j];
			delete[] buffer;
			currBufferLength = diff;
			buffer = newBuffer;
		}
	}
	while (going && ((buf = (char)getc(src)) != EOF))
	{
		(this->*actions[automat [state] [classes [buf]]])(buf);
	}
	return token;
}

void MailStruct::output()
{
	// let it output itself
	cout << "Mail token: \n";
	cout << "name of box: ";
	for (int i = 0; i < name; i++)
		cout << container[i];
	cout << "\n Subdomains: ";
	subDomain* tmp = NULL;
	for (int i = dmns-1; i >= 0; i--)
	{
		tmp = subdmns;
		for (int j = 0; j < i; j++)
			tmp = tmp->next;
		for (int k = tmp->first; k < (tmp->first + tmp->size); k++)
			cout << container[k];
		cout << " ";
	}
	cout << "\n";
}