package edu.editor.algorithm.checker;

import java.util.ArrayList;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.AbstractComponent;
import edu.editor.algorithm.model.component.block.*;
import edu.editor.algorithm.model.component.block.Output;

public class SimpleChecker {
	public static boolean check (AlgorithmModel model){
		boolean res= true;
		AbstractBlock temp = null;
		ArrayList <AbstractComponent> components = model.getComponents();
		AbstractBlock beg = null;
		for (int i=0; i<components.size(); i++){
			if (components.get(i) instanceof Begin ){
				beg = (AbstractBlock) components.get(i);
			}
		}
		if (beg == null) return false;
		if (res){
			AbstractBlock end = null;
			for (int i=0; i<components.size(); i++){
				if (components.get(i) instanceof Begin ){
					end = (AbstractBlock) components.get(i);
				}
			}
			if (end == null) return false;
		}
			
		for (int i=0; i<components.size(); i++){
			if (components.get(i) instanceof AbstractBlock ){
				temp = (AbstractBlock) components.get(i);
				if (temp instanceof Begin){
					if (temp.getOutputConnection()==null) return false;
				}
				if (temp instanceof Condition){
					if (temp.getOutputConnection()==null) return false;
					if (temp.getInputConnection()==null) return false;
					if (((Condition) temp).getSecondOutputConnection()==null) return false;
				}
				if (temp instanceof End){
					if (temp.getInputConnection()==null) return false;
				}
				if (temp instanceof Output){
					if (temp.getOutputConnection()==null) return false;
					if (temp.getInputConnection()==null) return false;
				}
				if (temp instanceof Operator){
					if (temp.getOutputConnection()==null) return false;
					if (temp.getInputConnection()==null) return false;
				}
				
				if (temp instanceof Connector){
					if (temp.getOutputConnection()==null) return false;
					if (temp.getInputConnection()==null) return false;
					if (((Connector) temp).getSecondInputConnection()==null) return false;

				}
			}
		}
		return res;
	}
}
