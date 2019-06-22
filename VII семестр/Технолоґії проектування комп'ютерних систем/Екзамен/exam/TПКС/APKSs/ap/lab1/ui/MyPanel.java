/**
 * 
 */
package lab1.ui;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Point;
import java.util.ArrayList;

import javax.swing.JPanel;

import lab1.NeighbourCode;
import lab1.ServiceClass;
import lab1.mura.MuraManager;

/**
 * @author Dmytro Pogrebnjuk
 * 
 */
public class MyPanel extends JPanel {
	private static final long serialVersionUID = 2376708889111473400L;

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.swing.JComponent#paint(java.awt.Graphics)
	 */
	@Override
	public void paint(Graphics g) {
		super.paint(g);
		g.setPaintMode();
	
		ArrayList<TwoPoints> arr = ServiceClass.get_arrows();
		for (int i = 0; i < arr.size(); i++) {
			Point begin = arr.get(i).get_begin();
			Point end = arr.get(i).get_end();
			if (begin.equals(end)){
				g.setColor(Color.WHITE);
				g.drawOval(begin.x, begin.y, 30, 30);
			}
			int textX = (begin.x + end.x) / 2;
			int textY = (begin.y + end.y) / 2;
			String text = arr.get(i).get_text();
			if (text != null){
				g.setColor(Color.YELLOW);
				g.drawChars(text.toCharArray(), 0, text.length(),textX, textY);
			}
			int dx = 10;
			int dy = 3;
			int[] xPoints = { begin.x + dx, begin.x - dx, end.x };
			int[] yPoints = { begin.y + dy, begin.y - dy, end.y };
			g.setXORMode(Color.BLUE);
			g.setColor(Color.BLACK);
			g.fillPolygon(xPoints, yPoints, 3);
		}
		arr.clear();
		NeighbourCode.getInstance().setNeighbourCoding();
	}
}
