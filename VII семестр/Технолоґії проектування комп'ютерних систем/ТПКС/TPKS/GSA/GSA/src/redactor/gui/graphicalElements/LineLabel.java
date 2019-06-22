package redactor.gui.graphicalElements;

import java.awt.*;
import java.awt.geom.Rectangle2D;

/**
 * LineTool visual marker.
 */

public class LineLabel {
    private int x, y;
    private String id;
    private boolean xvisible, yvisible;

	public int getX() {
		return x;
	}
	public int getY() {
		return y;
	}
	public void setX(final int x, final int width) {
		this.x = x;
		if (x > width) {
			xvisible = false;
		} else {
			xvisible = true;
		}
	}
	public void setY(final int y, final int height) {
		this.y = y;
		if (y > height) {
			yvisible = false;
		} else {
			yvisible = true;
		}
	}
	public void setID(final String id) {
		this.id = id;
	}
	public void setVisible(final boolean b) {
		xvisible = b;
		yvisible = b;
	}
	public void draw(final Graphics2D g2) {
		if ((xvisible) && (yvisible)) {
			Color color = g2.getColor();
			g2.setColor(Color.RED);
			g2.draw(new Rectangle2D.Double(x - 1, y - 1, 2, 2));
			g2.drawString(id , x + 1, y - 4);
			g2.setColor(color);
		}
	}
	public LineLabel(final String id) {
		this.x = 0;
		this.y = 0;
		this.id = id;
		xvisible = false;
		yvisible = false;
	}

}
