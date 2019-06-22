package edu.editor.algorithm.model.component.block;

import java.awt.Color;
import java.awt.Graphics2D;

public class Begin extends AbstractBlock {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Begin(int x, int y) {
		super(x, y);
		setValue("BEGIN");
	}

	@Override
	public void draw(Graphics2D g2d) {
		g2d.drawLine(getCenterX(), getCenterY(), getCenterX(), getPoint2Y());
		g2d.setColor(Color.WHITE);
		g2d.fillRoundRect(getPoint1X(), (getPoint1Y() + getCenterY())/2, getWidth(), getHeight()/2, getHeight()/2, getHeight()/2);
		g2d.setColor(Color.BLACK);
		g2d.drawRoundRect(getPoint1X(), (getPoint1Y() + getCenterY())/2, getWidth(), getHeight()/2, getHeight()/2, getHeight()/2);
		drawValue(g2d);
		
		if (getOutputConnection()==null){
			 g2d.setColor(Color.RED);
			 g2d.drawRect(getPoint1X()-5, (getPoint1Y() + getCenterY())/2-5, getWidth()+10, getHeight()/2+10);
		}
	}
}
