#include "synan.h"
#include "token.h"
#include <stdio.h>
#include <conio.h>
#include "stdlib.h"

using namespace std;

// ��������� ������������� ��������-����������� ������������ ������� (������������ ��� ������ ������)
char* tokTypeStr [400] = 
{"_nil", "_nam",	//0 ������ �������
 "_srcn",	"_cnst",	//2 ������ � ������� ��������� ���������
 "_if","_then","_else","_elseif",	//4 if then else elseif
 "_case", "_switch", "_default", "_endcase",//8 case switch defualt endcase
 "_break", "_return", "_whileP", "_whileN", //12 break return while do
 "_continue", "_repeat", "_untilN", "_endloop", //16 continue repeat until
 "_for", "_to", "_downto", "_step",// for to downto step 
 "_untilP", "_loop", "_with", "_endif",	
 "_void","_extern","_var","_const","_enum","_struct" ,"_union","_register",//
 "_unsigned","_signed","_char","_short","_int","_long","_sint64","_uint64",//
 "_float","_double", "_label","_auto","_static","_volatile","_typedef","_sizeof",//
 "_real","_array","_set","_file","_object", "_string","_goto",
 "_program","_function","_procedure /*task V*/",
 "_macromodule","_primitive","_specify","_table", //Verilog
 "_generate","_config","_liblist","_library",  //Verilog
 "_incdir","_include","_design","_defaultS","_instance","_cell","_use", //Verilog
 "_automatic","_endmodule","_endfunction","_endtask",   //Verilog
 "_endprimitive","_endspecify","_endtable","_endgenerate","_endconfig",  //Verilog
 "_endcaseV","_casex","_casez","_wait","_forever","_disable","_ifnone", //Verilog
 "_pulsestyle", "_onevent","_pulsestyle", "_ondetect","_showcanceled","_noshowcanceled", //Verilog
 "_vectored","_scalared","_small","_medium","_large", //Verilog
 "_genvar","_parameter","_localparam","_defparam","_specparam","_PATHPULSE$",  //Verilog
 "_inlineF","_forward","_interrupt","_exportF","_extrn","_asmb",
 "_input","_output","_inout",  //Verilog|SQL+3
 "_objectP","_constructor","_desctructor","_property","_resP","_abstract", //P++9
 "_class","_public","_private","_protected","_virtual","_friend", //C++16
 "_new","_delete","_tryC","_catch","_throw/*raise*/", //C++20
 "_initial","_always","_assign","_deassign","_force","_release", //Verilog+26
 "_reg","_time","_realtime","_event","_buf","_not", //Verilog+32
 "_andG","_orG","_xorG","_nandG","_norG","_xnorG",  //Verilog+38
 "_tran","_tranif0","_tranif1","_rtran","_rtranif0","_rtranif1", //Verilog+44
 "_tri","_trior","_triand","_trireg","_tri0","_tri1",//Verilog+50
 "_wire","_wand","_wor","_wres",			//Verilog+54
 "_supply0","_supply1""_highz0","_highz1", //Verilog+58
 "_strong0","_strong1","_pull0","_pull1","_weak0","_weak1",  //Verilog+64
 "_pulldown","_pullup","_bufif0","_bufif1","_notif0","_notif1",  //Verilog+70
 "_cmos","_rcmos","_nmos","_pmos","_rnmos","_rpmos",  //Verilog+76
 "_fork", 	// ������ � ������ ����� ����������� ��������� 2
 "_opbr", "_ocbr",	// ������ � ������ ����� ��������� 2
 "_ctbr",	"_fcbr",	// ������ � ������ ����� ������������ 3 
 "_ixbr", "_scbr",	// ������ � ������ ����� ������� 4
 "_brkt", "_bckt",	// ������ � ������ ����� ������� � ������� 5
 "_tdbr", "_tcbr",	// ������ � ������ ����� ����� 6
 "_eosP", "eosS",	// ��������� �� ��������
 "_EOS=begOprtr", "_comma", "_cln", "_qmrk",// ; ", : ?
 "_asOr", "_asAnd", "_asXor", "_asAdd",		//|= =& =^ =+
 "_asSub", "_asMul", "_asDiv", "_asMod",	// -= *= /= %=
 "_asShr","_asShl", "_ass", "_dcr", "_inr", 	// <<= >>= = -- ++ 
 "_dcrN","_inrN","_mcrs","_dbcln","_eoCm","_EOF", //-- ++ //  #  ::  */ 
 "_lt","_le", "_eq", "_ne", "_ge","_gt",		// < <= == != >= >
 "_add", "_sub", "_mul", "_div", "_fldDt", "_fldPt",// + - * / . ->
 "_pwr", "_shLfa", "_shRga", "_eqB", "_neB",	// ** <<< >>> === !==
 "_addU","_subU","_refU", "_ptrU",		// + - * & �����
 "_lmts","_eqar","_astar","_trasand",	// PV+4 ..  => *> &&&
 "_orR","_andR","_xorR","_norR","_nandR","_nxorR","_xornR", //V+11 & | ^ ~| ~& ~^ 
 "_delay","_eventV","_events",		 //V+14 # @ @*
 "_norB","_nandB","_nxorB","_xornB","_addr", //~| ~& ~^ ^~  "_ptr",
 "_rem","_remL", // ,
 "_mod", "_orB", "_andB", "_xorB",		// %(mod) |(or) &(and) ^(xor) 
 "_shLft","_shRgt", "_or", "_and",	//<<(shl) >>(shr) ||(or) &&(and)    
 "_xmrk","_invB","_divI","_in", //"_not", "_notB", /(div)
 "_posedge","_negedge","_orE",  //Verilog+3
 "_frkz",	// ������ � ������ ����� ����������� ��������� 2
 "_opbz",	// ������ � ������ ����� ��������� 2
 "_ctbz",	// ������ � ������ ����� ������������ 3 
 "_ixbz",	// ������ � ������ ����� ������� 4
 "_brkz",	// ������ � ������ ����� ������� � ������� 5
 "_tdbz"	// ������ � ������ ����� ����� 6
// "_pnil 
};

