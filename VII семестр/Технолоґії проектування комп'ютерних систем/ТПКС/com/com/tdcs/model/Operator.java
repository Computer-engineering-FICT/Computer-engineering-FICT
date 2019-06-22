package com.tdcs.model;

public class Operator implements Element, Node {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Element next;
	private int index;
	private int p1, p2;

	public Operator(int index, int textBegin, int textEnd) {
		this.setIndex(index);
		p1 = textBegin;
		p2 = textEnd;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public Element getNext() {
		return next;
	}

	public void setNext(Element next) {
		this.next = next;
	}

	public String toString() {
		if (index >= 0)
			return "Y" + index;
		else if (index == -1)
			return "Yb";
		else
			return "Ye";
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
		return (Node) next;
	}

	@Override
	public Node getNextNodeAlt() {
		return null;
	}
	
	private int code;
	

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
		
	}
}
