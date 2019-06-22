package lab1_8;

import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Point;
import java.awt.geom.Rectangle2D;

public class LogicalNode extends AbstractNode {
	
	private static final long serialVersionUID = 1L;

	public static final String NAME_CHARACTER = "X";
	
	private int currentNumber;
	private int OnFalseArrowNumber;
	private int NameFontHeight = 0;

	public LogicalNode(int Number, int OFAN) {
		
		currentNumber = Number;
		
		OnFalseArrowNumber = OFAN;
		
		Name = NAME_CHARACTER+currentNumber;
	}

	public void setNumber(int Number) {
		
		currentNumber = Number;
		
		Name = NAME_CHARACTER+currentNumber;
	}
	
	public int getNumber() {
		
		return currentNumber;
	}
	
	public void setOnFalseArrowNumber(int OFAN) {
		
		OnFalseArrowNumber = OFAN;
	}
	
	public int getOnFalseArrowNumber() {
		
		return OnFalseArrowNumber;
	}
	
	@Override
	public Point paint(Graphics2D g2, Point p) {
		
		Position = p;
		
		Rectangle2D NBounds = g2.getFont().getStringBounds(Name, g2.getFontRenderContext());
		NameFontHeight = (int) NBounds.getHeight();
		
		Font tmp = g2.getFont();
		g2.setFont(new Font("SansSerif", Font.PLAIN, 18));
		
		Rectangle2D OFANBounds = g2.getFont().getStringBounds(Integer.toString(OnFalseArrowNumber), g2.getFontRenderContext());
		
		ShapeSize = new Rectangle2D.Double(0, 0, Math.max(NBounds.getWidth(), OFANBounds.getWidth()), NBounds.getHeight()+2*OFANBounds.getHeight());
		
		g2.draw(Arrow2D.getArrow(new Point((int)(getPosition().getX()+ShapeSize.getCenterX()), (int)getPosition().getY()), new Point((int)(getPosition().getX()+ShapeSize.getCenterX()), (int)(getPosition().getY()+OFANBounds.getHeight())), 8, 30));
		
		g2.drawString(Integer.toString(OnFalseArrowNumber), (float)(Position.getX()+ShapeSize.getCenterX()-OFANBounds.getCenterX()), (float)(Position.getY()+2*OFANBounds.getHeight()));
		
		g2.setFont(tmp);
		g2.drawString(Name, (float)(Position.getX()+ShapeSize.getCenterX()-NBounds.getCenterX()), (float)Position.getY());
		
		return new Point((int)(p.getX()+ShapeSize.getWidth()), (int)p.getY());
	}

	@Override
	public boolean isPointBelongNode(Point p) {
		
		if ((p.getX()>=Position.getX()) && (p.getX()<=Position.getX()+ShapeSize.getWidth()) && (p.getY()<=Position.getY()-NameFontHeight+ShapeSize.getHeight()) && (p.getY()>=Position.getY()-NameFontHeight))
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
