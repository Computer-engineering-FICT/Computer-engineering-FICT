package edu.editor.algorithm.parser.actions;

import java.util.ArrayList;
import java.util.HashMap;

import edu.editor.algorithm.model.component.block.AbstractBlock;
import edu.editor.algorithm.parser.Thinker;
import edu.editor.algorithm.parser.operand.Operand;
import edu.editor.algorithm.parser.operand.OperandWrapper;
import edu.editor.algorithm.parser.operand.Variable;
import edu.editor.algorithm.parser.tables.ParseVariable;

public class BeginVariable implements Action{

	public void doSmth(char c, Thinker thinker) throws Exception {
		OperandWrapper ow = new OperandWrapper(new Variable(),thinker.getString(), thinker.getPosition());
		Thinker varth = new Thinker(new ParseVariable(), ow, thinker.getModel());
		ow = varth.parse();
		if (ow.operand instanceof Variable){
			ArrayList <Variable> var = thinker.getModel().getVariables();


            /*if (ow.str.contains("[")) {
                ow.operand.addToValue("[]");
            }*/
            //String varValue = ow.operand.getValue();
            if (isItNewOperand(ow.operand, var)){
				var.add((Variable) ow.operand);
                /*if (thinker.getT)*/
				HashMap<AbstractBlock, ArrayList<String>> firstVariablesAppearanceMap =
                        thinker.getModel().firstVariablesAppearanceMap;
				AbstractBlock currentBlock = thinker.currentBlock;
				if (firstVariablesAppearanceMap.containsKey(currentBlock)) {
					firstVariablesAppearanceMap.get(currentBlock).add(ow.operand.getValue());
				} else {
					ArrayList<String> variablesNameList = new ArrayList<String>();
					variablesNameList.add(ow.operand.getValue());
					firstVariablesAppearanceMap.put(currentBlock, variablesNameList);
				}
			}
		}
		thinker.setCurrent(ow.operand);
		thinker.setPosition(ow.position);
	}

    private boolean isItNewOperand(Operand operand, ArrayList<Variable> var) {
        Variable v =null;
        for (int i=0; i<var.size();i++){
            v = var.get(i);
            if (v.getValue().equals(operand.getValue())){
                operand = v;
                break;
            }
        }
        if (v==null || !operand.getValue().equals(v.getValue())) {
            return true;
        }
        return false;
    }

}
