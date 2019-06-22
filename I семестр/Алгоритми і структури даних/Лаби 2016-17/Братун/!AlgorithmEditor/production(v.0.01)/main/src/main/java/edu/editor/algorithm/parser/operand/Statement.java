package edu.editor.algorithm.parser.operand;

public class Statement extends Operand{

	private static final long serialVersionUID = -9011827760679411730L;
	private Operand left;
	private Operand right;
	public Operand getLeft(){
		return left;
	}
	public Operand getRight(){
		return right;
	}
	public void setLeft (Operand op){
		left = op;
	}
	public void setRight (Operand op){
		right = op;
	}
	
	public Statement (String value){
		setValue(value);
		left = new Operand();
		right = new Operand();
	}
	
	public Statement (Operand left, String value){
		this.left = left;
		right = new Operand();
		setValue(value);
	}
	
	public void testPrint(){
		/*if (getValue().equals("+") || getValue().equals("-")){
			System.out.print("(");
			left.testPrint();
			System.out.print(" "+ getValue()+" ");
			right.testPrint();
			System.out.print(")");
		}else{*/
		if (/*getValue().equals("*") ||*/ getValue().equals("/")){
			if(left instanceof Statement){
				System.out.print("(");
				left.testPrint();
				System.out.print(")");
			}else{
				left.testPrint();
			}
			System.out.print(" "+getValue()+" ");
			if (right instanceof Statement){
				System.out.print("(");
				right.testPrint();
				System.out.print(")");
			}else{
				right.testPrint();
			}
			
		}else{
			left.testPrint();
			System.out.print(" "+ getValue()+" ");
			right.testPrint();
		}
	}
	
	
}
