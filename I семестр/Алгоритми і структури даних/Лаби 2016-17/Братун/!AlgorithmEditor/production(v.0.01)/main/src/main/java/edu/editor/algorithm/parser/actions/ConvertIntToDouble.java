package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.Thinker;
import edu.editor.algorithm.parser.operand.DoubleArg;

public class ConvertIntToDouble implements Action{

	public void doSmth(char c, Thinker thinker) throws Exception {
		DoubleArg d = new DoubleArg(thinker.getCurrent());
		d.setValue(d.getValue()+'.');
		if (d.getValue().charAt(0)=='.'){
			d.setValue('0'+d.getValue());
		}
		thinker.setCurrent(d);
	}

}
