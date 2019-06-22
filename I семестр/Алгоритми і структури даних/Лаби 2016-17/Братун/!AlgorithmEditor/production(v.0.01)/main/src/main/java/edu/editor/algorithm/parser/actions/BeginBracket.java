package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.StatementParser;
import edu.editor.algorithm.parser.Thinker;
import edu.editor.algorithm.parser.operand.Bracket;
import edu.editor.algorithm.parser.operand.OperandWrapper;
import edu.editor.algorithm.parser.tables.ParseStatement;

public class BeginBracket implements Action
{

	public void doSmth(char c, Thinker thinker) throws Exception {
		// TODO Auto-generated method stub
		String str = StatementParser.getBracketedExpression(thinker.getString(), thinker.getPosition());
		OperandWrapper ow = new OperandWrapper(new Bracket(), str, 0);
		StatementParser brth = new StatementParser(new ParseStatement(),ow);
		ow = brth.parse();
		if (ow==null){
			System.out.println("Parsed string: "+str);
			//System.out.println("Parsed symbol: "+str.charAt(ow.position)+" at "+ow.position);
			throw new Exception ("Empty brackets not allowed");
		}
		ow.operand = new Bracket(ow.operand);
		thinker.setCurrent(ow.operand);
		thinker.setPosition(thinker.getPosition()+str.length()+1);  ///// Maybe, 1?
		
	}

}
