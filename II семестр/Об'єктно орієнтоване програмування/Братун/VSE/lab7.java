import java.*;

import java.util.List;

class Lab7
{


    public static void main(String[] args)
    {

        List<Sweets> myList = new MyLinkedList<>();
        Sweets c = new Candy("Candy1", 12 ,12);
        myList.add(c);
        myList.add(new Candy("Candy2", 9 ,11));
        myList.add(new Candy("Candy3", 12 ,12));
        myList.add(new Candy("Candy4", 3, 5));

        List<Sweets> list = new MyLinkedList<>(myList);

        for (Sweets sweet : list) {
            System.out.println(sweet);
        }

    }
}
