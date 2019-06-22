package com.cm.lab4OneCore;

public class Device {
	int id;
	int queue=0;
	int resource=0;
	int core=1;
	String name;
	double lambda;
	int [] outDevice;
	double[] outProbability;
	
	public Device(int id,int strtQueue, int strtResourse, int strtCore, String name, double meanTime) {
		this.id = id;
		this.queue = strtQueue;
		this.resource = strtResourse;
		this.core = strtCore;
		this.name = name;
		this.lambda = 1.0/meanTime;
		
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString(){
		return "<"+queue+","+resource+","+core+">";
	}
	
	public void linkOutDevice(Device ...devices){
		outDevice = new int [devices.length];
		for (int i = 0; i < devices.length; i++) {
			outDevice[i] = devices[i].id;
		}
		
	}
	public void linkOutProbability(double ...probabilityies){
		outProbability = probabilityies;
	}
	
	public void addTask(){
		if (core>=1){
			core--;
			resource++;
		}else{
			queue++;
		}
	}
	public void removeTask(){
		resource--;
		core++;
		while(core!=0 && queue!=0){
			resource++;
			queue--;
			core--;
		}
	}
	public boolean isNextState(){
		if (resource!=0) return true;
		else return false;
			
		
	}

	public Device() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected Object clone() {
		Device device = new Device();
		device.id = this.id;
		device.core = this.core;
		device.resource = this.resource;
		device.queue = this.queue;
		device.name = this.name;
		device.outProbability = this.outProbability;
		device.outDevice = this.outDevice;
		device.lambda = this.lambda;
		return device;
	}
	
	
	
}
