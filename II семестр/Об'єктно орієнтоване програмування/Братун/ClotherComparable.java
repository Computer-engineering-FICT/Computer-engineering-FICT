package main.java.com.yUvOsIl.lab4;


import java.util.Comparator;

public class ClotherComparable implements Comparator<Clothes>
{
    @Override
    public int compare(Clothes obj1, Clothes obj2)
    {
        String n1 = obj1.getName();
        String n2 = obj2.getName();

        return -n1.compareTo(n2);
    }
}
