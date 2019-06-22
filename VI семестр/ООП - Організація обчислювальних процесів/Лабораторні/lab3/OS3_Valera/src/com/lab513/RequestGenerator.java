package com.lab513;

public class RequestGenerator extends Thread{

	private Queue q;
	
	private final static double MIN_WORK_TIME = 1;
	
	private final static double MAX_WORK_TIME = 10;
	
	private int intensityChangeNumber = 10;
	
	private int intensitiesChanged = 0;
	
	private double startIntensity = 1;
	
	private double intensityChange = 0.1;
	
	private double time;
	
	private double intensity;
	
	private long previousTime;
	
	private long timeRange = 2000;
	
	private int id = 0;
	
	private boolean bWork = true;
	
	private Statistic[] statistics = new Statistic[intensityChangeNumber];
	
	private int mI = 0;
	
	public void setQueue(Queue q){
		this.q = q;
	}
	
	public Statistic[] getStatistics(){
		return statistics;
	}

	@Override
	public void run(){
		int workTime;
		int priority;
		previousTime = System.currentTimeMillis();
		intensity = startIntensity;
		while(bWork){
			if(previousTime + timeRange > System.currentTimeMillis()){
				time = 1/(double) intensity;
				workTime = (int)(Math.random() * (MAX_WORK_TIME - MIN_WORK_TIME) + MIN_WORK_TIME);
				priority = (int)(Math.random() * Queue.MAX_PRIORITY);
				System.out.println("RG.run:["+id+"|"+priority+"|"+workTime+"]: " + mI);
				mI++;
				q.addRequest(new Request(id, priority, workTime));
				
				//DO SOME WORK
				try {
					sleep((long) (time * Main.sleepTime));
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				
				id++;
				
			}
			else{
				System.out.println("STATISTIC");
				statistics[intensitiesChanged] = q.getStatictic(intensity);
				intensitiesChanged ++;
				intensity += intensityChange;
				if(intensitiesChanged == intensityChangeNumber){
					System.out.println("STOP: " + mI);
					mI++;
					q.stopQueue();
					bWork = false;
				}
				previousTime = System.currentTimeMillis();
			}
		}
	}
	
}

