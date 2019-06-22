package edu.editor.algorithm.parser.operand;

public class DoubleArg extends IntArg{
 
	private static final long serialVersionUID = 2942133264323141019L;
	public DoubleArg (Operand op){
		//Double.parseDouble(op.getValue());
		setValue(op.getValue());
		/*if (getValue().charAt(0)=='.'){
			setValue('0'+getValue());
		}*/
	}
	
	public DoubleArg (double val){
		setValue(Double.toString(val));
	}
	public double getDoubleValue(){
		return Double.parseDouble(getValue());
	}
	
	public int getIntValue(){
		return (int)Double.parseDouble(getValue());
	}
}
