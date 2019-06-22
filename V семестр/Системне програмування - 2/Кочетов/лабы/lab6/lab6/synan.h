#ifndef SYNAN_H
#define SYNAN_H

enum synType {
	_prgm, _block, _compound_statement, 
	_if_node, _if_without_else, _if_with_else, _for_node, 
	_statement, _statement_body, 
	_assignment, 
	_bool_expression, _bool_factor, 
	_expression, _term, _signed_factor, _unsigned_factor, 
	_terminal
};

class synNode 
{
	public:
		synNode::synNode(enum synType code);
		synNode::synNode();
		void toString(int space);		//метод вывода строкой содерижимого узла
		void addChild(synNode* child);	//добавление наследников
		enum synType ndOp;				//код типа лексемы
		struct lxNode* termin;			//терминальный символ данного узла
		synNode* prvNd;					//предшественник
		synNode* child [100];			//наследники
	private:
		int currentSize;				//количество наследников
};

synNode* synAnalysis(struct lxNode* nodes);
synNode* trace_Statement();
synNode* trace_Bool_Expression();
synNode* trace_If();
synNode* trace_For();
synNode* trace_While();
synNode* trace_Statement();
synNode* trace_Compound();
synNode* trace_Block();
synNode* trace_Program();
synNode* trace_Expression();
synNode* trace_Signed_Factor();
synNode* trace_Term();
synNode* trace_Unsigned_Factor();
synNode* trace_Statement_Body();
synNode* trace_Assignment();

#endif