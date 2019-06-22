package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.StatementParser;
import edu.editor.algorithm.parser.Thinker;
import edu.editor.algorithm.parser.operand.Statement;

public class ConvertAssignToCheckEquality implements Action{

	public void doSmth(char c, Thinker thinker) throws Exception {
		Statement stat = (Statement) ((StatementParser)thinker).getFirst();
		if (!stat.getValue().equals("=")){
			throw new Exception("There is no assign in statement "+thinker.getString());
		}
		stat.setValue("==");
	}

}
