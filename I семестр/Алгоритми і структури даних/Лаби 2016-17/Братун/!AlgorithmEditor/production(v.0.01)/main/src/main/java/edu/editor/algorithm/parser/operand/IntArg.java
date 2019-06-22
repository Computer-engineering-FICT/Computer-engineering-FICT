package edu.editor.algorithm.parser.operand;

public class IntArg extends Operand{

	private static final long serialVersionUID = -4327945298091493893L;
	public IntArg (Operand op){
		setValue(op.getValue());
	}
	
	public IntArg (int val){
		setValue (Integer.toString(val));
	}
	
	public IntArg(){
		
	}
	public int getIntValue(){
		return Integer.parseInt(getValue());
	}
	public double getDoubleValue(){
		return Double.parseDouble(getValue());
	}
	
}
