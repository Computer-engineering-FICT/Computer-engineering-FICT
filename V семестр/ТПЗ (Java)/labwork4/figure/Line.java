package com.sulyma.lab111.labwork4.figure;


import com.sulyma.lab111.labwork4.figure.line_flyweight.LineFlyweight;
import com.sulyma.lab111.labwork4.figure.line_flyweight.LineFlyweightFactory;

/**
 * Line figure for editor
 *
 * @author Aleksandr Sulyma
 * @see Figure
 */
public class Line implements Figure {
    private double x1;
    private double y1;
    private double x2;
    private double y2;

    private LineFlyweight lineFlyweight;

    /**
     * Constructor
     *
     * @param x1 coordinate on X (start)
     * @param y1 coordinate on Y (start)
     * @param x2 coordinate on X (end)
     * @param y2 coordinate on Y (end)
     */
    public Line(double x1, double y1, double x2, double y2, String color) {
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        lineFlyweight = LineFlyweightFactory.getLineFlyweight(color);
    }

    /**
     * Takes line flyweight from factory and draws it
     *
     * @see LineFlyweight
     * @see LineFlyweightFactory
     */
    @Override
    public void draw() {
        lineFlyweight.draw(x1, y1, x2, y2);
    }
}
