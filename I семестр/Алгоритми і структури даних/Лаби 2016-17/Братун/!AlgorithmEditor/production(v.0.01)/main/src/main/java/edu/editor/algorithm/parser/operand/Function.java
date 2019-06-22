package edu.editor.algorithm.parser.operand;

public class Function extends Operand{

	private static final long serialVersionUID = -7001466895368661765L;
	private Operand argument;
	public Operand getArgument(){
		return argument;
	}
	public void setArgument(Operand arg){
		argument = arg;
	}
	public Function (Operand arg){
		setValue(arg.getValue());
	}
	public void testPrint(){
		System.out.print(" "+getValue()+"(");
		argument.testPrint();
		System.out.print(")");
	}
	/*public String getPascalCode(){
		String res = getValue()+"("+argument.getPascalCode()+")";
		return res;
	}*/
}
