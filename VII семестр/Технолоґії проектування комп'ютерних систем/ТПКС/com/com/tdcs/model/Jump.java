package com.tdcs.model;

public class Jump implements Element {
	private Element next;
	private int p1,p2;

	public Jump() {

	}

	public Element getNext() {
		return next;
	}

	public void setNext(Element next) {
		this.next = next;
	}

	public String toString() {
		return "w";
	}

	@Override
	public int getIndex() {
		return 0;
	}
	
	@Override
	public int getTextBegin() {
		return p1;
	}

	@Override
	public int getTextEnd() {
		return p2;
	}
}