//��� ����������� ���������� � ��������� ���� (����� ��� ������ ������)
char* synTypeStr [16] = {
	"_prgm", "_block", "_compound_statement", 
	"_if_node", "_if_without_else", "_if_with_else", "_for", 
	"_statement", "_statement_body", 
	"_assignment", 
	"_bool_expression", "_bool_factor", 
	"_expression", "_term", "_signed_factor", "_unsigned_factor"
};

//����������� ��� ������� ���� ������ �������
synNode::synNode() 
{
	this->currentSize = 0;	
};

//����������� ��� ���� ������ ������� ����������� �� �������� � ����� code
synNode::synNode(enum synType code) 
{
	this->ndOp = code;
	this->currentSize = 0;
}

//���������� � ���� "�������"
void synNode::addChild(synNode *child) 
{
	if (child != 0) {
		this->child[currentSize] = child;
		currentSize++;
	};
};

//����� ������ � ��������� ���� (���������� �������� ����� �� ���� �����������)
void synNode::toString(int space) 
{
	for (int i = 0; i < space; i++) {printf(" ");}
	space += 3;
	if (this->ndOp == _terminal) {
		printf("%s\n", tokTypeStr[this->termin->ndOp]);
	} else {
		printf("%s\n", synTypeStr[this->ndOp]);
		for (int i = 0; i < this->currentSize; i++) {this->child[i]->toString(space);};
	};
}

//������� �� ������ ���������� ����������� ������������
//��������� ������:
//  lookNext() - ����������� �� ��������� �������
//  matchNext(elem) - �������� ������� ������� � elem, ���� ��� ���������, �� ������� ������
//  ������� (���������� �� �����), ���� �� �����, �� ������ ������.
class lexData		
{
	public: 
		lexData::lexData(struct lxNode* data);
		enum tokType lookNext();
		struct lxNode* getNext(); 
		bool matchNext(enum tokType elem);
		lxNode* pointer;
		int pos;
};

//������� ����� ����������� �������� (��� ������� ��� ����������� ������
//���������� ����, � ������� �������� ����������� ������)
lexData* thread;

//����������� ������ (pos - ��� �� ������ ���������, pointer )
lexData::lexData(struct lxNode* data) 
{
	pointer = data;
	pos = 0;
};

//"�����������" ��������� ������ (�� �������� � ������ ������)
enum tokType lexData::lookNext() 
{
	return thread->pointer->ndOp;
};

