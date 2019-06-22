package edu.editor.algorithm.model.component.block;

import java.awt.Color;
import java.awt.Graphics2D;

public class Operator extends AbstractBlock {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2181119171192057762L;

	public Operator(int x, int y) {
		super(x, y);
	}

	public Operator(int x, int y, String value) {
		super(x, y, value);
	}

	@Override
	public void draw(Graphics2D g2d) {
		g2d.drawLine(getCenterX(), getPoint1Y(), getCenterX(), getPoint2Y());
		g2d.clearRect(getPoint1X(), (getPoint1Y() + getCenterY())/2, getWidth(), getHeight()/2);
		g2d.drawRect(getPoint1X(), (getPoint1Y() + getCenterY())/2, getWidth(), getHeight()/2);
		drawValue(g2d);
		if (getOutputConnection()==null || getInputConnection()==null ){
			 g2d.setColor(Color.RED);
			 g2d.drawRect(getPoint1X()-5, (getPoint1Y() + getCenterY())/2-5, getWidth()+10, getHeight()/2+10);
		}
	}
}
