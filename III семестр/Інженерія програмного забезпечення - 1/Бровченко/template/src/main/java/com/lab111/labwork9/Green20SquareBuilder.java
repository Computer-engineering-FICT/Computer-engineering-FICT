package com.lab111.labwork9;

/**
 * This is the a concrete Builder.
 * Realize Builder design pattern.
 * Its creates green square with 20% transparency.
 *
 * @author Anastasia Brovchenko
 */
public class Green20SquareBuilder extends ElementBuilder {

    @Override
    public void createColor() {
        myEl.setColor("GREEN");
    }

    @Override
    public void createTransperencyPT() {
        myEl.setTransparencyPRT(20);
    }

    @Override
    public void createType() {
        myEl.setType("Square");
    }
}