//�������� ��������� ������ ������ � ������: 
// -- ���� ���������, �� ������� true � ������� �� ������ ������
// -- ���� �� ���������, �� ������ ������
bool lexData::matchNext(enum tokType elem) 
{
	bool flag = true;
	if (thread->pointer->ndOp == elem) 
	{
		pos++;
		thread->pointer++;
	} else {
		printf("Error on %d lexem: \n have to be \"%s\" but we have \"%s\"", pos, tokTypeStr[elem], tokTypeStr[thread->pointer->ndOp]);
		flag = false;
		getch();
		getch();
		exit(0);
	}
	return flag;
};

//�������� ��������� ������ �� �������� ������.
struct lxNode* lexData::getNext() 
{
	pos++;
	return this->pointer++;
}; 

//������ ������������ ���� (� ������ ��� ���� ��� �����������)
synNode* trace_Terminal(lxNode* tok) 
{
	synNode* temp = new synNode(_terminal);
	temp->termin = tok;
	return temp;
};

//=#=#=#=#=#=#=#=# ����������� ������������ (������ ����������) =#=#=#=#
// ������� ������������ ������ � ���, ��� ���� � ��� ���� ���������� � ����, 
// � �������, ������-�����, �� �� ����� ��� � ������� ������������ � ���������:
// �� ������ ������� ���������� �� �����������.

//���������� ������� bool_expression      ::= expression
//                        | expression "=" expression
//                        | expression "<>" expression
//                        | expression "<=" expression
//                        | expression ">=" expression
//                        | expression "<" expression
//                        | expression ">" expression
synNode* trace_Bool_Expression() 
{
	synNode* temp = new synNode(_bool_expression);
	temp->addChild(trace_Expression());
	synNode* t;
	switch (thread->lookNext())
	{
		case _eq:
			temp->addChild(trace_Terminal(thread->getNext()));
			t = trace_Expression();
			temp->addChild(t);
			break;
		case _ne:
			temp->addChild(trace_Terminal(thread->getNext()));
			temp->addChild(trace_Expression());
			break;
		case _le:
			temp->addChild(trace_Terminal(thread->getNext()));
			temp->addChild(trace_Expression());
			break;
		case _ge:
			temp->addChild(trace_Terminal(thread->getNext()));
			temp->addChild(trace_Expression());
			break;
		case _lt:
			temp->addChild(trace_Terminal(thread->getNext()));
			temp->addChild(trace_Expression());
			break;
		case _gt:
			temp->addChild(trace_Terminal(thread->getNext()));
			temp->addChild(trace_Expression());
			break;
	};
	return temp;
}

//���������� ������� unsigned_factor      ::= "(" expression ")"
//                        | NUMBER
//                        | IDENTIFIER
synNode* trace_Unsigned_Factor() 
{
	synNode* temp = new synNode(_unsigned_factor);
	switch (thread->lookNext()) 
	{
		case _brkt:
			thread->matchNext(_brkt);
			temp->addChild(trace_Bool_Expression());
			thread->matchNext(_bckt);
			break;
		case _srcn:
			temp->addChild(trace_Terminal(thread->getNext()));
			break;
		case _nam:
			temp->addChild(trace_Terminal(thread->getNext()));
			break;

	};
	return temp;
};

//���������� ������� signed_factor        ::= unsigned_factor
//                        | "-" unsigned_factor
synNode* trace_Signed_Factor() 
{
	synNode* temp = new synNode(_signed_factor);
	if (thread->lookNext() == _sub) 
	{
		temp->addChild(trace_Terminal(thread->getNext()));
	}
	temp->addChild(trace_Unsigned_Factor());
	return temp;
};

//��������� ���������� NUMBER ::= [0-9]+
//					   IDENTIFIER ::= [a-zA-Z_][a-zA-Z0-9_]*
synNode* trace_Term() 
{
	synNode* temp = new synNode(_term);
	temp->addChild(trace_Signed_Factor());
	switch (thread->lookNext())
	{
		case _mul:
			temp->addChild(trace_Terminal(thread->getNext()));
			temp->addChild(trace_Expression());
			break;
		case _div:
			temp->addChild(trace_Terminal(thread->getNext()));
			temp->addChild(trace_Expression());
			break;	
	}
	return temp;
};

