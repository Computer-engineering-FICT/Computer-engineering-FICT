package kpi.os.cours.forms;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;

import javax.swing.JPanel;

public class DiagramLine extends JPanel {
	private static final long serialVersionUID = -1906563162597516576L;

	public DiagramLine(int minWidth, int minHeight) {
		this.setMinimumSize(new Dimension(minWidth, minHeight));
	}
	
	@Override
	protected void paintComponent(Graphics g) {		
		super.paintComponent(g);
		
		Graphics2D g2 = (Graphics2D) g;
		
		Rectangle2D rect = new Rectangle2D.Double(5, 5, this.getWidth() - 10, this.getHeight() - 10);
		g2.draw(rect);
	}
}
