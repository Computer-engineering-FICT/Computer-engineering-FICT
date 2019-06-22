package com.sulyma.lab111.labwork4.figure.line_flyweight;

import java.util.HashMap;
import java.util.Map;

/**
 * Factory for creation Line
 *
 * @author Aleksandr Sulyma
 */
public class LineFlyweightFactory {

    /**
     * Repository of objects-lines
     */
    private static Map<String, LineFlyweight> lineFlyweightPool = new HashMap<>();

    /**
     * @return new LineFlyweightImpl if there was no created yet, or old instance
     */
    public static LineFlyweight getLineFlyweight(String color) {

        LineFlyweight lineFlyweight = lineFlyweightPool.get(color);

        if (lineFlyweight == null) {
            switch (color) {
                case "black":
                    lineFlyweight = new LineFlyweightBlack();
                    break;
                case "white":
                    lineFlyweight = new LineFlyweightWhite();
                    break;
                case "red":
                    lineFlyweight = new LineFlyweightRed();
                    break;
                default:
                    System.out.println("Error!");
                    throw new NullPointerException();
            }
            lineFlyweightPool.put(color, lineFlyweight);
        }


        return lineFlyweight;
    }
}
