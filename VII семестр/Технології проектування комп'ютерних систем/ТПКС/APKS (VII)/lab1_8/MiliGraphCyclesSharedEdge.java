package lab1_8;

import java.util.ArrayList;

public class MiliGraphCyclesSharedEdge {
	
	private int edge_node1;
	private int edge_node2;
	private ArrayList<Integer> cycles_numbers_that_contain_edge = new ArrayList<Integer>();

	public MiliGraphCyclesSharedEdge(int EdgeNode1, int EdgeNode2) {		
		
		edge_node1 = EdgeNode1;
		edge_node2 = EdgeNode2;
	}
	
	public boolean isEqual(int EdgeNode1, int EdgeNode2) {
		
		if (((EdgeNode1 == edge_node1) && (EdgeNode2 == edge_node2)) || ((EdgeNode1 == edge_node2) && (EdgeNode2 == edge_node1)))
			return true;
		
		return false;
	}
	
	public void addCycleNumber(int CycleNumber) {
		
		cycles_numbers_that_contain_edge.add(CycleNumber);
	}
	
	public ArrayList<Integer> geCyclesNumbers() {
		
		return cycles_numbers_that_contain_edge;
	}
	
	public int getEdgeNode1() {
		
		return edge_node1;
	}
	
	public int getEdgeNode2() {
		
		return edge_node2;
	}
}
