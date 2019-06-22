package com.lab513;

public class Processor extends Thread{

	public static final int MAX_TIME_TO_WORK = 900;
	
	private int maxCycleValue;
	
	private Request currentRequest;
	
	private Queue q;
	
	private boolean bWork = true, requested = false;
	
	private int stayTime = 0;
	
	private int mI = 0;
	
	public void setRequest(Request r) {
		currentRequest = r;
		System.out.println("P.setRequest:["+r.getId()+"|"+r.getPriority()+"|"+r.getWorkTime()+"]: " + mI);
		mI++;
	}
	
	public void setQueue(Queue q){
		this.q = q;
	}
	
	public void stopProcessor(){
		bWork = false;
	}
	
	public int getStayTime(){
		return stayTime;
	}
	
	public void setStayTime(int value){
		stayTime = value;
	}

	@Override
	public void run(){
		while(bWork){
			if(currentRequest != null){
				maxCycleValue = currentRequest.getWorkTime();
				currentRequest.setWorkTime(0);
				
				try {
					sleep(maxCycleValue * Main.sleepTime);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				
				Request r = currentRequest;
				System.out.println("P.run:["+r.getId()+"|"+r.getPriority()+"|"+r.getWorkTime()+"]: " + mI);
				mI++;
				
				currentRequest = null;
				
				q.getRequest();
			}
			else{
				if(!requested) {
					System.out.println("PROCESSOR REQUESTED: " + mI);
					mI++;
					q.getRequest();
					requested = true;
				}
				stayTime++;
			}
		}
	}
	
}
