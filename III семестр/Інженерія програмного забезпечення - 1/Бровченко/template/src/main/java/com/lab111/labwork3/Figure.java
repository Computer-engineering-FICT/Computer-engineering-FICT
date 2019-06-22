package com.lab111.labwork3;

/**
 * Class for figure.
 * Realise pattern "Composite". Its a leaf part.
 *
 * @author Anastasia Brovchenko
 */
public class Figure implements Graphic {

    /**
     * x/y - size; posX/posY - position of the figure
     */
    private int x,y,posX,posY;

    /**
     * When you create someone figure on your graphic redactor, constructor set x and y position.
     */
    Figure(int posX, int posY, int x, int y){
        this.posX=posX;
        this.posY=posY;
        this.x=x;
        this.y=y;
    }

    @Override
    public void shiftSizeXY(int ptsX, int ptsY) {
        posX+=ptsX;
        posY+=ptsY;
    }

    @Override
    public void changeSize(double gain) {
            x*=(1+gain);
            y*=(1+gain);
    }

    /**
     * Prints the figure X/Y position. This method works,
     * when you check figure position in your graphic redactor GUI.
     */
    @Override
    public void draw() {
        System.out.println("Xpos: "+ posX+ " Ypos: "+ posY+ " Xsize: "+ x+ " Ysize: "+ y+ ";");
    }

}
