package kpi.os.cours.emulating;

import java.util.ArrayList;

import kpi.os.cours.graph.Cluster;
import kpi.os.cours.graph.ClusterPool;
import kpi.os.cours.graph.Task;
import kpi.os.cours.graph.TaskGraph;

public class Controller {
	private TaskGraph graph;
	private ClusterPool genPool, pool;
	private ArrayList<Processor> processors;	
	
	public Controller(TaskGraph graph, ClusterPool genPool) {
		this.graph = graph;
		this.genPool = genPool;
		

		
		//TEST OUTPUT
		
	}

	private ClusterPool getFullPool() {
		ClusterPool fullPool = genPool.clone();
		
		for (Task t : graph.getTasks()) {
			if (!genPool.contains(t)) {
				fullPool.addTask(t, t);
			}
		}
		
		return fullPool;
	}
	
//	private boolean isReady(Task task) {
//		boolean flag = true;
//		
//		for (Edge l : task.getInEdges()) {
//			if (!processed.contains(l.getEnd())) {
//				flag = false;
//				break;
//			}
//		}
//		
//		return flag;
//	}
//	
//	private ArrayList<Task> getReadyTasks() {
//		ArrayList<Task> ready = new ArrayList<Task>();
//		
//		for (Task t : graph.getTasks()) {
//			if (isReady(t) && !processed.contains(t)) {
//				ready.add(t);
//			}
//		}
//		
//		return ready;
//	}
		
	public TaskGraph getGraph() {
		return graph;
	}
	
	public ClusterPool getPool() {
		return genPool;
	}
}
