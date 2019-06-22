/*
 * @(#)Lab7.java 1.0 30/05/18
 *
 * Copyright (c) 2018 Yan Mazan
 */
public class Main {

    public static void main(String[] args) throws MyException {
        /**
         * Initialising vegetables
         */
        Vegetable cucumber = null;
        Vegetable onion = null;
        Vegetable cabbage = null;
        Vegetable selera = null;
        Vegetable k = null;
        Vegetable m = null;
        /**
         * Giving value to vegetables and testing them on wrong input
         */
        try {
            cucumber = new Vegetable("Огірок", 16);
            onion = new Vegetable("Цибуля", 40);
            cabbage = new Vegetable("Капуста", 25);
            selera = new Vegetable("Селера", 16);
            k = new Vegetable("R", -1874545);
            m = new Vegetable("Pine", -1000);
        } catch (MyException e) {
            e.printStackTrace();
        }
        /**
         * Adding vegetables to my collection salad
         */
        VegetablesCollection<Vegetable> salad = new VegetablesCollection();
        try {
            salad.add(m);
            salad.add(cucumber);
            salad.add(onion);
            salad.add(cabbage);
            salad.add(selera);

        } catch (NullPointerException e) {
            System.out.println("null exception");
        } catch (ArrayIndexOutOfBoundsException e2) {
            System.out.println("ArrayIndexOutOfBoundsException");
        }

        /**
         * Print salad
         */
        System.out.println("My salad: ");
        for (Vegetable i: salad) {
            System.out.println(i);
        }

        /**
         * Find vegetables with nutrition in selected range
         */
        int min_nutrition = 10;
        int max_nutrition = 30;
        System.out.println("\nSalad elements with nutrition between 10 and 30: ");
        for (Vegetable i: salad) {
            if (min_nutrition <= i.nutrition && max_nutrition >= i.nutrition) {
                System.out.println(i);
            }
        }
    }
}