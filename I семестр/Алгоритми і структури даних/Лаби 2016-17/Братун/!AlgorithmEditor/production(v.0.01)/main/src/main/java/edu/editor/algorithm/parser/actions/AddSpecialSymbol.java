package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.Thinker;

public class AddSpecialSymbol implements Action{

	public void doSmth(char c, Thinker thinker) throws Exception {
		switch (c){
			case 't':thinker.getCurrent().setValue(thinker.getCurrent().getValue()+"\t");
						break;
			case '\\':thinker.getCurrent().setValue(thinker.getCurrent().getValue()+"\\");
						break;
			case '"':thinker.getCurrent().setValue(thinker.getCurrent().getValue()+"\"");
					break;
			case 'n':thinker.getCurrent().setValue(thinker.getCurrent().getValue()+"\n");
					break;		
		}
		
	}

}
