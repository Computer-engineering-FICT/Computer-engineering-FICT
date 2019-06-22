package com.lab513;

import java.util.HashMap;

public class Statistic {
	
	private double averageWaitingTime;
	
	private double intensity;
	
	private double stayTimePercent;
	
	private HashMap<Integer,Double> aWTxPriority;
	
	public Statistic(double averageWaitingTime, double intensity, double stayTimePercent, HashMap<Integer,Double> aWTxPriority){
		setAverageWaitingTime(averageWaitingTime);
		setIntensity(intensity);
		setStayTimePercent(stayTimePercent);
		setaWTxPriority(aWTxPriority);
	}

	public double getAverageWaitingTime() {
		return averageWaitingTime;
	}

	public void setAverageWaitingTime(double averageWaitingTime) {
		this.averageWaitingTime = averageWaitingTime;
	}

	public double getIntensity() {
		return intensity;
	}

	public void setIntensity(double intensity) {
		this.intensity = intensity;
	}
	
	public double getStayTimePercent() {
		return stayTimePercent;
	}

	public void setStayTimePercent(double stayTimePercent) {
		this.stayTimePercent = stayTimePercent;
	}

	public HashMap<Integer,Double> getaWTxPriority() {
		return aWTxPriority;
	}

	public void setaWTxPriority(HashMap<Integer,Double> aWTxPriority) {
		this.aWTxPriority = aWTxPriority;
	}
		
}
