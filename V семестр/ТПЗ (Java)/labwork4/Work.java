package com.sulyma.lab111.labwork4;


import com.sulyma.lab111.labwork4.figure.Line;
import com.sulyma.lab111.labwork4.figure.Rectangle;
import com.sulyma.lab111.labwork4.figure.Triangle;

public class Work {

    public static void main(String [] args) {

        Line line = new Line(0, 0, 10, 10, "black");
        Triangle triangle = new Triangle(0, 0, 0, 10, 10, 0, "black");
        Triangle triangle2 = new Triangle(15, 0, 20, 0, 18, 5, "white");
        Rectangle rectangle = new Rectangle(10, 15, 5, 2, "red");

        line.draw();
        System.out.println("\n");
        triangle2.draw();
        System.out.println("\n");
        triangle.draw();
        System.out.println("\n");
        rectangle.draw();
    }
}
