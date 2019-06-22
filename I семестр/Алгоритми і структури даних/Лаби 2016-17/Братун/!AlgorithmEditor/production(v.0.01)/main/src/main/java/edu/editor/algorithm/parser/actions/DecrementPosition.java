package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.Thinker;

public class DecrementPosition implements Action{


	public void doSmth(char c, Thinker thinker) throws Exception {
		if (thinker.getPosition()<=0){
			throw new Exception("Position < 0");
		}else{
			if (c!=0){
				thinker.setPosition(thinker.getPosition()-1);
			}
		}
			
		
	}

}
