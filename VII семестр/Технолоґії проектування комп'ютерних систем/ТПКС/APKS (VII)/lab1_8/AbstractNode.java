package lab1_8;

import java.awt.Graphics2D;
import java.awt.Point;
import java.awt.geom.Rectangle2D;
import java.io.Serializable;

public abstract class AbstractNode implements Serializable {

	private static final long serialVersionUID = -8336514791107618870L;
	
	protected Point Position;
	protected String Name;
	protected Rectangle2D ShapeSize;
	
	public Point getPosition() {
		
		return Position;
	}

	public void setPosition(int x, int y) {
		
		Position.setLocation(x, y);
	}
	
	public String getName() {
		
		return Name;
	}
	
	abstract public Point paint(Graphics2D g2, Point p);	
	abstract public boolean isPointBelongNode(Point p);
	abstract public boolean isPointAtTheLeftOfNodesCenter(Point p);
	abstract public boolean isPointAtTheRightOfNodesCenter(Point p);
}