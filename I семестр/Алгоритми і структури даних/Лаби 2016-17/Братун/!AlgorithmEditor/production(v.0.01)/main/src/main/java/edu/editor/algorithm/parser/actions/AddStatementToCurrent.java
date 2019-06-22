package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.StatementParser;
import edu.editor.algorithm.parser.Thinker;
import edu.editor.algorithm.parser.operand.Statement;

public class AddStatementToCurrent implements Action{

	public void doSmth(char c, Thinker thinker) {
		char[] ca = new char[1];
		ca[0]=c;
		String val = new String(ca);
		Statement stat = new Statement(thinker.getCurrent(),val);
		Statement tmp = ((StatementParser)thinker).getStatementBeforeCurrent();
		if (tmp!=null){
			tmp.setRight(stat);
		}else{
			((StatementParser)thinker).setFirst(stat);
		}
		thinker.setCurrentManually(stat.getRight());
	}

}
