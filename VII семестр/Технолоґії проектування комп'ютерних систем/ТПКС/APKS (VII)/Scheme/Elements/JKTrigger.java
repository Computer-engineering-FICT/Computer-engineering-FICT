package Scheme.Elements;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;

public class JKTrigger extends Element {

	public JKTrigger() {
		Inputs = new Connector[2];
		
		HEIGHT = 40;
		WIDTH = 30;
		CenterPoint = new Point2D.Double();
		Shape = new Rectangle2D.Double();
		
		Name = "JK";
	}
	
	public void setJ(Connector J) {
		Inputs[0] = J;
	}
	
	public void setK(Connector K) {
		Inputs[1] = K;
	}
	
	public void setQ(Connector Q) {
		Output = Q;
		Name += Q.getName().substring(1);
		NameBounds = null;
	}
	
	public Connector getQ() {
		return Output;
	}
}
