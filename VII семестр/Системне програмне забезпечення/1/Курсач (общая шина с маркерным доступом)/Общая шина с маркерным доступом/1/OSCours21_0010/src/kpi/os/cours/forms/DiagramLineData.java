package kpi.os.cours.forms;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class DiagramLineData {
	private String name;
	
	private ArrayList<Interval> intervals;
	
	public DiagramLineData(String name, ArrayList<Interval> intervals) {
		this.name = name;
		this.intervals = intervals;
		
		Collections.sort(this.intervals, new Comparator<Interval>() {

			@Override
			public int compare(Interval o1, Interval o2) {
				if (o1.getType().compareTo(o2.getType()) == 0) {
					return o1.getBegin() - o2.getBegin();
				} else {
					return o1.getType().compareTo(o2.getType());
				}				
			}
		});
	}
	
	public String getName() {
		return name;
	}
	
	public ArrayList<Interval> getIntervals() {
		return intervals;
	}
}
