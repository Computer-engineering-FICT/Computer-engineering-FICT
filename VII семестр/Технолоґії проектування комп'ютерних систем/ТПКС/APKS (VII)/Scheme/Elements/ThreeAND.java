package Scheme.Elements;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;

public class ThreeAND extends Element {

	public ThreeAND(Connector Input1, Connector Input2, Connector Input3) {
		Inputs = new Connector[3];
		Inputs[0] = Input1;
		Inputs[1] = Input2;
		Inputs[2] = Input3;
		
		HEIGHT = 40; 
		WIDTH = 40;
			
		CenterPoint = new Point2D.Double();
		Shape = new Rectangle2D.Double();
		
		Name = "AND";
	}
	
	public void setOutput(Connector Output) {
		this.Output = Output;
	}
}
