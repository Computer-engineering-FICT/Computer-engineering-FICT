package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.Thinker;
import edu.editor.algorithm.parser.operand.Function;

public class ConvertToFunction implements Action{

	public void doSmth(char c, Thinker thinker) {
		
		thinker.setCurrent(new Function(thinker.getCurrent()));
		
	}
	
}
