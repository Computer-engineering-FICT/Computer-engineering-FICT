package Scheme.Elements;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;

public class NOT extends Element {
	
	public NOT(Connector Input) {
		Inputs = new Connector[1];
		Inputs[0] = Input;
		
		HEIGHT = 20; 
		WIDTH = 30;
		
		CenterPoint = new Point2D.Double();
		Shape = new Rectangle2D.Double();
		
		Name = "NOT";
	}
	
	public void setOutput(Connector Output) {
		this.Output = Output;
	}
}
