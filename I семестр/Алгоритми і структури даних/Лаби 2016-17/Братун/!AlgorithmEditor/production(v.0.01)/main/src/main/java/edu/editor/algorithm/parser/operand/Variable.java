package edu.editor.algorithm.parser.operand;

public class Variable extends Operand{
	static final long serialVersionUID = -99230081294072944L;
	private String type;
	public String getType(){
		return type;
	}
	public void setType(String type){
		this.type = type;
	}
}
