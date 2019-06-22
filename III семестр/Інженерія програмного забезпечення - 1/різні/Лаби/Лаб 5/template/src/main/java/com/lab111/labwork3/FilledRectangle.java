package com.lab111.labwork3;

public class FilledRectangle extends Shape {

	Rectangle border;

	public FilledRectangle(int left, int top, int width, int height) {
		super(); // we don't need to have own coordinates
		border = new Rectangle(left, top, left + width, top + height);
	}

	@Override
	public int getX() {
		return border.getX();
	}

	@Override
	public int getY() {
		return border.getY();
	}

	@Override
	public int getWidth() {
		return border.getWidth();
	}
	
	@Override
	public int getHeight() {
		return border.getHeight();
	}
	
	@Override
	public void paint() {
		System.out.format("FilledRectangle in (%d, %d) - (%d, %d) draws border:\n",
			border.x, border.y, border.x + border.width, border.y + border.height);
		border.paint();
		System.out.println("FilledRectangle fills the area inside border using lines");
	}

}
