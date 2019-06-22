package edu.editor.algorithm.model.component.block;

import java.awt.Color;
import java.awt.Graphics2D;

public class Connector extends AbstractBlock {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8507017383605446986L;
	
	private final String SECOND_INPUT_CONNECTION = "SECOND_INPUT_CONNECTION";

	public Connector(int x, int y) {
		super(x, y);
		setWidth(getHeight());
	}
	
	public final Connection getSecondInputConnection() {
		return (Connection)blockProperties.get(SECOND_INPUT_CONNECTION);
	}
	
	public final void setSecondInputConnection(Connection input) {
		if (input != null) {
			blockProperties.put(SECOND_INPUT_CONNECTION, input);
		} else {
			blockProperties.remove(SECOND_INPUT_CONNECTION);
		}
	}
	
	@Override
	public void draw(Graphics2D g2d) {
		g2d.drawLine(getPoint1X(), getCenterY(), getPoint2X(), getCenterY());
		g2d.drawLine(getCenterX(), getCenterY(), getCenterX(), getPoint2Y());
		g2d.setColor(Color.WHITE);
		g2d.fillOval((getPoint1X()+getCenterX())/2, (getPoint1Y() + getCenterY())/2, getWidth()/2, getHeight()/2);
		g2d.setColor(Color.BLACK);
		g2d.drawOval((getPoint1X()+getCenterX())/2, (getPoint1Y() + getCenterY())/2, getWidth()/2, getHeight()/2);
		
		if (getOutputConnection()==null || getInputConnection()==null || getSecondInputConnection()==null){
			 g2d.setColor(Color.RED);
			 g2d.drawRect(getPoint1X()-5, (getPoint1Y() + getCenterY())/2-5, getWidth()+10, getHeight()/2+10);
		}
	}
	
	
}
