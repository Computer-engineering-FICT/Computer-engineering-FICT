package kpi.os.cours.forms;

import java.awt.Color;

public enum IntervalType {
	PROCESSING,	//thin line 
	SENDING, 	//fat line, color A
	RECEIVING, 	//fat line, color B
	MARKER;		//small bar, only "begin" used
	
	public static Color PROCESSING_COLOR 	= new Color(102, 205, 0);
	public static Color SENDING_COLOR 		= new Color(99, 184, 255);
	public static Color RECEIVING_COLOR 	= new Color(255, 215, 0);
	public static Color MARKER_COLOR 		= Color.RED;
}
