package edu.editor.algorithm.parser.operand;

public class OperandWrapper {
	public Operand operand;
	public String str;
	public int position;
	
	public OperandWrapper (Operand op, String s, int pos){
		operand = op;
		str = s;
		position = pos;
	}
	
	public OperandWrapper(String s){
		str = s;
		operand = new Operand();
		position = 0;
	}
}
