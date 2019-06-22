package edu.editor.algorithm.model.component.block;

import java.awt.Color;
import java.awt.Graphics2D;
import java.util.ArrayList;

public class MultiBlock extends AbstractBlock {
	
    private ArrayList<AbstractBlock> listBlockCopy;
    private ArrayList<Connection> listConnectionCopy;
    
	public MultiBlock(int x, int y, String value) {
		super(x, y, value);
	}
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5629487356215685713L;

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

	public void setListBlockCopy(ArrayList<AbstractBlock> listBlockCopy) {
		this.listBlockCopy = listBlockCopy;
		for (int i = 1; i < listBlockCopy.size(); i++) {
			listBlockCopy.get(i).setCenter(
					listBlockCopy.get(i).getCenterX() - listBlockCopy.get(0).getCenterX(),
					listBlockCopy.get(i).getCenterY() - listBlockCopy.get(0).getCenterY());
		}
	}

	public ArrayList<AbstractBlock> getListBlockCopy() {
		return listBlockCopy;
	}

	public void setListConnectionCopy(ArrayList<Connection> listConnectionCopy) {
		this.listConnectionCopy = listConnectionCopy;
	}

	public ArrayList<Connection> getListConnectionCopy() {
		return listConnectionCopy;
	}

}
