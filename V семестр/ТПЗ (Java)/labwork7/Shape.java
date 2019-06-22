package com.sulyma.lab111.labwork7;
/**
 * Abstract class that realize all parameters and have methot getState() from Memento.
 *
 * @author Aleksandr Sulyma
 */
public abstract class Shape {
    protected int x1;
    protected int y1;
    protected int x2;
    protected int y2;
    protected int color;
    protected int size;

    /**
     * Constructor.
     */
    Shape(int x1, int y1, int x2, int y2, int color, int size) {
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

    public void setX1(int x1) {
        this.x1 = x1;
    }

    public int getY1() {
        return y1;
    }

    public void setY1(int y1) {
        this.y1 = y1;
    }

    public int getX2() {
        return x2;
    }

    public void setX2(int x2) {
        this.x2 = x2;
    }

    public int getY2() {
        return y2;
    }

    public void setY2(int y2) {
        this.y2 = y2;
    }

    public int getColor() {
        return color;
    }

    public void setColor(int color) {
        this.color = color;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public Memento getState() {
        return new Memento(x1, y1, x2,y2, color, size);
    }

    public void setState(Memento memento) {
        x1 = memento.getX1();
        x2 = memento.getX2();
        y1 = memento.getY1();
        y2 = memento.getY2();
        color = memento.getColor();
        size = memento.getSize();
    }

    @Override
    public String toString() {
        return x1 + " " + y1 + " " + x2 + " " + y2 + " " + color + " " + size;
    }
}
