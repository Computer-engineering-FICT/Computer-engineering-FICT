package com.sulyma.lab111.labwork7;

/**
 * Class, that get all parameters.
 *
 * @author Aleksandr Sulyma
 */
public class Memento {
    private int x1;
    private int y1;
    private int x2;
    private int y2;
    private int color;
    private int size;

    /**
     * Constructor.
     */
    Memento(int x1, int y1, int x2, int y2, int color, int size) {
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.color = color;
        this.size = size;
    }


    public int getX1() {
        return x1;
    }

    public int getY1() {
        return y1;
    }

    public int getX2() {
        return x2;
    }

    public int getY2() {
        return y2;
    }

    public int getColor() {
        return color;
    }

    public int getSize() {
        return size;
    }
}
