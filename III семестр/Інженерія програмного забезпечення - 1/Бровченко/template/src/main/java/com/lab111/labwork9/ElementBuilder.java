package com.lab111.labwork9;

/**
 * This is the Abstract Builder.
 * Realize Builder design pattern.
 * @author Anastasia Brovchenko
 */
abstract public class ElementBuilder {

    /**
     * Element, wich we will construct.
     */
    protected MyElement myEl;

    /**
     * Getter for element
     * @return element.
     */
    public MyElement getMyEl(){
        return myEl;
    }

    /**
     * Method to firstly create our element.
     */
    public void createElement(){
        myEl= new MyElement();
    }

    //other abstract methods

    /**
     * Set color for element.
     */
    public abstract void createColor();

    /**
     * Set pts of Transperency for element.
     */
    public abstract void createTransperencyPT();

    /**
     * Set type for element.
     */
    public abstract void createType();

}
