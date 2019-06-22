package com.lab513;

public class Request {
	
	private int id;
	
	private int priority;
	
	private int workTime;
	
	public Request(int id, int priority, int workTime){
		setPriority(priority);
		setWorkTime(workTime);
		setId(id);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public int getWorkTime() {
		return workTime;
	}

	public void setWorkTime(int workTime) {
		this.workTime = workTime;
	}
	
	public String toString(){
		return Integer.toString(id);
	}
	
}
