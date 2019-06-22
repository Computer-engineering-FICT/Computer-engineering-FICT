package kpi.os.cours.emulating;

import kpi.os.cours.graph.Edge;
import kpi.os.cours.graph.Task;

public class Pair {
	public Edge edge;
	public Task task;
	private int startTime;

	public Pair(Edge edge, Task task) {
		this.edge = edge;
		this.task = task;
	}
	
	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}
	
	public int getStartTime() {
		return startTime;
	}
}
