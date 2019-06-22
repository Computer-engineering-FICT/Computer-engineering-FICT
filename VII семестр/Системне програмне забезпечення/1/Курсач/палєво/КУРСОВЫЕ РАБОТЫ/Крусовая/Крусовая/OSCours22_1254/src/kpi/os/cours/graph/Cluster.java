package kpi.os.cours.graph;

import java.util.Comparator;
import java.util.TreeSet;

/**
 *
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class Cluster {
	private TreeSet<Task> tasks;
	
	public Cluster() {
		tasks = new TreeSet<Task>(new Comparator<Task>() {

			@Override
			public int compare(Task o1, Task o2) {
				if (o2.getStatPath() - o1.getStatPath() != 0) {
					return o2.getStatPath() - o1.getStatPath();
				} else {
					return o1.getNum() - o2.getNum();
				}
				
			}
		});
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
		
		int sum = 0;
		
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
	
	public int getPathBeetwen(Task t1, Task t2) {
		if (!tasks.contains(t1) || !tasks.contains(t2)) {
			return -1;
		}
		
		int sum = 0;
		
		for (Task t : tasks) {
			if (	t1.compareTo(t) < 0 
				&&  t2.compareTo(t) > 0) 
			{
				sum += t.getWeight();
			}
		}
		
		return sum;
	}
	
	public Cluster clone() {
		TreeSet<Task> cloneTasks = (TreeSet<Task>) tasks.clone();
		Cluster clone = new Cluster();
		clone.setTasks(cloneTasks);
		return clone;
	}

	public void setTasks(TreeSet<Task> tasks) {
		this.tasks = tasks;
	}
	
	public TreeSet<Task> getTasks() {
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
