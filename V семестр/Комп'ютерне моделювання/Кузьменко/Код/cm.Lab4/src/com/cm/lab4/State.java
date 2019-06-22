package com.cm.lab4;


public class State {
	Device[] devices;
	boolean printFlag=true;
	int id;

	public State(State state) {
		devices = new Device[state.devices.length];
		int i = 0;
		for (Device device : state.devices) {

			devices[i] =(Device) device.clone();
			i++;
		}
	}

	public State(Device... dev) {
		devices = dev;
	}

	public Device findById(int id) {
		Device res = null;
		for (int i = 0; i < devices.length; i++) {
			if (devices[i].id == id) {
				res = devices[i];
				break;
			}

		}
		return res;
	}

	public void buildNextState(Level nextLevel,Graf graf) {
		for (Device deviceThis : devices) {
			if (deviceThis.isNextState()) {
				int[] outDev = deviceThis.outDevice;
				double [] outProp = deviceThis.outProbability;
				State nextState;
				for (int i = 0; i < outDev.length; i++) {
					nextState = new State(this);
					nextState.findById(deviceThis.id).removeTask();
					nextState.findById(outDev[i]).addTask();
					
					int markNode = graf.findThisState(nextState); 
					if (markNode==-1){
						nextState.id = graf.nodeCount;
						graf.nodeCount++;
						graf.uniqueStates.add(nextState);
						
					}else{
						nextState.printFlag = false;
						nextState.id = markNode;
					}	
					//if (nextState.printFlag)
					nextLevel.add(nextState);
					
					Transition transition = new Transition();
					transition.headNode = this.id;
					transition.tallNode = nextState.id;
					transition.lambda = deviceThis.lambda;
					
					transition.probability = outProp[i];
					
					int markArc = graf.findThisArc(transition);
					if (markArc==-1){
						transition.id = graf.arcCount;
						graf.arcCount++;
						graf.uniqueArcs.add(transition);
					}else{
						transition.id = markArc;
						transition = null;
					}		
				}
			}

		}
	}

	public void printState() {
		if (printFlag){
			System.out.print("M"+id+"{");
			for (Device device : devices) {
				System.out.print(device.toString());
				System.out.print(",");
			}
			System.out.print("}");
			
		}else{
			System.out.print("M"+id);
		}
	}
	
	@Override
	public boolean equals(Object obj) {
		State s = (State)obj;
		boolean flag =true;
		for (Device device : devices) {
			Device objDevice = s.findById(device.id);
			if (objDevice.queue != device.queue || objDevice.core!=device.core || objDevice.resource!=device.resource){
				flag = false;
				break;
			}
		}
		return flag;
		
		
	}

}
