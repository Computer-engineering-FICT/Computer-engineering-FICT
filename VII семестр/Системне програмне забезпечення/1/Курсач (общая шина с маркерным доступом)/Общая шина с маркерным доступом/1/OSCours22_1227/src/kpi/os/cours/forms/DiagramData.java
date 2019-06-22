package kpi.os.cours.forms;

import java.util.ArrayList;

public class DiagramData {
	private int stepScale;
	private int stepCount;
	private ArrayList<DiagramLineData> lines;
	
	public DiagramData(
			int stepCount,
			int stepScale,
			ArrayList<DiagramLineData> lines) 
	{
		this.stepCount = stepCount;
		this.stepScale = stepScale;
		this.lines = lines;
	}
	
	public int getStepScale() {
		return stepScale;
	}

	public int getStepCount() {
		return stepCount;
	}
	
	public ArrayList<DiagramLineData> getLines() {
		return lines;
	}
}
