package com.lab111.labwork3;

import java.util.LinkedList;
import java.util.List;

/**
 * Composite class, unbreakable group of shapes
 * 
 * @author Nightingale
 */
public class Graphics extends Shape {

	private List<Shape> children;

	/**
	 * Default constructor
	 */
	public Graphics() {
		super();
		children = new LinkedList<Shape>();
	}

	@Override
	public int getX() {
		x = children.get(0).getX();
		for (Shape shape : children)
			if (x > shape.getX())
				x = shape.getX();
		return x;
	}
	
	@Override
	public int getY() {
		y = children.get(0).getY();
		for (Shape shape : children)
			if (y > shape.getY())
				y = shape.getY();
		return y;
	}
	
	@Override
	public int getWidth() {
		int right = children.get(0).getX();
		int left = right;
		int x = right;
		int s_right;
		for (Shape shape : children) {
			x = shape.getX();
			s_right = x + shape.getWidth();
			if(s_right > right)
				right = s_right;
			if (x < left)
				left = x;
		}
		return right - left;
	}


	@Override
	public int getHeight() {
		int top = children.get(0).getY();
		int bottom = top;
		int s_bottom;
		for (Shape shape: children) {
			y = shape.getY();
			if (y < top)
				top = y;
			s_bottom = y + shape.getHeight();
			if (s_bottom > bottom)
				bottom = s_bottom;
		}
		return bottom - top;
	}

	/*
	 * Paint all child shapes
	 */
	@Override
	public void paint() {
		x = getX();
		y = getY();
		int right = x + getWidth();
		int bottom = y + getHeight();
		System.out.format("Graphics in (%d, %d) - (%d, %d):\n", x, y, right, bottom);
		for (Shape shape: children)
			shape.paint();
		System.out.println("End of graphics");
	}

	/**
	 * Adds a shape to graphics
	 * @param shape shape to add
	 * @return
	 */
	public boolean addShape(Shape shape) {
		return children.add(shape);
	}

	/**
	 * Removes inner shape
	 * 
	 * @param toRemove shape to remove
	 * @return true if shape was removed, false otherwise
	 */
	public boolean removeShape(Shape toRemove) {
		return children.remove(toRemove);
	}

	/**
	 * Get inner shape by it's index
	 * 
	 * @param i index of shape to return
	 * @return inner shape or null if
	 */
	public Shape getChildShape(int i) {
		try {
			return children.get(i);
		} catch (IndexOutOfBoundsException e) {
			return null;
		}
	}

	/**
	 * Empty. Override if you want to add some shapes initially
	 * Do not forget to set coordinates and dimensions
	 */
	protected void initContent() {
	}

}
