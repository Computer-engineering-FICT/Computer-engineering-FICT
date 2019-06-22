package lab1_8;

import java.awt.Graphics2D;
import java.awt.Point;

public class ArithmeticalNode extends AbstractNode {
	
	private static final long serialVersionUID = 1L;

	public static final String NAME_CHARACTER = "Y";
	
	private int currentNumber;

	public ArithmeticalNode(int Number) {

		currentNumber = Number;

		Name = NAME_CHARACTER+currentNumber;
	}

	@Override
	public Point paint(Graphics2D g2, Point p) {
		
		Position = p;
		
		g2.drawString(Name, (float)Position.getX(), (float)Position.getY());
		
		ShapeSize = g2.getFont().getStringBounds(Name, g2.getFontRenderContext());
		
		return new Point((int)(p.getX()+ShapeSize.getWidth()), (int)p.getY());
	}

	public void setNumber(int Number) {
		
		currentNumber = Number;
		
		Name = NAME_CHARACTER+currentNumber;
	}
	
	public int getNumber() {
		
		return currentNumber;
	}
	
	@Override
	public boolean isPointBelongNode(Point p) {
		
		if ((p.getX()>=Position.getX()) && (p.getX()<=Position.getX()+ShapeSize.getWidth()) && (p.getY()<=Position.getY()) && (p.getY()>=Position.getY()-ShapeSize.getHeight()))
			return true;
		else
			return false;
	}

	@Override
	public boolean isPointAtTheLeftOfNodesCenter(Point p) {
		
		if (p.getX()<(Position.getX()+ShapeSize.getCenterX()))
			return true;
		else
			return false;
	}

	@Override
	public boolean isPointAtTheRightOfNodesCenter(Point p) {
			
		if (p.getX()>(Position.getX()+ShapeSize.getCenterX()))
			return true;
		else
			return false;
	}
}
