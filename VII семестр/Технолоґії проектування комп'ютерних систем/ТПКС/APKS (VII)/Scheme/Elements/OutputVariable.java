package Scheme.Elements;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;

public class OutputVariable extends Element {
	
	public OutputVariable() {
		Inputs = new Connector[1];
	}

	public void setInput(Connector Input) {
		Inputs[0] = Input;
		
		HEIGHT = 20; 
		WIDTH =  40;
		
		CenterPoint = new Point2D.Double();
		Shape = new Rectangle2D.Double();
		
		Name = Input.getName();
	}
}