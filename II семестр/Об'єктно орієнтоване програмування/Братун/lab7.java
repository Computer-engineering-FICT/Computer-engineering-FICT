package main.java.com.yUvOsIl.lab7;

import main.java.com.yUvOsIl.lab6.*;

import java.util.List;

class Lab7
{
    final int c2 = 5318%2; //= 0 -> List
    final int c3 = 5318%3;//= 2 -> Двозв'язний список

    public static void main(String[] args)
    {

        List<Sweets> myList = new MyLinkedList<>();
        Sweets c = new Candy("1", 12 ,12);
        myList.add(c);
        myList.add(new Candy("2", 12 ,12));
        myList.add(new Candy("3", 12 ,12));
        myList.add(new Candy("4", 3, 5));

        List<Sweets> list = new MyLinkedList<>(myList);

        for (Sweets sweet : list) {
            System.out.println(sweet);
        }

    }
}
