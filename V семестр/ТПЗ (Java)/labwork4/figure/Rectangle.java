package com.sulyma.lab111.labwork4.figure;

import com.sulyma.lab111.labwork4.figure.line_flyweight.LineFlyweightFactory;

/**
 * A class that description object rectangle.
 *
 * @author Aleksandr Sulyma
 */
public class Rectangle implements Figure {
    private Line firstLine;
    private Line secondLine;
    private Line thirdLine;
    private Line fourthLine;

    /**
     * Constructor
     *
     * @param x      x coordinate
     * @param y      y coordinate
     * @param length rectangle length
     * @param width  rectangle width
     */
    public Rectangle(double x, double y, double length, double width, String color) {
        firstLine = new Line(x, y, x + length, y, color);
        secondLine = new Line(x + length, y, x + length, y - width, color);
        thirdLine = new Line(x + length, y - width, x, y - width, color);
        fourthLine = new Line(x, y - width, x, y, color);
    }

    /**
     * Draws all lines
     */
    public void draw() {
        firstLine.draw();
        secondLine.draw();
        thirdLine.draw();
        fourthLine.draw();

        System.out.println("Rectangle is drawn.");
    }
}
