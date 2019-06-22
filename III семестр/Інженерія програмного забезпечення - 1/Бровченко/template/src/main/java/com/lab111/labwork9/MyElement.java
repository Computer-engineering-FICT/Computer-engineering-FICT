package com.lab111.labwork9;

/**
 * This is the product of our builder.
 * Realize Builder design pattern.
 *
 * @author Anastasia Brovchenko
 */
public class MyElement {

    /**
     * Parameters, simply to all elements.
     */
    private String color= "";
    private String type= "";
    private int transparencyPRT= 100;

    /**
     * Setter for color.
     * @param color color wich will use.
     */
    public void setColor(String color) {
        this.color = color;
    }

    /**
     * Setter for transparencyPRT
     * @param transparencyPRT transparencyPRT wich will use.
     */
    public void setTransparencyPRT(int transparencyPRT) {
        this.transparencyPRT = transparencyPRT;
    }

    /**
     * Setter for type.
     * @param type type wich will use.
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * To get some info about element.
     */
    public void getMyElInfo(){
        System.out.println("This is "+ type+ " whith "+ transparencyPRT+ "%, and its color is "+ color);
    }
}
