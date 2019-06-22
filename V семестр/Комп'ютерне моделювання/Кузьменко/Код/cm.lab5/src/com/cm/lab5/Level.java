package com.cm.lab5;

import java.util.ArrayList;

// TODO: Auto-generated Javadoc
/**
 * The Class Level.
 */
public class Level {
	
	/** The items. */
	ArrayList<Node> items = new ArrayList<Node>();
	
	/** The util. */
	GraphUtil util;
	
	/**
	 * Instantiates a new level.
	 *
	 * @param util the util
	 */
	public Level(GraphUtil util) {
		this.util = util;
	}
	
	/**
	 * Instantiates a new level.
	 *
	 * @param node the node
	 */
	public Level(Node node) {
		items.add(node);
	}
	
	/**
	 * Adds the all.
	 *
	 * @param nodes the nodes
	 */
	public void addAll(ArrayList<Node> nodes) {
		for (Node node : nodes) {
			if (contains(node)){
				items.add(node);
			}
		}
	}
	
	/**
	 * Adds the node.
	 *
	 * @param node the node
	 */
	public void addNode(Node node){
		items.add(node);
	}
	
	/**
	 * Calc level.
	 */
	public void calcLevel(){
		for (Node node : items) {
			node.calcNode();
		}
		util.endFlag=true;
	}
	
	/**
	 * Builds the next level.
	 *
	 * @return the level
	 */
	public Level buildNextLevel(){
		Level nextLevel = new Level(util);
		for (Node node : items) {
			nextLevel.addAll(node.nodesFromThisNode);
		}
		if (nextLevel.items.size()==0)util.endFlag=false;
		return nextLevel;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@ Override
	public String toString(){
		String str = new String(" ");
		for (Node node : items) {
			str = str + node.toString();
		}
		str = str + "\n";
		return str;
	}
	
	/**
	 * Contains.
	 *
	 * @param node the node
	 * @return true, if successful
	 */
	private boolean contains(Node node){
		boolean flag = true;
		for (Node nd : items) {
			if (nd.id==node.id){
				flag = false;
				break;
			}
		}
		return flag;
	}
	
	
}
