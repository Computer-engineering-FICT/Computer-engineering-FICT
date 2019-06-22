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
		Processor proc;
		Processor marker = null;
		
		while (procPool.nextProc() != null) {
			proc = procPool.getCurrentProc();
			
			if (marker == null) {
				proc.giveMarker();
				
				proc.makeStep();
				
				Pair trans = proc.takeMarker(); 
				if (trans != null) {
					marker = proc;
					Processor receiver = procPool.getTaskProcessor(trans.edge.getEnd());
					receiver.forceReceive(trans);
				}
			} else 
			if (marker == proc) {
				proc.makeStep();
				Pair edge = proc.takeMarker();
				
				if (edge == null) {
					marker = null;
				}
			} else {
				proc.makeStep();
			}
		}
		
		ArrayList<DiagramLineData> lines = new ArrayList<DiagramLineData>();
		
		for (Processor p : procPool.getProcessors()) {
			lines.add(new DiagramLineData("P" + p.getNum(), p.getHistory()));
		} 
		
		return new DiagramData(
				procPool.getOveralTime() + 2, 1, lines);
	}
}
