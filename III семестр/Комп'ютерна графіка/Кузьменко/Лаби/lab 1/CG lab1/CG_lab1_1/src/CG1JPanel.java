import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.Area;
import java.awt.geom.GeneralPath;
import java.awt.geom.Point2D;

import javax.swing.JPanel;

@SuppressWarnings("serial")
public class CG1JPanel extends JPanel {

	public CG1JPanel() {
		setPreferredSize(new Dimension(1000, 600));
	}

	public void paintComponent(Graphics g) {
		drawTriangle(500, 300, g,true);
		drawTriangle(850, 300, g,true);
		drawTriangle(670, 540, g,false);
	}

	public Point2D drawTriangle(double x, double y, Graphics g1,boolean orient) {
		Graphics2D g2d = (Graphics2D) g1;
		/*
		 * h крок між трикутниками
		 */
		double h = 5;

		float[] dashPattern = { 10f, 10f, 10f, 10f, 10f, 30f, 30f, 30f, 10f };
		g2d.setStroke(new BasicStroke(0.5f, BasicStroke.CAP_ROUND,
				BasicStroke.JOIN_ROUND, 0.5f, dashPattern, 0));
		g2d.setStroke(new BasicStroke(0.5f, BasicStroke.CAP_ROUND,
				BasicStroke.JOIN_ROUND));

		Point2D a = new Point2D.Double(x, y);
		Point2D b = new Point2D.Double(x + 10, y);
		Point2D c = new Point2D.Double(x + 5, y + 10);
		
		GeneralPath triangle1 = new GeneralPath();
		GeneralPath triangle2 = new GeneralPath();
		Area area1 = new Area();
		Area area2 = new Area();

		GeneralPath triangleBuff = new GeneralPath();

		for (int i = 0; i < 10; i++) {
			triangle1 = new GeneralPath();
			for (int j = 0; j < 2; j++) {

				triangle1.moveTo(a.getX(), a.getY());
				triangle1.lineTo(b.getX(), b.getY());
				triangle1.lineTo(c.getX(), c.getY());
				triangle1.lineTo(a.getX(), a.getY());
				triangle1.closePath();
				if (j == 0) {
					triangleBuff = triangle1;
				}
				a.setLocation(a.getX() - h * Math.sqrt(3), a.getY() - h);
				b.setLocation(b.getX() + h * Math.sqrt(3), b.getY() - h);
				c.setLocation(c.getX(), c.getY() + h * Math.sqrt(2));
				if (j == 0) {
					area1 = new Area(triangle1);
					triangle2 = triangle1;

				}
				area2 = new Area(triangle1);
			}
			g2d.draw(area1);

			area1.exclusiveOr(area2);

			g2d.setColor(new Color(76, 88, 102));
			g2d.fill(area1);

			area1 = new Area(triangleBuff);
			area2 = new Area(triangle1);
			area2.exclusiveOr(area1);
			g2d.fill(area2);
			g2d.draw(area2);
			area1 = new Area(triangle1);
			area2 = new Area(triangle2);
			area1.intersect(area2);
			g2d.draw(area2);
			g2d.draw(area1);
			g2d.draw(area2);
		}
		return c;
	}

}
