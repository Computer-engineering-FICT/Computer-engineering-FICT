package com.lab513;

import java.util.ArrayList;
import java.util.HashMap;

@SuppressWarnings("unchecked")
public class Queue{
	
	public final static int MAX_PRIORITY = 32;
	
	private Processor p;
	
	private ArrayList<Request> nextRequestListToSend;
	
	private boolean requested;
	
	private final static ArrayList<Request>[] queue;
	
	private int mI = 0;
	
	static{
		queue = new ArrayList[MAX_PRIORITY];
		for(int i = 0; i < MAX_PRIORITY; i++){
			queue[i] = new ArrayList<Request>();
		}
	}
	
	public void setProcessor(Processor p){
		this.p = p;
	}
	
	public Processor getProcessor(){
		return p;
	}
	
	public synchronized Statistic getStatictic(double intensity){
		for(int i = 0; i < MAX_PRIORITY; i++){
			//System.out.println(queue[i]);
		}
		
		int[] statistics = new int[MAX_PRIORITY];
		double averageWaitingTime, stayTimePercent;
		int value = 0, generalValue = 0, number = 0;
		HashMap<Integer,Double> aWTxPriority = new HashMap<Integer,Double>();
		for(int i = MAX_PRIORITY - 1; i >= 0; i--){
			value = 0;
			if(queue[i].isEmpty()){
				statistics[i] = 0;
			}
			else{
				for(Request r : queue[i]){
					statistics[i] += r.getWorkTime();
				}
				
				for(int j = i; j < MAX_PRIORITY; j++){
					value += statistics[j];
				}
				
				aWTxPriority.put(i, value/(double)queue[i].size());
				System.out.println(i + "x"+ value/(double)queue[i].size());
				number += queue[i].size();
				generalValue += statistics[i];
			}
		}
		
		stayTimePercent = p.getStayTime();///(double)generalValue;
		
		generalValue -= statistics[MAX_PRIORITY - 1];
		
		averageWaitingTime = generalValue/(double)number;
		
		System.out.println("----------------------------------");
		if(Double.isInfinite(stayTimePercent)){
			System.out.println("INF PERC: " + p.getStayTime() + "   " + generalValue);
			System.out.println("INF AVE: " + (generalValue) + "   " + number);
		}
		
		if(Double.isInfinite(averageWaitingTime)){
			System.out.println("INF AVE: " + (generalValue) + "   " + number);
			System.out.println("INF PERC: " + p.getStayTime() + "   " + generalValue);
		}
		System.out.println("----------------------------------");
		
		p.setStayTime(0);
		
		return new Statistic(averageWaitingTime, intensity, stayTimePercent, aWTxPriority);
	}
	
	
	//Called by processor when current request was partially finished
	public synchronized void getRequest(){
		if(nextRequestListToSend != null){
			Request r = nextRequestListToSend.remove(0);
			p.setRequest(r);
			if(nextRequestListToSend.isEmpty()){
				for(int i = r.getPriority() - 1; i >= 0; i--){
					if(!queue[i].isEmpty()){
						nextRequestListToSend = queue[i];
						return;
					}
				}
				System.out.println("THERE IS NO LIST TO SEND: " + mI);
				mI++;
				nextRequestListToSend = null;
			}
		}
		else{
			requested = true;
		}
	}
	
	public synchronized void addRequest(Request r){
		System.out.println("Q.add:["+r.getId()+"|"+r.getPriority()+"|"+r.getWorkTime()+"]: " + mI);
		mI++;
		ArrayList<Request> requestList = queue[r.getPriority()];
		requestList.add(r);
		if(nextRequestListToSend == null){
			nextRequestListToSend = requestList;
		}
		else{
			if(r.getPriority() > nextRequestListToSend.get(0).getPriority()){
				nextRequestListToSend = requestList;
			}
		}
		
		if(requested) {
			getRequest();
			requested = false;
			System.out.println("QUEUE REQUESTED: " + mI);
			mI++;
		}
	}
	
	public void stopQueue(){
		p.stopProcessor();
	}

}
