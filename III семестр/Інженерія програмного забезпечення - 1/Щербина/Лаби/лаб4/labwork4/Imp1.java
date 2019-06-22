package com.lab111.labwork4;

/**
 * Реализация 1
 *
 */
public class Imp1 extends Implementor {

	public Imp1(int x, int y, int wigth, int height, int color) {
		super(x, y, wigth, height, color);
	}

	public void draw() {
		System.out.println("Imp1.draw()");
	}

	public void resize(int newWigth, int newHeight) {
		System.out.println("Imp1.resize()");
	}

}