//���������� ������� expression           ::= term
//                        | term "+" expression
//                        | term "-" expression
synNode* trace_Expression() 
{
	synNode* temp = new synNode(_expression);
	temp->addChild(trace_Term());
	switch (thread->lookNext())
	{
		case _add:
			temp->addChild(trace_Terminal(thread->getNext()));
			temp->addChild(trace_Expression());
			break;
		case _sub:
			temp->addChild(trace_Terminal(thread->getNext()));
			temp->addChild(trace_Expression());
			break;	
	}
	return temp;
}

//���������� ������� if::= if_with_else | if_without_else
//if_without_else      ::= "if" bool_expression "then" block ";"
//if_with_else         ::= "if" bool_expression block "else" block ";"
synNode* trace_If() 
{
	thread->matchNext(_if);
	synNode* temp = new synNode(_if_node);
	if (thread->lookNext() == _brkt) {
		thread->matchNext(_brkt);
		temp->addChild(trace_Bool_Expression());
		thread->matchNext(_bckt);
	}
	else {
		temp->addChild(trace_Bool_Expression());
	}
    thread->matchNext(_then);
	temp->addChild(trace_Block());
	if (thread->lookNext() == _else) 
	{
		thread->matchNext(_else);
		temp->addChild(trace_Block());
	}
	thread->matchNext(_EOS);
	return temp;
};

//���������� ������� for ::= "for" IDENTIFIER ":=" boolean_expression "to" boolean_expression "do" block ";"
synNode* trace_For() 
{
	thread->matchNext(_for);
	synNode* temp = new synNode(_for_node);
	temp->addChild(trace_Terminal(thread->getNext()));
	thread->matchNext(_ass);
	temp->addChild(trace_Bool_Expression());
	thread->matchNext(_to);
	temp->addChild(trace_Bool_Expression());
	thread->matchNext(_loop);
	temp->addChild(trace_Block());
	thread->matchNext(_EOS);
	return temp;
};

//����������� ���������� �� ��������� ������������ while ��� ���������� Pascal :(
synNode* trace_While() 
{
	return 0;
};

//���������� ������� assignment ::= IDENTIFIER ":=" bool_expression ";"
synNode* trace_Assignment() 
{
	synNode* temp = new synNode(_assignment);
	temp->addChild(trace_Terminal(thread->getNext()));
	thread->matchNext(_cln);
	thread->matchNext(_ass);
	temp->addChild(trace_Bool_Expression());
	return temp;
};

//���������� ������� statement_body ::= assignment | bool_expression
synNode* trace_Statement_Body() 
{
	synNode* temp = new synNode(_statement_body);
	if (thread->lookNext() == _nam) {
		temp->addChild(trace_Assignment());
	} else {
		temp->addChild(trace_Bool_Expression());
	}
	return temp;
};

//���������� ������� statement ::= statement_body ";"
synNode* trace_Statement() 
{
	synNode* temp = new synNode(_statement);
	temp->addChild(trace_Statement_Body());
	thread->matchNext(_EOS);
	return temp;
};

//���������� ������� compound_statement ::= if | for | statement |
synNode* trace_Compound() 
{
	synNode* temp = new synNode(_compound_statement);
	switch (thread->lookNext())
	{
		case _if:
			temp = trace_If();
			break;
		case _for:
			temp = trace_For();
			break;
		case _whileP:
			temp = trace_While();
			break;
		case _opbr:
			temp = trace_Block();
			break;
		default:
			temp = trace_Statement();
			break;
	}
	return temp;	
};

//���������� ������� block ::= "begin" compound_statement "end" | "begin" "end"
synNode* trace_Block() 
{
	thread->matchNext(_opbr); //opbr = begin

	synNode* temp = new synNode(_block);

	if (thread->lookNext() == _ocbr) {
		thread->matchNext(_ocbr); //ocbr = end
		thread->matchNext(_EOS);
	}
	else {
		while (thread->lookNext() != _ocbr) {
			temp->addChild(trace_Compound());
		}
		thread->matchNext(_ocbr); //ocbr = end
	}
	return temp;
};

//���������� ������� program ::= block "."
synNode* trace_Program() 
{	
	synNode* temp = new synNode(_prgm);
	temp->addChild(trace_Block());
	thread->matchNext(_fldDt);
	return temp;
}

//������ ��������������� �������
synNode* synAnalysis(struct lxNode* nodes) 
{
	thread = new lexData(nodes);
	return trace_Program();
}