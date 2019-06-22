package lab1_8;

import java.awt.Graphics2D;
import java.awt.Point;

public class OpenBracketNode extends AbstractNode {
	
	private static final long serialVersionUID = 1L;
	
	public static final String NAME_CHARACTER = "(";

	public OpenBracketNode() {

		Name = NAME_CHARACTER;
	}

	@Override
	public Point paint(Graphics2D g2, Point p) {
		
		Position = p;
		
		g2.drawString(Name, (float)Position.getX(), (float)Position.getY());
		
		ShapeSize = g2.getFont().getStringBounds(Name, g2.getFontRenderContext());
		
		return new Point((int)(p.getX()+ShapeSize.getWidth()), (int)p.getY());
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