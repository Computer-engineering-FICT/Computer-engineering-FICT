package kpi.os.cours.graph;

import java.util.ArrayList;
import java.util.HashSet;

/**
 *
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class ClusterPool {
	ArrayList<Cluster> clusters;
	
	public ClusterPool() {
		clusters = new ArrayList<Cluster>();
	}
	
	/**
	 * Adding of task to cluster. Key task point in which cluster Value key 
	 * will be put. If any container doesn't contain Key task - new cluster 
	 * will be created.
	 * @param key	key task	
	 * @param value	value task
	 */
	public void addTask(Task key, Task value) {
		Cluster keyCl = getTaskCluster(key);
		Cluster valueCl = getTaskCluster(value);
					
		if (keyCl == null && valueCl == null) {
			Cluster container = new Cluster();
			container.addTask(key);
			container.addTask(value);
			clusters.add(container);
		} else 
		
		if (keyCl != null && valueCl == null) {
			keyCl.addTask(value);
		} else 
		
		if (keyCl == null && valueCl != null) {
			valueCl.addTask(key);
		}
		
		if (keyCl != null && valueCl != null) {
			Cluster container = mergeClusters(keyCl, valueCl);
			clusters.remove(keyCl);
			clusters.remove(valueCl);
			clusters.add(container);
		}
	}
	
	public Cluster mergeClusters(Cluster cl1, Cluster cl2) {
		Cluster rez = new Cluster();
		
		HashSet<Task> sum = new HashSet<Task>();
		sum.addAll(cl1.getTasks());
		sum.addAll(cl2.getTasks());
		rez.setTasks(sum);
		
		return rez;
	}
	
	/**
	 * Searching cluster which contains task Task. If such cluster doesn't 
	 * exist - return NULL
	 * @param task 
	 * @return cluster which contains this task
	 */
	public Cluster getTaskCluster(Task task) {
		Cluster rez = null;
		
		for (Cluster c : clusters) {
			if (c.contains(task)) {
				rez = c;
				break;
			}
		}
		
		return rez;
	}
	
	public ClusterPool clone() {
		ArrayList<Cluster> cloneClust = new ArrayList<Cluster>();
		
		for (Cluster cl : clusters) {
			cloneClust.add(cl.clone());
		}
		
		ClusterPool clone = new ClusterPool();
		clone.setClusters(cloneClust);
		return clone;
	}

	public void setClusters(ArrayList<Cluster> clusters) {
		this.clusters = clusters;
	}
	
	public ArrayList<Cluster> getClusters() {
		return clusters;
	}
	
	public String toString() {
		String str = "";
		
		for (Cluster c : clusters) {
			str += c + "\n";
		}
		
		return str;
	}
}
