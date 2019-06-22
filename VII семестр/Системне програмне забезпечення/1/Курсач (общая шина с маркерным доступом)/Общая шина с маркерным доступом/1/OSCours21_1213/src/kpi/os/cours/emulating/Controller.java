package kpi.os.cours.emulating;

import kpi.os.cours.graph.ClusterPool;
import kpi.os.cours.graph.TaskGraph;

public class Controller {
	private ProcessorPool procPool;	
	
	public Controller(TaskGraph graph, ClusterPool genPool) {
		procPool = new ProcessorPool(graph, genPool); 
		
		//TEST OUTPUT
		System.out.println(procPool);
	}
}
