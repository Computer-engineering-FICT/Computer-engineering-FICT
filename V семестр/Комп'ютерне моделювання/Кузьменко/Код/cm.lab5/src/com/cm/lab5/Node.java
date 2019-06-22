package com.cm.lab5;

import java.util.ArrayList;
import java.util.Iterator;

// TODO: Auto-generated Javadoc
/**
 * The Class Node.
 */
public class Node {
	
	/** The id. */
	int id;
	
	/** The price. */
	int price = -1;
	
	/** The max node. */
	Node maxNode;
	
	/** The max transit. */
	int maxTransit;
	
	/** The transition from price. */
	ArrayList<Integer> transitionFromPrice = new ArrayList<Integer>();
	
	/** The transition in price. */
	ArrayList<Integer> transitionInPrice = new ArrayList<Integer>();

	/** The nodes in this node. */
	ArrayList<Node> nodesInThisNode = new ArrayList<Node>();
	
	/** The nodes from this node. */
	ArrayList<Node> nodesFromThisNode = new ArrayList<Node>();

	/**
	 * Instantiates a new node.
	 *
	 * @param id the id
	 */
	public Node(int id) {
		this.id = id;
		// TODO Auto-generated constructor stub
	}

	/**
	 * Adds the link from this node.
	 *
	 * @param price the price
	 * @param node the node
	 */
	public void addLinkFromThisNode(int price, Node node) {
		transitionFromPrice.add(price);
		nodesFromThisNode.add(node);
	}

	/**
	 * Adds the link to this node.
	 *
	 * @param price the price
	 * @param node the node
	 */
	public void addLinkToThisNode(int price, Node node) {
		transitionInPrice.add(price);
		nodesInThisNode.add(node);
	}

	/**
	 * Calc node.
	 */
	public void calcNode() {
		int max = 0;
		int i = 0;
		int index = 0;
		for (Integer prc : transitionInPrice) {
			if (nodesInThisNode.get(i).price != -1) {
				if (prc + nodesInThisNode.get(i).price > max) {
					max = prc;
					index = i;
					maxNode = nodesInThisNode.get(index);
					this.price = prc + nodesInThisNode.get(i).price;
					maxTransit = prc;
				}
			}
			i++;
		}
	}
	
	/**
	 * Prints the track.
	 */
	@SuppressWarnings("unused")
	public void printTrack(){
		int mxNode=0;
		int max=0;
		int maxNodeIndex;
		int i=0;
		Node mNode = null;
		for (Node node : nodesInThisNode) {
			if (node.price+transitionInPrice.get(i)>=max){
				max = node.price+transitionInPrice.get(i);
				maxNodeIndex = i;
				mNode = node;
			}
		}
		if (this.id!=GraphUtil.start){
			if (this.id==GraphUtil.finish){
				System.out.print(""+this.id+"");
				mNode.printTrack();
			}else{
				System.out.print(" <--- "+this.id+"");
				mNode.printTrack();				
			}
		}else{
			System.out.print(" <--- "+this.id+"");
			
		}
		
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		Iterator<Node> nodeItr = nodesFromThisNode.iterator();
		int i = 0;
		String str = new String("this node " + id + " price node = " + price
				+" ");
		if (maxNode==null){
			str = str +("null");
		}else{
			str = str +(maxNode.id);
		}
		str = str +("\n");
		while (nodeItr.hasNext()) {
			Node node = (Node) nodeItr.next();
			str = str + " id from= " + node.id + " price transit = "
					+ transitionFromPrice.get(i);
			
			i++;
		}
		str = str + "\n";
		nodeItr = nodesInThisNode.iterator();
		i = 0;
	
		while (nodeItr.hasNext()) {
			Node node = (Node) nodeItr.next();
			str = str + " id in= " + node.id + " price node = "
					+ node.price;
			
			i++;
		}
		str = str + "\n";
		
		return str;
	}
	

}
