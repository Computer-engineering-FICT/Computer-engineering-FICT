package main.java.com.yUvOsIl.lab4;

import java.awt.*;
import java.util.Arrays;

public class Clothes implements Comparable<Clothes>
{
    public static void main(String[] args)
    {
        int c11 = 5318%11; // =5 "Визначити клас одяг, який складається як мінімум з 5-ти полів"
        Clothes[] clothes = new Clothes[5];
        clothes[0] = new Clothes("pants", Size.S, Color.black, 366,"China");
        clothes[1] = new Clothes("t-shirt", Size.L, Color.gray, 720,"Germany");
        clothes[2] = new Clothes("shirt", Size.XL, Color.green, 230,"England");
        clothes[3] = new Clothes("shorts", Size.S, Color.red, 500,"Ukraine");
        clothes[4] = new Clothes("jeans", Size.M, Color.white, 120,"Italy");

        System.out.println("Сортування за ціною");
        Arrays.sort(clothes);
        for (Clothes c:clothes)
            System.out.println(c);

        System.out.println();

        System.out.println("Сортування за іменем");
        Arrays.sort(clothes, new ClotherComparable());
        for (Clothes c:clothes)
            System.out.println(c);
    }

    public Clothes(String name, Size size, Color color, int price, String producer)
    {
        this.name = name;
        this.size = size;
        this.color = color;
        this.price = price;
        this.producer = producer;
    }

    @Override
    public int compareTo(Clothes obj)
    {
        return this.price - obj.price;
    }

    @Override
    public String toString()
    {
        return name + ", " + size.getSize() + ", " + color + ", " + price + ", " +producer;
    }

    public String getName()
    {
        return this.name;
    }

    private String name;
    private Size size;
    private Color color;
    private int price;
    private String producer;
}
