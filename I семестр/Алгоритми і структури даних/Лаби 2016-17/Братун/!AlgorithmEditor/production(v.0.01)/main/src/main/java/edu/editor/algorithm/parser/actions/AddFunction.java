package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.StatementParser;
import edu.editor.algorithm.parser.Thinker;
import edu.editor.algorithm.parser.operand.Function;
import edu.editor.algorithm.parser.operand.OperandWrapper;
import edu.editor.algorithm.parser.tables.ParseStatement;

public class AddFunction implements Action{
	public void doSmth(char c, Thinker thinker) throws Exception{
		String str = StatementParser.getBracketedExpression(thinker.getString(),thinker.getPosition());
		StatementParser parser = new StatementParser(new ParseStatement(),new OperandWrapper(str),thinker.getModel());
		OperandWrapper ow = parser.parse();
		Function func = new Function(thinker.getCurrent());
		func.setArgument(ow.operand);
		thinker.setCurrent(func);
		thinker.setPosition(thinker.getPosition()+ow.str.length()+1);
		
	}
}
