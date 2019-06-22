package com.lab111.labwork3;

/**
 * @author Nightingale
 *
 */
public class ShapesTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Shape ellipse;
		Shape rectangle;
		Shape filledRectangle;
		Graphics group;
		
		ellipse = new Ellipse(2, 4, 5, 3);
		rectangle = new Rectangle(3, 8, 11, 20);
		filledRectangle = new FilledRectangle(5, 2, 11, 16);

		group = new Graphics();
		group.addShape(ellipse);
		group.addShape(rectangle);
		group.addShape(new Line(1, 7, 12, 3));
		group.addShape(new Rectangle(4, 8, 11, 15));
		group.addShape(filledRectangle);
		group.paint();
	}

}
