package com.tdcs.model;

public class Link implements Element {
	int id;
	private int p1,p2;

	public Link(int id) {
		this.id = id;
	}

	@Override
	public int getIndex() {
		return id;
	}

	@Override
	public String toString() {
		return "↑"+id;
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
