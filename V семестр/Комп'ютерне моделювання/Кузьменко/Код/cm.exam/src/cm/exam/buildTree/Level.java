package cm.exam.buildTree;

import java.util.ArrayList;

public class Level {
	private ArrayList<State>states = new ArrayList<State>();
	public int index;
	public int indexItems=0;
	private Graf graf;
	
	public void add(State state) {
		//if (graf.findThisState(state)==-1){
			states.add(state);			
		//}

	}
	
	public void buildNextLevel(Level nextLevel){
		for (State state : states) {
			if (state.printFlag)
			state.buildNextState(nextLevel,graf);
		}
		graf.uniqueArcs.add(new Transition());
	}
	public void printLevel(){
		
		for (State state : states) {
			state.printState(graf);
			System.out.print("   ");
		}
		System.out.println();
	}
	public Level(int index,Graf graf) {
		this.index = index;
		this.graf = graf;
	}
	
	public boolean isEnd(){
		boolean flag = false;
		for (State state : states) {
			flag = flag | state.printFlag;
		}
		return flag;
		//return states.size()!=0;
	}
	public int size(){
		return states.size();
	}
	
	
}
