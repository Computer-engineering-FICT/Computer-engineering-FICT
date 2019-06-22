package lab1_8;

import java.util.ArrayList;

public class MiliGraphCyclesSharedNode {
	
	private int NodeNumber;
	private ArrayList<Integer> CyclesNumbersThatContainNode = new ArrayList<Integer>();

	public MiliGraphCyclesSharedNode(int NodeNumber) {		
		
		this.NodeNumber = NodeNumber;
	}
	
	public int getNodeNumber() {
		
		return NodeNumber;
	}
	
	public void addCycleNumber(int CycleNumber) {
		
		CyclesNumbersThatContainNode.add(CycleNumber);
	}
	
	public ArrayList<Integer> getCyclesNumbers() {
		
		return CyclesNumbersThatContainNode;
	}
}
