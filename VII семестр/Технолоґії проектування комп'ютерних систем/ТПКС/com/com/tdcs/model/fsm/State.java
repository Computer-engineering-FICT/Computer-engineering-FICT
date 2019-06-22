package com.tdcs.model.fsm;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class State implements Serializable {

	private static final long serialVersionUID = 5671313703954253534L;
	private int index;
	private Set<Transistion> transistions;
	private int coding;
	private int codeSize;

	public State(int index) {
		transistions = new HashSet<Transistion>();
		this.index = index;
		this.coding = -1;
		this.codeSize = 0;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public void addTransistion(Transistion t) {
		transistions.add(t);
	}

	public Set<Transistion> getTransistions() {
		return transistions;
	}

	public String toString() {
		String tmp = "z" + index;
		if (coding >= 0)
			tmp += " (" + printCoding()+ ")";
		return tmp;
	}

	public int getCoding() {
		return coding;
	}

	public void setCoding(int coding) {
		this.coding = coding;
	}

	public void setCodeSize(int codeLength) {
		codeSize = codeLength;
	}

	private String printCoding() {
		String tmp = Integer.toBinaryString(coding);
		while (tmp.length() < codeSize)
			tmp = "0" + tmp;

		return tmp;
	}

}
