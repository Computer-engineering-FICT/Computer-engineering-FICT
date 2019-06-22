package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.StatementParser;
import edu.editor.algorithm.parser.Thinker;
import edu.editor.algorithm.parser.operand.Statement;

public class AddStatementToRoot implements Action{

	public void doSmth(char c, Thinker thinker)  {
		char[] ca = new char[1];
		ca[0]=c;
		String val = new String(ca);
		if (((StatementParser)thinker).getFirst() instanceof Statement  &&
				((Statement)((StatementParser)thinker).getFirst()).getValue().equals("=")){
			
			Statement state = new Statement(((Statement)((StatementParser)thinker).getFirst()).getRight(),val);
			((Statement)((StatementParser)thinker).getFirst()).setRight(state);
			thinker.setCurrent(state.getRight());
		}else{
			Statement assign = new Statement(((StatementParser)thinker).getFirst(),val);
			((StatementParser)thinker).setFirst(assign);
			thinker.setCurrentManually(assign.getRight());
		}
	}

}
