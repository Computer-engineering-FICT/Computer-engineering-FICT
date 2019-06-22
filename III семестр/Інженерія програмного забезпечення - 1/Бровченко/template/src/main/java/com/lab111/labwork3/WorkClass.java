package com.lab111.labwork3;

/**
 * Only workclass.
 * Realise pattern "Composite". Its a client part.
 *
 * @author Anastasia Brovchenko
 */
public class WorkClass {
    public static void main(String[] args) {

        //Create on your field 4 figures for manipulations.
        Figure figure1 = new Figure(1,1,2,2);
        Figure figure2 = new Figure(2,2,2,2);
        Figure figure3 = new Figure(3,3,2,2);
        Figure figure4 = new Figure(0,0,23,23);

        //3 different areas of allocation. I.e. it is meant that the user,
        // allocating a certain area of a field of editing, touches different sets of figures.
        CompositeFigure area1 = new CompositeFigure();
        CompositeFigure area2 = new CompositeFigure();

        //Business methods for "Leaf"/single figure. If we check single figure properties.
        figure1.draw();
        System.out.println("fig1\n");
        figure3.changeSize(0.75);
        figure3.shiftSizeXY(1,-1);
        figure3.draw();
        System.out.println("fig3 changed\n");

        //Imitation of allocation of some figures. I.e. it is meant that we, allocating,
        // we take figures 1,2,3. They, respectively, are added in our field of the allocated figures.
        area1.add(figure1);
        area1.add(figure2);
        area1.add(figure3);

        //Now we work with the allocated group of figures. But we address to it,
        // as with a single figure. Just "Composition" allows to make such counter.
        area1.draw();
        System.out.println("area1\n");
        area1.shiftSizeXY(2,2);
        area1.changeSize(-0.5);
        area1.draw();
        System.out.println("area1 changed\n");

        area2.add(area1);
        area2.add(figure4);
        area2.draw();
        System.out.println("area2\n");
    }
}
