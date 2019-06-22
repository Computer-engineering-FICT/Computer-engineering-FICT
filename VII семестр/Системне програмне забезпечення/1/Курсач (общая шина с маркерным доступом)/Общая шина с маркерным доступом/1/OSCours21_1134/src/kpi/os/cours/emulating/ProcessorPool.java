package kpi.os.cours.emulating;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import kpi.os.cours.graph.Cluster;
import kpi.os.cours.graph.ClusterPool;
import kpi.os.cours.graph.Task;
import kpi.os.cours.graph.TaskGraph;

public class ProcessorPool {
	HashMap<Cluster, Processor> table;
	private ClusterPool genPool, pool;
	
	public ProcessorPool(TaskGraph graph, ClusterPool genPool) {
		this.pool = getFullPool();
		
		processors = new ArrayList<Processor>();
		
		int i = 0;
		for (Cluster cl : pool.getClusters()) {
			ArrayList<Task> tasks = new ArrayList<Task>();
			
			for (Task t : cl.getTasks()) {
				tasks.add(t);
			}
			
			processors.add(new Processor(i, tasks));
			i++;
		}
	}
	
	public String toString() {
		Collection<Processor> col = table.values();
		
		String str = "";
		
		for (Processor p : col) {
			str += p;
		}
		
		return str;
	}
}
