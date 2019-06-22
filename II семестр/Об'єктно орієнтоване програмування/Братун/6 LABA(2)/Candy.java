package main.java.com.yUvOsIl.lab6;


import java.util.ArrayList;

public class Candy implements Sweets, Comparable<Candy>
{
    public Candy(String name, int weight, int sugar)
    {
        this.name = name;
        this.weight = weight;
        this.sugar = sugar;
    }

    public static int getAllWeight(Candy[] sweets)
    {
        int result = 0;
        for (Candy c:sweets)
            result += c.weight;

        return result;
    }

    public static Sweets getChocolateCandy(Candy[] candies,int percent1, int percent2)
    {
        ArrayList<ChocolateCandy> chocolateCandies = new ArrayList<>();
        for (Candy c:candies)
            if (c instanceof ChocolateCandy)
                chocolateCandies.add((ChocolateCandy) c);

        int i = 0;
        ChocolateCandy candy = null;
        boolean q = false;
        while (!q)
        {
            candy = chocolateCandies.get(i);
            q = ((percent1 < candy.getChocolate()) && (candy.getChocolate() < percent2))? true : false;
            i++;
        }
        return candy;
}

    @Override
    public boolean equals(Object obj) {

        if (obj instanceof Candy){
            Candy c = (Candy)obj;
            return (name.equals(c.name) && weight == c.weight && sugar == c.sugar);
        }

        return false;
    }

    @Override
    public String toString()
    {
        return name + ", "+ " weight = "+ weight + ", sugar = " + sugar + "%";
    }

    @Override
    public int compareTo(Candy candy)
    {
        return this.weight - candy.weight;
    }

    public String getName()
    {
        return this.name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public int getWeight()
    {
        return this.weight;
    }

    public void setWeight(int weight)
    {
        this.weight = weight;
    }

    public int getSugar()
    {
        return this.sugar;
    }

    public void setSugar(int sugar)
    {
        this.sugar = sugar;
    }

    protected String name;
    protected int weight;
    protected int sugar;
}
