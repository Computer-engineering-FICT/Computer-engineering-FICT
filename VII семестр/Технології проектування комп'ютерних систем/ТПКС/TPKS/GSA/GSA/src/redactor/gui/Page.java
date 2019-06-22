package redactor.gui;

import redactor.TestMain;

import java.awt.*;
import java.awt.geom.Line2D;
import java.awt.geom.Rectangle2D;

/**
 * Draws empty page.
 */

public class Page {

	public void draw(final Graphics2D g2) {
		Color color = g2.getColor();
		g2.setColor(Color.WHITE);
		g2.fill(new Rectangle2D.Double(0, 0, width, height));
		if (grid) {
			g2.setColor(new Color(230, 230, 230));
			int x = 0;
			int y = TestMain.gridScale;
			while (y < height) {
				g2.draw(new Line2D.Double(x, y, x + width, y));
				y += TestMain.gridScale;
			}
			x = TestMain.gridScale;
			y = 0;
			while (x < width) {
				g2.draw(new Line2D.Double(x, y, x, y + height));
				x += TestMain.gridScale;
			}
		}
		if (line) {

		}
		g2.setColor(color);
		g2.draw(new Rectangle2D.Double(0, 0, width, height));
	}
	public int getWidth() {
		return width;
	}
	public int getHeight() {
		return height;
	}
	public void setWidth(final int width) {
		this.width = width;
	}
	public void setHeight(final int height) {
		this.height = height;
	}
	public Page(final int width, final int heigth) {
		this.width = width;
		this.height = heigth;
		grid = true;
		line = false;
	}
	public void setGridVisible(final boolean grid) {
		this.grid = grid;
	}
	public boolean isGridVisible() {
		return grid;
	}
	public void setLineVisible(final boolean line) {
		this.line = line;
	}
	private int width, height;
	private boolean grid, line;
}
