package kpi.os.cours.emulating;

import kpi.os.cours.graph.Edge;
import kpi.os.cours.graph.Task;

public class Pair {
	public Edge edge;
	public Task task;

	public Pair(Edge edge, Task task) {
		super();
		this.edge = edge;
		this.task = task;
	}
}
