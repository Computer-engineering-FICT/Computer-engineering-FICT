package com.tdcs.model;

public class Reference implements Element {
	private Element element;
	int id;
	private int p1,p2;

	public Reference(int id) {
		this.id = id;
	}

	public boolean equals(Object object) {
		if (object == this)
			return true;
		if (!(object instanceof Reference))
			return false;
		Reference tmp = (Reference) object;
		return tmp.id == id;
	}

	public int hashCode() {
		return id;
	}

	public Element getElement() {
		return element;
	}

	public void setElement(Element element) {
		this.element = element;
	}

	@Override
	public int getIndex() {
		return id;
	}

	@Override
	public String toString() {
		return "↓" + id;
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
