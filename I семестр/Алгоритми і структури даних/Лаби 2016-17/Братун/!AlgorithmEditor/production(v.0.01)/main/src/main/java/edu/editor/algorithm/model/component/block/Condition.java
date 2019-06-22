package edu.editor.algorithm.model.component.block;

import java.awt.Color;
import java.awt.Graphics2D;

public class Condition extends AbstractBlock {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3142574428417897756L;
	
	private final String SECOND_OUTPUT_CONNECTION = "SECOND_OUTPUT_CONNECTION";
	
	public Condition(int x, int y) {
		super(x, y);
	}

	public Condition(int x, int y, String value) {
		super(x, y, value);
	}
	
	public final Connection getSecondOutputConnection() {
		return (Connection)blockProperties.get(SECOND_OUTPUT_CONNECTION);
	}
	
	public final void setSecondOutputConnection(Connection output) {
		if (output != null) {
			blockProperties.put(SECOND_OUTPUT_CONNECTION, output);
		} else {
			blockProperties.remove(SECOND_OUTPUT_CONNECTION);
		}
	}
	
	@Override
	public void draw(Graphics2D g2d) {
		g2d.drawLine(getPoint1X(), getCenterY(), getPoint2X(), getCenterY());
		g2d.drawLine(getCenterX(), getPoint1Y(), getCenterX(), getCenterY());
		
		
		int x[] = {(getPoint1X()+getCenterX())/2 - getWidth()/8, getCenterX(), (getCenterX()+getPoint2X())/2 + getWidth()/8, getCenterX()};
		int y[] = {getCenterY(), (getPoint1Y()+getCenterY())/2 - getHeight()/12, getCenterY(), (getCenterY()+getPoint2Y())/2 + getHeight()/12};
		g2d.setColor(Color.WHITE);
		g2d.fillPolygon(x, y, 4);
		g2d.setColor(Color.BLACK);
		g2d.drawPolygon(x, y, 4);
		
		drawValue(g2d);
		
		if (getOutputConnection()==null || getInputConnection()==null || getSecondOutputConnection()==null){
			 g2d.setColor(Color.RED);
			 g2d.drawRect(getPoint1X()-5, (getPoint1Y() + getCenterY())/2-5, getWidth()+10, getHeight()/2+10);
		}
	}
	
}
