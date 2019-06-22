package com.sulyma.lab111.labwork5.logic;

/**
 * Class Widget
 */
abstract public class Widget {
    private Admin admin;
    private int x;
    private int y;
    private int width;
    private int height;

    /**
     * Constructor
     *
     * @param admin Object dialog director
     * @param width    width
     * @param height   height
     * @param x        x param (coordinate)
     * @param y        y param (coordinate)
     */
    public Widget(Admin admin, int width, int height, int x, int y) {
        this.admin = admin;
        this.width = width;
        this.height = height;
        this.x = x;
        this.y = y;
    }

    abstract public void drawElement();

    /**
     * Get the value of x
     *
     * @return the value of x
     */
    private int getX() {
        return x;
    }

    /**
     * Get the value of y
     *
     * @return the value of y
     */
    private int getY() {
        return y;
    }

    /**
     * Get the value of width
     *
     * @return the value of width
     */
    private int getWidth() {
        return width;
    }

    /**
     * Get the value of height
     *
     * @return the value of height
     */
    private int getHeight() {
        return height;
    }

    /**
     * Reaction on changing element
     */
    public void changed() {
        admin.widgetChanged(this);
    }
}
