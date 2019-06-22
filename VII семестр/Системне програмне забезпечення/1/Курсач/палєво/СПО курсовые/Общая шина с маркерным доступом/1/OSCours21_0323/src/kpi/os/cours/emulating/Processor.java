package kpi.os.cours.emulating;

import java.util.ArrayList;

import kpi.os.cours.forms.Interval;
import kpi.os.cours.forms.IntervalType;
import kpi.os.cours.graph.Task;

public class Processor {
	private int num;
	private Task currentTask;
	private int remainProcTime = 0,
				remainTransTime = 0,
				curTime = 0;
	private ArrayList<Task> queue;
	
	ArrayList<Interval> history;
	
	public Processor(int num, ArrayList<Task> tasks) {
		this.num = num;
		this.queue = tasks;
		history = new ArrayList<Interval>();
		curTime = 0;
	}
	
	public void setTask(Task task) {
		remainProcTime = task.getWeight();
		
		currentTask = task;
		
		history.add(new Interval(curTime, curTime + task.getWeight(), 
				IntervalType.PROCESSING, Integer.toString(task.getNum())));
	}
	
	
	
	public void makeStep() {
		curTime++;
		
		if (remainProcTime > 0) {
			remainProcTime--;
		}
		
		if (remainTransTime > 0) {
			remainTransTime--;
		}
	}
	
	public String toString() {
		String str = "Processor #" + num + "\n";
		str += "Cur time = " + curTime + "\n";
		str += "Cur task: " + ((currentTask == null)?"-":currentTask.getNum()) + "\n";
		str += "Queue: ";
		
		for (Task t : queue) {
			str += t.getNum() + " ";
		}
		
		return str;
	}
}
