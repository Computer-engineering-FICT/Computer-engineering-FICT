package kpi.os.cours.graph;

public class Edge {
	private int weight;
	private Task end;
	
	public Edge(int weight, Task end) {
		super();
		this.weight = weight;
		this.end = end;
	}

	public int getWeight() {
		return weight;
	}

	public Task getEnd() {
		return end;
	}
	
	public String toString() {
		return "to " + end.getNum() + " W = " + weight;
	}
}
