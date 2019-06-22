package com.tdcs.model;

public class Condition implements Element, Node {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Element s1, s2;
	private int index;
	private int p1, p2;

	public Condition(int index, int textBegin, int textEnd) {
		this.setIndex(index);
		p1 = textBegin;
		p2 = textEnd;
	}

	public Element getS1() {
		return s1;
	}

	public void setS1(Element s1) {
		this.s1 = s1;
	}

	public Element getS2() {
		return s2;
	}

	public void setS2(Element s2) {
		this.s2 = s2;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	@Override
	public String toString() {
		return "x" + index;
	}

	@Override
	public int getTextBegin() {
		return p1;
	}

	@Override
	public int getTextEnd() {
		return p2;
	}

	@Override
	public Node getNextNode() {
		return (Node) s1;
	}

	@Override
	public Node getNextNodeAlt() {
		return (Node) s2;
	}


}
