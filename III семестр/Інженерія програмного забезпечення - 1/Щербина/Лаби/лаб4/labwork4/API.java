package com.lab111.labwork4;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Общий интерфейс
 * 
 */
public class API implements API1, API2 {

	public API(int x, int y, int wigth, int height, int color,
			int numberImplementation) {
		super();
		switch (numberImplementation) {
		case 1:
			imp = new Imp1(x, y, wigth, height, color);
			break;
		case 2:
			imp = new Imp2(x, y, wigth, height, color);
			break;
		default:
			imp = new Implementor(x, y, wigth, height, color);
			break;
		}
	}

	public Implementor imp;

	public void draw() {
		imp.draw();
	}

	public int getX() {
		return imp.getX();
	}

	public int getY() {
		return imp.getY();
	}

	public int getWigth() {
		return imp.getWigth();
	}

	public int getHeight() {
		return imp.getHeiht();
	}

	public int getColor() {
		return imp.getColor();
	}

	public void setX(int x) {
		imp.setX(x);
	}

	public void setY(int y) {
		imp.setY(y);
	}

	public void setWigth(int wigth) {
		imp.SetWigth(wigth);
	}

	public void setHeight(int height) {
		imp.setHeiht(height);
	}

	public void setColor(int color) {
		imp.setColor(color);
	}

	public void resize(int newWigth, int newHeight) {
		List<Integer> l = new ArrayList<>();
		l.add(5);
		l = new LinkedList<>();
		System.out.println("Замена реализации");
		imp = new Imp1(imp.x, imp.y, imp.wigth, imp.height, imp.color);
		imp.resize(newWigth, newHeight);
	}

	public void move(int newX, int newY) {
		System.out.println("Замена реализации");
		imp = new Imp2(imp.x, imp.y, imp.wigth, imp.height, imp.color);
		imp.move(newX, newY);
	}

}