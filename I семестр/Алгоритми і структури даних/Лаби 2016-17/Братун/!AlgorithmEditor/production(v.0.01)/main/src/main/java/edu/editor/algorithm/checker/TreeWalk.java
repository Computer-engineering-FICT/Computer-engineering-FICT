package edu.editor.algorithm.checker;
import java.util.ArrayList;
import java.util.HashMap;

import edu.editor.algorithm.model.component.block.*;
import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.AbstractComponent;
public class TreeWalk {
	private AlgorithmModel model;
	
	public TreeWalk(AlgorithmModel model){
		this.model = model;
	}
	
	public void doTreeWalk (){
		ArrayList<AbstractComponent> components = model.getComponents();
		AbstractComponent beg = null;
		for (int i=0; i<components.size();i++){
			beg = components.get(i);
			if (beg instanceof Begin )break;
		}
		AbstractComponent end = null;
		for (int i=0; i<components.size();i++){
			end = components.get(i);
			if (end instanceof End )break;
		}
		if (beg instanceof Begin ){
			if (end instanceof End ){
				String str = "Begin - ";
				int step=0;
				if (((Begin) beg).getOutputConnection()==null){
					System.out.println("Begin block doesn't contains output connection.");
					return;
				}
				if (((End) end).getInputConnection()==null){
					System.out.println("End block doesn't contains input connection.");
					return;
				}
				HashMap <Integer, AbstractBlock> path = new HashMap<Integer, AbstractBlock>();
				path.put(0,(AbstractBlock) beg);
				str=branchWalk(path,str,((Begin)beg).getOutputConnection(),step);
				System.out.println(str);
				
			}else System.out.println("There is no end block. Tree walk impossible ");
						
		}else System.out.println("There is no begin block. Tree walk impossible ");
	}
	
	private String branchWalk(HashMap <Integer, AbstractBlock> path,String str, Connection conn, int step){
		AbstractBlock temp = conn.getEndBlock();
		if (path.containsValue(temp)){
			if (temp.getValue()!=null)return str+"cycle to "+getStrClass(temp)+" "+temp.getValue();
			else return str+"cycle to "+getStrClass(temp)+".";
		}
		step++;
		path.put(step, temp);
		if (! (temp instanceof Condition)){
			if (! (temp instanceof End)){
				if (temp.getValue()!=null)str+=getStrClass(temp)+" "+temp.getValue()+" - ";
				else str+=getStrClass(temp)+" - ";
				str=branchWalk(path,str,temp.getOutputConnection(),step);
			}else {
				//End
				str+="End.";				
			}
		}else{
			//Condition
			str+="Condition "+temp.getValue()+" - ";
			String str1=branchWalk(new HashMap<Integer, AbstractBlock>(path),str,((Condition)temp).getSecondOutputConnection(),step);
			str=str1+"\n"+branchWalk(path,str,temp.getOutputConnection(),step);
			
			
		}
		return str;
	}

	
	private String getStrClass(AbstractBlock b){
		String str = "Abstract Block";
		if (b instanceof Begin) str = "begin";
		if (b instanceof Condition) str = "Condition";
		if (b instanceof Connector) str = "Connector";
		if (b instanceof End) str = "End";
		if (b instanceof Output) str = "InputOutput";
		if (b instanceof Operator) str = "Operator";
		return str;
	}
}
