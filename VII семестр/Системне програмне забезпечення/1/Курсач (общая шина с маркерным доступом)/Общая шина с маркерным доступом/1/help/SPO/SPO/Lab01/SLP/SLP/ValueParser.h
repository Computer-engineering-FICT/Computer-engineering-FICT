#ifndef _VALUE_PARSER
#define _VALUE_PARSER

class ValueParser
{
private:
	static char letterClasses[256];
	// parser actions
	void error(char c);
	void errorCycle(char c);
	void fromError(char c);
	void readCycle(char c);
	void stringFound(char c);
	void readString(char c);
	void slashFound(char c);
	void serviceChar(char c);
	void endString(char c);
	void endValue(char c);
	// initialization
	void letterClassesInit();
	void functionsInit();
	// state information
	bool goMore;
	int rules[4][5];
	char state;
	char* token;
	unsigned int tokenIndex;
	void (ValueParser::*actions[10])(char);
public:
	void initialize();
	char* getToken(char* &buf, int &bufLen, FILE* src, int &pos);
};

#endif //_VALUE_PARSER