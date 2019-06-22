package com.lab111.labwork4;

/**
 * Реализация 2
 * 
 */
public class Imp2 extends Implementor {

	public Imp2(int x, int y, int wigth, int height, int color) {
		super(x, y, wigth, height, color);
	}

	public void draw() {
		System.out.println("Imp2.draw()");
	}

	public void move(int newX, int newY) {
		System.out.println("Imp2.move()");
	}

}