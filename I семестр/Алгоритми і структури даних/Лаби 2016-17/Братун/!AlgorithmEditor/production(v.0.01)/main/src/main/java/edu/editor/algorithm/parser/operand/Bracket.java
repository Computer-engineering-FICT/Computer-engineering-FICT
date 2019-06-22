package edu.editor.algorithm.parser.operand;
/**
 * Скобка
 * @author Саша
 *
 */
public class Bracket extends Operand{

	private static final long serialVersionUID = -3435749326127304333L;
	private Operand expression;
	public Operand getExpression (){
		return expression;
	}
	public void setExpression (Operand op){
		expression = op;
	}
	public Bracket (Operand op){
		expression = op;
	}
	public Bracket() {
		
	}
    public void testPrint(){
    	System.out.print("(");
    	expression.testPrint();
    	System.out.print(")");
    }
}
