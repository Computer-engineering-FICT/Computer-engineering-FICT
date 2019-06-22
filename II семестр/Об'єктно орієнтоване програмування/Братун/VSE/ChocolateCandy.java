
final public class ChocolateCandy extends Candy
{
    public ChocolateCandy(String name, int weight, int sugar, int chocolate)
    {
        super(name, weight, sugar);
        this.chocolate = chocolate;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof ChocolateCandy){
            ChocolateCandy c = (ChocolateCandy) obj;
            return (name.equals(c.name) && weight == c.weight && sugar == c.sugar && chocolate == c.chocolate);
        }
        return false;
    }

    public int compareTo(ChocolateCandy chocolateCandy)
    {
        return this.chocolate - chocolateCandy.chocolate;
    }

    @Override
    public String toString()
    {
        return super.toString() + ", chocolate = " + chocolate + "%";
    }

    public int getChocolate()
    {
        return chocolate;
    }
    public void setChocolate(int chocolate)
    {
        this.chocolate = chocolate;
    }
    private int chocolate;
}
