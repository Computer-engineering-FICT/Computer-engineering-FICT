package com.lab111.labwork3;

/**
 * General abstract component class, generalize all possible type of vector
 * graphis
 * 
 * @author Nightingale
 */
public abstract class Shape {

	/**
	 * Left coordinate
	 */
	protected int x;
	/**
	 * Top coordinate
	 */
	protected int y;
	/**
	 * Shape width
	 */
	protected int width;
	/**
	 * Shape height
	 */
	protected int height;


	public Shape() {
	}

	public Shape(int left, int top, int width, int height) {
		x = left;
		y = top;
		this.width = width;
		this.height = height;
	}

	/**
	 * @return leftmost side of shape coordinate
	 */
	public int getX() {
		return x;
	}

	/**
	 * @return topmost coordinate of shape
	 */
	public int getY() {
		return y;
	}

	/**
	 * @return width of graphic
	 */
	public int getWidth() {
		return width;
	}

	/**
	 * @return height of graphic
	 */
	public int getHeight() {
		return height;
	}

	/**
	 * Set coordinate of top left corner of graphics
	 * 
	 * @param x
	 *            is new coordinate x
	 * @param y
	 *            is new coordinate y
	 */
	public void setPosition(int x, int y) {
		this.x = x;
		this.y = y;
	}

	/**
	 * Sets dimensions of shape
	 * 
	 * @param width
	 * @param height
	 */
	public void setDimensions(int width, int height) {
		this.width = width;
		this.height = height;
	}

	/**
	 * Paint shape, must be implemented in successors
	 */
	public abstract void paint();

}

/*
 * ��������� ���. 1 - ���� ������� � ������������� ��� ������� � ������ .doc,
 * ���� ���� ����� ������. 2 - �� ������ �� ���� ������ ���������
 * ���������. 3 - ����� ���������� ���, �� ������ List. ����������������� ������
 * �����. ��� ������ ��������� ��������� ����� Java �����=) ³������� ����
 * ���, �� ����������� List ����������, �������� ����� �������� ������� Add i
 * Remove
 */