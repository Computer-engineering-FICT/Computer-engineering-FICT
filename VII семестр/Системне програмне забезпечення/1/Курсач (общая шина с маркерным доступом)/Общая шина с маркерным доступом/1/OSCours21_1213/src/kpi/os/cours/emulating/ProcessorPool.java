package kpi.os.cours.emulating;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

import kpi.os.cours.graph.Cluster;
import kpi.os.cours.graph.ClusterPool;
import kpi.os.cours.graph.Task;
import kpi.os.cours.graph.TaskGraph;

public class ProcessorPool {
	HashMap<Cluster, Processor> table;
	private ClusterPool pool;
	private TaskGraph graph;
	private ArrayList<Processor> processors;
	
	public ProcessorPool(TaskGraph graph, ClusterPool genPool) {
		this.graph = graph;
		
		this.pool = getFullPool(genPool);
		
		table = new HashMap<Cluster, Processor>();
		
		int i = 0;
		for (Cluster cl : pool.getClusters()) {
			ArrayList<Task> tasks = new ArrayList<Task>();
			
			for (Task t : cl.getTasks()) {
				tasks.add(t);
			}
			
			table.put(cl, new Processor(i, tasks));
			i++;
		}
		
		processors = new ArrayList<Processor>(table.values());
		
		Collections.sort(processors, new Comparator<Processor>() {

			@Override
			public int compare(Processor o1, Processor o2) {
				return o1.getNum() - o2.getNum();
			}
		});
	}
	
	private ClusterPool getFullPool(ClusterPool genPool) {
		ClusterPool fullPool = genPool.clone();
		
		for (Task t : graph.getTasks()) {
			if (!genPool.contains(t)) {
				fullPool.addTask(t, t);
			}
		}
		
		return fullPool;
	}
	
	public Processor getProcessor(int i) {
		return processors.get(i);
	}
	
	public int getProcCount() {
		return table.size();
	}
	
	public String toString() {		
		String str = "Processors:\n";
		
		for (Processor p : processors) {
			str += p + "\n\n";
		}
		
		return str;
	}
	
	public TaskGraph getGraph() {
		return graph;
	}
	
	public ClusterPool getPool() {
		return pool;
	}
}
