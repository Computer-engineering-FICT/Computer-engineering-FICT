package kpi.os.cours.emulating;

import java.util.ArrayList;

import kpi.os.cours.forms.DiagramData;
import kpi.os.cours.forms.DiagramLineData;
import kpi.os.cours.graph.ClusterPool;
import kpi.os.cours.graph.TaskGraph;

public class Controller {
	private ProcessorPool procPool;	
	
	public Controller(TaskGraph graph, ClusterPool genPool) {
		procPool = new ProcessorPool(graph, genPool); 
		
		//TEST OUTPUT
		System.out.println(procPool);
	}
	
	public DiagramData start() {
		Processor proc = procPool.getProcessor(0);
		boolean marker = true;
		
		while (!procPool.allFinished()) {
			if (marker) {
				proc.giveMarker();
				marker = false;
				
				proc.makeStep();
			} else {
				marker = proc.takeMarker();
				proc.makeStep();
			}
			
			proc = procPool.nextProc();
		}
		
		ArrayList<DiagramLineData> lines = new ArrayList<DiagramLineData>();
		
		for (Processor p : procPool.getProcessors()) {
			lines.add(new DiagramLineData("P" + p.getNum(), p.getHistory()));
		} 
		
		return new DiagramData(
				procPool.getOveralTime() + 2, 1, lines);
	}
}
