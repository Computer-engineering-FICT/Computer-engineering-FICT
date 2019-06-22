package lab1_8;

import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Point;
import java.awt.geom.Rectangle2D;

public class OutArrowNode extends AbstractNode {

	private static final long serialVersionUID = 1L;
	
	private int currentNumber;

	public OutArrowNode(int Number) {

		currentNumber = Number;
		
		Name = Integer.toString(currentNumber);
	}

	@Override
	public Point paint(Graphics2D g2, Point p) {
		
		Position = p;

		Font tmp = g2.getFont();
		g2.setFont(new Font("SansSerif", Font.PLAIN, 18));
		Rectangle2D NBounds = g2.getFont().getStringBounds(Integer.toString(currentNumber), g2.getFontRenderContext());
		
		g2.draw(Arrow2D.getArrow(new Point((int)(getPosition().getX()+NBounds.getCenterX()), (int)getPosition().getY()), new Point((int)(getPosition().getX()+NBounds.getCenterX()), (int)(getPosition().getY()-NBounds.getHeight())), 8, 30));
		
		g2.drawString(Integer.toString(currentNumber), (float) Position.getX(), (float)(Position.getY()-NBounds.getHeight()));
		
		g2.setFont(tmp);
		
		ShapeSize = new Rectangle2D.Double(0, 0, NBounds.getWidth(), NBounds.getHeight()+NBounds.getHeight());
		
		return new Point((int)(p.getX()+ShapeSize.getWidth()), (int)p.getY());
	}

	public void setNumber(int Number) {
		
		currentNumber = Number;
		
		Name = Integer.toString(currentNumber);
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
