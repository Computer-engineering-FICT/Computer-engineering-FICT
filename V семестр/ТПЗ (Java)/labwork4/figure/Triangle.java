package com.sulyma.lab111.labwork4.figure;


import com.sulyma.lab111.labwork4.figure.line_flyweight.LineFlyweightFactory;

/**
 * A class that description object triangle.
 *
 * @author Aleksandr Sulyma
 */
public class Triangle implements Figure {
    private Line firstLine;
    private Line secondLine;
    private Line thirdLine;


    /**
     * Constructor
     *
     * @param x1    x coordinate of first line
     * @param y1    y coordinate of first line
     * @param x2    x coordinate of second line
     * @param y2    y coordinate of second line
     * @param x3    x coordinate of third line
     * @param y3    y coordinate of third line
     * @param color color figure
     */
    public Triangle(double x1,
                    double y1,
                    double x2,
                    double y2,
                    double x3,
                    double y3,
                    String color) {

        firstLine = new Line(x1, y1, x2, y2, color);
        secondLine = new Line(x2, y2, x3, y3, color);
        thirdLine = new Line(x3, y3, x1, y1, color);
    }

    /**
     * Draws all lines
     */
    public void draw() {
        firstLine.draw();
        secondLine.draw();
        thirdLine.draw();

        System.out.println("Triangle is drawn.");
    }
}
