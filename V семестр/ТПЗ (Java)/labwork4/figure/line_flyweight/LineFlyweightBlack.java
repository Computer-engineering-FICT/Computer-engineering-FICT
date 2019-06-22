package com.sulyma.lab111.labwork4.figure.line_flyweight;

/**
 * Simple object-line flyweight
 *
 * @author Aleksandr Sulyma
 */
public class LineFlyweightBlack implements LineFlyweight {
    private final String COLOR = "black";

    /**
     * Constructor
     */
    LineFlyweightBlack() {
    }

    /**
     * Draws a line
     *
     * @param x1 coordinate on X (start)
     * @param y1 coordinate on Y (start)
     * @param x2 coordinate on X (end)
     * @param y2 coordinate on Y (end)
     */
    public void draw(double x1,
                     double y1,
                     double x2,
                     double y2) {
        System.out.println("Line (" + x1 + ";" + y1 + ") - (" + x2 + ";" + y2 + "), " + COLOR + "\n" + hashCode());
    }
}
