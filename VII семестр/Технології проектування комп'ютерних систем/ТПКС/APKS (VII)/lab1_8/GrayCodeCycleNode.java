package lab1_8;

import java.util.ArrayList;

public class GrayCodeCycleNode {
	
	private ArrayList<Integer> checked_grey_code_numbers = new ArrayList<Integer>();
	private int attached_node_number;

	public GrayCodeCycleNode(int NodeNumber) {
		
		attached_node_number = NodeNumber;
	}
	
	public void addGrayCodeNumber(int Number) {
		
		checked_grey_code_numbers.add(Number);
	}
	
	public ArrayList<Integer> getGrayCodeNumbers() {
		
		return checked_grey_code_numbers;
	}
	
	public int getAttachedNodeNumber() {
		
		return attached_node_number;
	}
}
