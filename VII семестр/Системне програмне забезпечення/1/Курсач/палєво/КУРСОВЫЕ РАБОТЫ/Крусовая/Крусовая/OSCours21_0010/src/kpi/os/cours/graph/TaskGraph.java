package kpi.os.cours.graph;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;

/**
 *
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class TaskGraph {
	private ArrayList<Task> tasks;
	
	//Root element (bottom element)
	private Task root;
	
	public TaskGraph(ArrayList<Task> nodes) {
		this.tasks = nodes;
		
		root = getRootNodes().get(0);
	}
	
	private ArrayList<Task> getRootNodes() {
		ArrayList<Task> rez = new ArrayList<Task>();
		
		for (Task node : tasks) {
			if (node.getOutEdges().size() == 0) {
				rez.add(node);
			}
		}
		
		return rez;
	} 
	
	//========= Processing of critical path and b-level =========
	private int recursPass(
			Task curTask,  
			ClusterPool pool) 
	{
		Cluster currentCl, childCl;
		
		for (Edge t : curTask.getOutEdges()) {
			currentCl = pool.getTaskCluster(curTask);
			childCl	= pool.getTaskCluster(t.getEnd());
			
			//========== Calculationg of new path length===
			int newPath = 0;

			 
			//if tasks in one cluster
			if (currentCl != null && currentCl.equals(childCl)) {
				newPath =	curTask.getWeight() +
							currentCl.getPathBeetwen(curTask, t.getEnd()) + 
							t.getEnd().getPath();				
			} else {
			//if tasks in different clusters
				newPath =	curTask.getWeight() +
							t.getWeight() + 
							t.getEnd().getPath();
			}
			//============================================
			
			//If new path bigger then old one - replace old
			if (curTask.getPath() < newPath) 
			{
				curTask.setPath(newPath);
			}
		}
		
		int max = curTask.getPath();
		
		for (Edge t : curTask.getInEdges()) {
			int temp = recursPass(t.getEnd(), pool); 
			
			if (max < temp) {
				max = temp;
			}
		}
		
		return max;
	}	
	
	public int getCriticalPass(ClusterPool pool) {
		for (Task task : tasks) {
			task.setPath(0);
		}
		
		int max = 0;
		int temp;
		ArrayList<Task> roots = getRootNodes();
		
		for (Task t : roots) {
			t.setPath(t.getWeight());
			temp = recursPass(t, pool);
			if (temp > max) {
				max = temp;
			}
		}
		root.setPath(root.getWeight());
		
		return max;
	}
	//==============================================
	
	//========= Processing of static level =========
	private void recursStaticLev(Task curTask, HashSet<Task> visited) {
		visited.add(curTask);
		
		for (Edge t : curTask.getOutEdges()) {
			if (curTask.getStatPath() < 
					t.getEnd().getStatPath() + curTask.getWeight()) 
			{
				curTask.setStatPath(t.getEnd().getStatPath() 
						+ curTask.getWeight());
			}
		}
		
		for (Edge t : curTask.getInEdges()) {
			recursStaticLev(t.getEnd(), visited); 
		}
	}	
	
	public void processStaticLevel() {	
		root.setStatPath(root.getWeight());
		
		HashSet<Task> visited = new HashSet<Task>();
		recursStaticLev(root, visited);
	}
	//==============================================
	
	//================= EZ algorithm =============== 
	private class Pair {
		private Task task;
		private Edge edge;
		
		public Pair(Task task, Edge edge) {
			super();
			this.task = task;
			this.edge = edge;
		}

		public Task getTask() {
			return task;
		}

		public Edge getEdge() {
			return edge;
		}
		
		public String toString() {
			return 	"from " + task.getNum() + 
					" to " + edge.getEnd().getNum() +
					" W = " + edge.getWeight();
		}
		
		public Task getStart() {
			return task;
		}
		
		public Task getEnd() {
			return edge.getEnd();
		}
	}
	
	public ClusterPool makeReduction() {
		ClusterPool pool = new ClusterPool();
		ClusterPool tempPool;
		
		ArrayList<Pair> pairs = new ArrayList<Pair>(); 
		
		//Get list of all edges
		for (Task t : tasks) {
			for (Edge e : t.getOutEdges()) {
				pairs.add(new Pair(t, e));
			}
		}
		
		//Sort edge list by descending of edges weight
		Collections.sort(pairs, new Comparator<Pair>() {
			@Override
			public int compare(Pair o1, Pair o2) {
				return o2.getEdge().getWeight() - o1.getEdge().getWeight(); 
			}
		});

		//???TEST OUTPUT
		for (Pair p : pairs) {
			System.out.println(p);
		}
		
		for (Pair p : pairs) {
			tempPool = pool.clone();
			
			Cluster startCl = tempPool.getTaskCluster(p.getStart());
			Cluster endCl	= tempPool.getTaskCluster(p.getEnd());
			
			//if start and end edges aren't in one cluster already
			if (startCl == null || !startCl.equals(endCl)) {
				tempPool.addTask(p.getStart(), p.getEnd());
			}
			
			int oldCritPath = getCriticalPass(pool);
			int newCritPath = getCriticalPass(tempPool);
			
			//if new critical path isn't worse then old one - accept 
			//new cluster 
			if (oldCritPath >= newCritPath) {
				pool = tempPool.clone();
			}
		}
		
		return pool;
	}
	//============================================
	
	public ArrayList<Task> getTasks() {
		return tasks;
	}
	
	public void setTasks(ArrayList<Task> tasks) {
		this.tasks = tasks;
	}
	
	public String toString() {
    	String str = "";
		
		for (Task d : tasks) {
    		str +=	"Node " + d.getNum() + 
    				" W = " + d.getWeight() +
    				" Path = " + d.getPath() + 
    				" Stat = " + d.getStatPath() + "\n";
    		
    		str += "IN:\n";
    		for (Edge e : d.getInEdges()) {
    			str += e + "\n";
    		}
    		
    		str += "OUT:\n";
    		for (Edge e : d.getOutEdges()) {
    			str += e + "\n";
    		}
    		
    		str += "\n";
    	}
		
		return str;
	}
	
	public TaskGraph clone() {	
		ArrayList<Task> cloneTasks = new ArrayList<Task>(); 
		
		HashMap<Task, Task> corresp = new HashMap<Task, Task>();
		
		for (Task t : tasks) {
			Task tempT = new Task(t.getNum(), t.getWeight());
			tempT.setPath(t.getPath());
			tempT.setStatPath(t.getStatPath());
			
			cloneTasks.add(t);
			corresp.put(t, tempT);
		}
		
		for (Task t : tasks) {
			Task tempT = corresp.get(t);
			
			ArrayList<Edge> in = t.getInEdges();
			
			for (Edge e : in) {
				Task end = corresp.get(e.getEnd());
				Edge temp = new Edge(e.getWeight(), end);
				tempT.addInEdge(temp);
			}
			
			ArrayList<Edge> out = t.getOutEdges();
			
			for (Edge e : out) {
				Task end = corresp.get(e.getEnd());
				Edge temp = new Edge(e.getWeight(), end);
				tempT.addOutEdge(temp);
			}
		}
		
		return new TaskGraph(cloneTasks);
	}
}
