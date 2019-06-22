package com.sulyma.lab111.labwork7;

import java.util.Random;

/**
 * Class redactor some parameters.
 *
 * @author Aleksandr Sulyma
 */
public class Redactor {
    private Shape[] shapes;
    private Memento[] states;
    private int sizeShapes;
    private int countShapes;

    Redactor() {
        Random random = new Random();
        sizeShapes = 10;
        countShapes = 7;
        shapes = new Shape[sizeShapes];
        states = new Memento[sizeShapes];
        shapes[0] = new Circle(random.nextInt(100),random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100));
        shapes[1] = new Rectangle(random.nextInt(100),random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100));
        shapes[2] = new Triangle(random.nextInt(100),random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100));
        shapes[3] = new Circle(random.nextInt(100),random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100));
        shapes[4] = new Rectangle(random.nextInt(100),random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100));
        shapes[5] = new Triangle(random.nextInt(100),random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100));
        shapes[6] = new Circle(random.nextInt(100),random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100), random.nextInt(100));
    }

    public void updateColorShape(int index, int color) {
        if (index > -1 && index < countShapes) {
            states[index] = shapes[index].getState();
            shapes[index].setColor(color);
        }
    }

    public void updateSizeShape(int index, int size) {
        if (index > -1 && index < countShapes) {
            states[index] = shapes[index].getState();
            shapes[index].setSize(size);
        }
    }

    public void updateCoordinates(int index) {
        if (index > -1 && index < countShapes) {
            Random random = new Random();
            states[index] = shapes[index].getState();
            shapes[index].setX1(random.nextInt(20));
            shapes[index].setX2(random.nextInt(20));
            shapes[index].setY1(random.nextInt(20));
            shapes[index].setY2(random.nextInt(20));
        }
    }

    public void cancelChanges(int index) {
        if (index > -1 && index < countShapes) {
            if (states[index] != null)
                shapes[index].setState(states[index]);
        }
    }

    @Override
    public String toString() {
        StringBuilder str = new StringBuilder();
        for (int i = 0; i < countShapes; i++)
            str.append("#" + (i + 1) + " " + shapes[i] + "\n");

        return str.toString();
    }
}
