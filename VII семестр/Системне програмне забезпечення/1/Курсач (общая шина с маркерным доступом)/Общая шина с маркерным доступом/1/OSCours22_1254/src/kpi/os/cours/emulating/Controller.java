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
		
		int marker = 0;
		procPool.getProcessor(0).giveMarker();
		
		int i = 0;
		while (!procPool.allFinished()) {
			proc.makeStep();
			proc = procPool.nextProc();

			i++;
			if (i % procPool.getProcCount() == 0) {
				i = 0;
				if (procPool.getProcessor(marker).takeMarker()) {
					marker = procPool.getNextProcNum(marker);
					procPool.getProcessor(marker).giveMarker();
				}
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
