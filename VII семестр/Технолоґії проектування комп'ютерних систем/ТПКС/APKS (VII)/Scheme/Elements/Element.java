package Scheme.Elements;

import java.awt.Graphics2D;
import java.awt.geom.CubicCurve2D;
import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;

public abstract class Element {
	
	protected int HEIGHT; 
	protected int WIDTH;
	
	protected String Name;
	protected Rectangle2D NameBounds;

	protected Connector[] Inputs;
	protected Connector Output;
	
	protected Point2D CenterPoint;
	protected Rectangle2D Shape;
	
	public void paint(Graphics2D g2) {
		g2.draw(Shape);
		
		if (NameBounds == null) {
			NameBounds = g2.getFont().getStringBounds(Name, g2.getFontRenderContext());
		}
		
		g2.drawString(Name,
				(float) (CenterPoint.getX()-NameBounds.getCenterX()),
				(float) (CenterPoint.getY()-NameBounds.getCenterY()));
		
		if (Inputs == null)
			return;
		
		if (Inputs.length==1) {
			if (!Inputs[0].getOwner().equals(this)) {
				Point2D InputPoint = new Point2D.Double(
						CenterPoint.getX()-WIDTH/2,
						CenterPoint.getY());
				Point2D OutputPoint = Inputs[0].getOwner().getOutputPoint();
				paintCurve(InputPoint, OutputPoint, g2);
			}
		} else {
			for (int i = 0; i<Inputs.length; i++) {
				if (!Inputs[i].getOwner().equals(this)) {
					Point2D InputPoint = new Point2D.Double(
							CenterPoint.getX()-WIDTH/2,
							CenterPoint.getY()-HEIGHT/2+(HEIGHT/(Inputs.length+1))*(i+1));
					Point2D OutputPoint = Inputs[i].getOwner().getOutputPoint();
					paintCurve(InputPoint, OutputPoint, g2);
				}
			}
		}
	}
	
	private void paintCurve(Point2D InputPoint, Point2D OutputPoint, Graphics2D g2) {
		Double ControlInputPointX = InputPoint.getX()-WIDTH/2;
		Double ControlInputPointY = InputPoint.getY();
		
		Double ControlOutputPointX = OutputPoint.getX()+WIDTH/2;
		Double ControlOutputPointY = OutputPoint.getY();
		
		if (Math.abs(OutputPoint.getY()-InputPoint.getY())>50
				|| OutputPoint.getX()>InputPoint.getX()) {
			ControlInputPointX -= 75;
			ControlOutputPointX += 75;
		}
		
		if (OutputPoint.getX()>InputPoint.getX()) {
			if (Math.abs(OutputPoint.getY()-InputPoint.getY())>50) {
				if (OutputPoint.getY()<InputPoint.getY()) {
					ControlInputPointY -= 100;
					ControlOutputPointY += 100;
				} else {
					ControlInputPointY += 100;
					ControlOutputPointY -= 100;
				}
			} else {
				ControlInputPointY -= 50;
				ControlOutputPointY -= 50;
			}
		}
		
		Point2D ControlInputPoint = new Point2D.Double(ControlInputPointX, ControlInputPointY);
		Point2D ControlOutputPoint = new Point2D.Double(ControlOutputPointX, ControlOutputPointY);
		
		g2.draw(new CubicCurve2D.Double(InputPoint.getX(), InputPoint.getY(), ControlInputPoint.getX(), ControlInputPoint.getY(), ControlOutputPoint.getX(), ControlOutputPoint.getY(), OutputPoint.getX(), OutputPoint.getY()));
	}
	
	public Point2D getOutputPoint() {
		return new Point2D.Double(CenterPoint.getX()+WIDTH/2, CenterPoint.getY());
	}
	
	public boolean isContainsPoint(Point2D P) {
		return Shape.contains(P);
	}
	
	public Rectangle2D getShapeFrame() {
		return Shape.getFrame();
	}
	
	public void setLocation(double X, double Y) {
		
		CenterPoint.setLocation(X, Y);
		Shape.setFrame(CenterPoint.getX()-WIDTH/2, CenterPoint.getY()-HEIGHT/2, WIDTH, HEIGHT);
	}
	
	public void changeLocation(double ChangeX, double ChangeY) {
		CenterPoint.setLocation(CenterPoint.getX()+ChangeX, CenterPoint.getY()+ChangeY);
		Shape.setFrame(CenterPoint.getX()-WIDTH/2, CenterPoint.getY()-HEIGHT/2, WIDTH, HEIGHT);
	}
}
