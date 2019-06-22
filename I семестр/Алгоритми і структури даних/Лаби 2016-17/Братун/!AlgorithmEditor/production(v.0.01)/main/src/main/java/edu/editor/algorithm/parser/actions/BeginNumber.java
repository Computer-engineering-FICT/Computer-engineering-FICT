package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.Thinker;
import edu.editor.algorithm.parser.operand.IntArg;
import edu.editor.algorithm.parser.operand.OperandWrapper;
import edu.editor.algorithm.parser.tables.ParseNumber;

public class BeginNumber implements Action{

	public void doSmth(char c, Thinker thinker) throws Exception {
		OperandWrapper ow = new OperandWrapper(new IntArg(),thinker.getString(), thinker.getPosition());
		Thinker numth = new Thinker(new ParseNumber(), ow);
		ow = numth.parse();
		thinker.setCurrent(ow.operand);
		thinker.setPosition(ow.position);
		//System.out.println("End parsing number. Next symbol "+ow.str.charAt(ow.position));
		
	}

}
