package kpi.os.cours.graph;

import java.util.ArrayList;

public class Task implements Comparable<Task> {
	private int num;		//task number
	private ArrayList<Edge> outEdges, inEdges;
	private int weight;		//processing level
	private int path;		//b-level
	private int statPath; 	//static level
	
	
	public Task(int num, int weight) {
		this.num = num;
		this.weight = weight;
		outEdges = new ArrayList<Edge>();
		inEdges = new ArrayList<Edge>();
		path = 0;
	}

	public void addInEdge(Edge edge) {
		inEdges.add(edge);
	}
	
	public void addOutEdge(Edge edge) {
		outEdges.add(edge);
	}
	
	public int getNum() {
		return num;
	}

	public ArrayList<Edge> getInEdges() {
		return inEdges;
	}

	public ArrayList<Edge> getOutEdges() {
		return outEdges;
	}
	
	public int getWeight() {
		return weight;
	}

	public int getPath() {
		return path;
	}

	public void setPath(int path) {
		this.path = path;
	}

	public int getStatPath() {
		return statPath;
	}

	public void setStatPath(int statPath) {
		this.statPath = statPath;
	}

	public String toString() {
		return Integer.toString(num) + "\n" + Integer.toString(weight);
	}

	@Override
	public int compareTo(Task o) {
		Task o1 = this;
		Task o2 = o;
		
		if (o2.getStatPath() - o1.getStatPath() != 0) {
			return o2.getStatPath() - o1.getStatPath();
		} else {
			return o1.getNum() - o2.getNum();
		}
	}
}
