package kpi.os.cours.graph;

import java.util.Collections;
import java.util.HashSet;

/**
 *
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class Cluster {
	private HashSet<Task> tasks;
	
	public Cluster() {
		tasks = new HashSet<Task>();
	}
	
	public boolean contains(Task task) {
		return tasks.contains(task);
	}
	
	public void addTask(Task task) {
		tasks.add(task);
	}
	
	public int getOveralWeight() {
		int sum = 0;
		
		for (Task t : tasks) {
			sum += t.getWeight();
		}
		
		return sum;
	}
	
	/**
	 * Getting sum weight of tasks which will have been processed before task
	 * "task"  
	 * @param task task - limiter
	 * @return	sum weight of tasks which will have been processed before task
	 * "task". If task isn't in this cluster - return -1  
	 */
	public int getAboveWeight(Task task) {
		if (!tasks.contains(task)) 
			return -1;
		
		int sum = task.getWeight();
		
		for (Task t : tasks) {
			if ( (t.getStatPath() > task.getStatPath()) || 
				  (t.getStatPath() == task.getStatPath() 
				   && t.getNum() > task.getNum()) )
			{
				sum += t.getWeight();	
			}
		}
			
		return sum;
	}
	
	public Cluster clone() {
		HashSet<Task> cloneTasks = (HashSet<Task>) tasks.clone();
		Cluster clone = new Cluster();
		clone.setTasks(cloneTasks);
		return clone;
	}

	public void setTasks(HashSet<Task> tasks) {
		this.tasks = tasks;
	}
	
	public HashSet<Task> getTasks() {
		return tasks;
	}
	
	public String toString() {
		String str = "Cluster: ";
		
		for (Task t : tasks) {
			str += t.getNum() + " ";
		}
		
		return str + "\n";
	}
}
