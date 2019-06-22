package com.sulyma.lab111.labwork4.figure.line_flyweight;

/**
 * Interface for flyweights
 *
 * @author Aleksandr Sulyma
 */
public interface LineFlyweight {

    /**
     * Draws a line
     *
     * @param x1 coordinate on X (start)
     * @param y1 coordinate on Y (start)
     * @param x2 coordinate on X (end)
     * @param y2 coordinate on Y (end)
     */
    void draw(double x1,
              double y1,
              double x2,
              double y2);
}
