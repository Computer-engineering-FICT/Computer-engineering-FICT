package edu.editor.algorithm.language;

import edu.editor.algorithm.parser.operand.Bracket;
import edu.editor.algorithm.parser.operand.Function;
import edu.editor.algorithm.parser.operand.Operand;
import edu.editor.algorithm.parser.operand.Statement;
import edu.editor.algorithm.parser.operand.Text;

public class PascalTranslator implements Translator{

	public String translate(Operand op) {
		String res = op.getValue();
		if (op instanceof Text){
			res.replaceAll("'", "''");
			res.replaceAll("\n", "',#13,'");
			res = "'"+res+"'";
		}
		if (op instanceof Function){
			res+="("+translate(((Function)op).getArgument())+")";
		}
		if (op instanceof Statement){
			res = translate(((Statement)op).getLeft())+convertValue((Statement) op)+
			translate(((Statement)op).getRight());
		}
		
		if (op instanceof Bracket){
			res += "("+translate( ((Bracket)op).getExpression())+")";
		}
		return res;
	}
	
	private String convertValue(Statement stat){
		String value = stat.getValue();
		
		if (value.equals("=")){
			value = " := ";
		}
		
		if (value.equals("==")){
			value = " = ";
		}
		
		if (value.equals("|")){
			value = " or ";
		}
		
		if (value.equals("%")){
			value = " mod ";
		}
		
		/*if (value.equals("/")){
			value = " div ";
		}*/
		return value;
	}

}
