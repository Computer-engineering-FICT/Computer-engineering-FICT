package edu.editor.algorithm.parser;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.block.AbstractBlock;
import edu.editor.algorithm.parser.actions.Action;
import edu.editor.algorithm.parser.operand.Operand;
import edu.editor.algorithm.parser.operand.OperandWrapper;
import edu.editor.algorithm.parser.tables.Initiator;

public class Thinker {
	protected Action [] actions;
	protected Exception [] errors;
	protected int [][][] table;
	protected int [] classTable;
	public int state=0;
	protected Operand current;
	protected AlgorithmModel model = new AlgorithmModel();
	public AbstractBlock currentBlock;
	
	
	public Thinker (Initiator init, OperandWrapper ow){
		actions = init.fillActions();
		errors = init.fillErrors();
		table = init.fillTable();
		classTable = init.fillClassTable();
		str = ow.str;
		current = ow.operand;
		position = ow.position;
	}
	
	public Thinker (Initiator init, OperandWrapper ow, AlgorithmModel m){
		actions = init.fillActions();
		errors = init.fillErrors();
		table = init.fillTable();
		classTable = init.fillClassTable();
		str = ow.str;
		current = ow.operand;
		position = ow.position;
		model = m;
	}
	

	protected String str;
	protected int position;
	public OperandWrapper parse () throws Exception{
		char c;
		int sym;
		for (;position<=str.length(); position++){
			if (position==str.length()){
				c = 0;
			}else{
				c = str.charAt(position);
			}
			sym = classTable[c];
			actions[table[sym][state][1]].doSmth(c, this);
			state = table[sym][state][0];
			if (state == table[0].length){
				break;
			}
			if(state>table[0].length){
				System.out.println("Parsed string: "+str);
				System.out.println("Parsed symbol: "+str.charAt(position)+" at "+position);
				throw errors[state-table[0].length-1];
			}
		}
		return new OperandWrapper (current,str,position);
	}
	

	public Operand getCurrent(){
		return current;
	}
	
	public void setCurrent(Operand op){
		current = op;
	}
	
	public int getPosition(){
		return position;
	}
	public void setPosition(int p){
		position = p;
	}
	
	public String getString (){
		return str;
	}
	
	public void setCurrentManually(Operand op){
		current = op;
	}
	
	public AlgorithmModel getModel(){
		return model;
	}
	
}
