package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.Thinker;
import edu.editor.algorithm.parser.operand.Operand;

public class AddSymbol implements Action{

	public void doSmth(char c, Thinker thinker) {
		Operand op = thinker.getCurrent();
		if (op.getValue()==null){
			op.setValue(""+c);
		}else{
			op.setValue(op.getValue()+c);
		}
	}

}
