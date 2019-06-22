package com.lab111.labwork7;

/**
 * Graphics is a class that should represent edited graphics data.
 * Since we don't implement any business logic, it is empty.
 * @author freil
 *
 */
public class Graphics implements Cloneable {

	public Graphics() {
	}

	public Graphics(int x, int y) {
		System.out.format("Created %dx%d pixels graphics\n", x, y);
	}

	@Override
	public Object clone() {
		System.out.println("Current state of graphics data was taken in a 'memento' object");
		return new Graphics();
	}
}
