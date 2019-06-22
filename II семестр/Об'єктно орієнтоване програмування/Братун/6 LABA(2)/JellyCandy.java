package main.java.com.yUvOsIl.lab6;

final public class JellyCandy extends Candy
{
    public JellyCandy(String name, int weight, int sugar, int jelly)
    {
        super(name, weight, sugar);
        this.jelly = jelly;
    }

    public int compareTo(JellyCandy jellyCandy)
    {
        return this.jelly - jellyCandy.jelly;
    }

    @Override
    public String toString()
    {
        return super.toString() + ", jelly = " + jelly + "%";
    }

    public int getJelly()
    {
        return jelly;
    }
    public void setJelly(int jelly)
    {
        this.jelly = jelly;
    }
    private int jelly;
}
