package com.lab111.labwork4;

/**
 * Общая реализация
 * 
 */
public class Implementor {

	protected int x;

	protected int y;

	protected int wigth;

	protected int height;

	protected int color;

	public Implementor(int x, int y, int wigth, int height, int color) {
		super();
		this.x = x;
		this.y = y;
		this.wigth = wigth;
		this.height = height;
		this.color = color;
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}

	public int getWigth() {
		return wigth;
	}

	public int getHeiht() {
		return height;
	}

	public int getColor() {
		return color;
	}

	public void setX(int x) {
		this.x = x;
	}

	public void setY(int y) {
		this.y = y;
	}

	public void SetWigth(int wigth) {
		this.wigth = wigth;
	}

	public void setHeiht(int height) {
		this.height = height;
	}

	public void setColor(int color) {
		this.color = color;
	}

	public void resize(int newWigth, int newHeiht) {
		System.out.println("Implementor.resize()");
	}

	public void move(int newX, int newY) {
		System.out.println("Implementor.move()");
	}

	public void draw() {
		System.out.println("Implementor.draw()");
	}

}