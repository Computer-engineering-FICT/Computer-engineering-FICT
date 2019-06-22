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
	private int overalTime = 0;
	
	private int currProc;
	
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
			
			table.put(cl, new Processor(i, tasks, this));
			i++;
		}
		
		processors = new ArrayList<Processor>(table.values());
		currProc = 0;
		
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
	
	/**
	 * Processor which process "task"
	 * @param task -
	 * @return	Processor which process "task"
	 */
	public Processor getTaskProcessor(Task task) {
		for (Cluster cl : pool.getClusters()) {
			if (cl.contains(task)) {
				return table.get(cl);
			}
		}
		
		return null;
	}
	
	public Processor getProcessor(int i) {
		return processors.get(i);
	}
	
	public int getProcCount() {
		return table.size();
	}
	
	public Processor getCurrentProc() {
		return processors.get(currProc);
	}
	
	public int getNextProcNum(int currProc) {
		int next = currProc + 1;  
		
		if (next == processors.size()) {
			next = 0;
			overalTime++;
		}
		
		return next;
	}
	
	public boolean allFinished() {
		for (Processor p : processors) {
			if (!p.isFinished()) {
				return false;
			}
		}
		
		return true;
	}
	
	public Processor nextProc() {
		currProc = getNextProcNum(currProc);
		
		return processors.get(currProc);
	}
	
	public String toString() {		
		String str = "Processors:\n";
		
		for (Processor p : processors) {
			str += p + "\n\n";
		}
		
		return str;
	}
	
	public ArrayList<Processor> getProcessors() {
		return processors;
	}
	
	public int getOveralTime() {
		return overalTime;
	}
	
	public TaskGraph getGraph() {
		return graph;
	}
	
	public ClusterPool getPool() {
		return pool;
	}
}
