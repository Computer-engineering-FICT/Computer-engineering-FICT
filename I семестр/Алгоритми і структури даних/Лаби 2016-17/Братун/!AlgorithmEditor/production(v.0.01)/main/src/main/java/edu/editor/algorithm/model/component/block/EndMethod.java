package edu.editor.algorithm.model.component.block;

import java.awt.Color;
import java.awt.Graphics2D;

import edu.editor.algorithm.view.panel.AlgorithmPanel;

public class EndMethod extends End {

	public EndMethod(int x, int y) {
		super(x, y);
		// TODO Auto-generated constructor stub
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 3030529889583551356L;
	
	@Override
	public void draw(Graphics2D g2d) {
		super.draw(g2d);
		g2d.setColor(Color.BLACK);
		g2d.drawRect(getPoint1X()+AlgorithmPanel.widthCell, (getPoint1Y() + getCenterY())/2, 
				getWidth()-AlgorithmPanel.widthCell*2, getHeight()/2);
	}

}
