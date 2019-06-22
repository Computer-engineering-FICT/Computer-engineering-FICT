package com.company;

public class Main {

    public static void main(String[] args) {
        char i,j;
        int m = 13, n = 3;
        float S = 0;
        for (i=0;i<=n;i++) {

            for (j=0;j<=m;j++) {
                if (i==2) {
                    System.out.println("Виникла помилка в обчисленнях через ділення на нуль. Результат обчислити неможливо.");
                    return;
                }
                else {
                    S += (i - j) / (i - 2);
                }
            }

        }
        System.out.println("S = "+S);
        }
}


