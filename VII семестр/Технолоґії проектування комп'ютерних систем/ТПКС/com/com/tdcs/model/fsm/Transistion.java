package com.tdcs.model.fsm;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Transistion implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4940782108130462856L;
	private State from;
	private State next;
	private List<Condition> conditions = new ArrayList<>();
	private int signal;

	public Transistion(State from) {
		this.from = from;
	}

	public State getNext() {
		return next;
	}

	public void setNext(State next) {
		this.next = next;
	}

	public List<Condition> getConditions() {
		return conditions;
	}

	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if ((obj == null) || (obj.getClass() != this.getClass()))
			return false;
		Transistion t = (Transistion) obj;

		return t.conditions.equals(conditions);
	}

	public int hashCode() {
		return conditions.hashCode();
	}

	public String printConditions() {
		String tmp = "";
		if (conditions.size() == 0)
			return "-";
		else
			for (Condition c : conditions) {
				if (!c.getCondition())
					tmp += "x̅";
				else
					tmp += "x";

				tmp += c.getIndex();
			}
		return tmp;
	}

	public String toString() {
		String tmp = "" + from + ">";

		tmp += printConditions();

		tmp += ">" + next;

		return tmp;
	}

	public State getFrom() {
		return from;
	}

	public void setFrom(State from) {
		this.from = from;
	}

	public int getSignal() {
		return signal;
	}

	public void setSignal(int signal) {
		this.signal = signal;
	}
	
	public void insert(State state){
		Transistion t = new Transistion(state);
		t.next = next;
		t.signal = signal;
		state.addTransistion(t);
		
		next = state;
	}
}
