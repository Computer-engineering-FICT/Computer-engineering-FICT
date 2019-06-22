package com.lab111.labwork9;

/**
 * This is the a concrete Builder.
 * Realize Builder design pattern.
 * Its creates red circle with 50% transparency.
 *
 * @author Anastasia Brovchenko
 */
public class Red50CircleBuilder extends ElementBuilder {

    @Override
    public void createColor() {
        myEl.setColor("RED");
    }

    @Override
    public void createTransperencyPT() {
        myEl.setTransparencyPRT(50);
    }

    @Override
    public void createType() {
        myEl.setType("Circle");
    }
}
