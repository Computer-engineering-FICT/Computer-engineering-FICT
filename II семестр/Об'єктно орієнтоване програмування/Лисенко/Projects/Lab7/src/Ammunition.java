public class Ammunition {
    private String name;
    private int weight;
    private int cost;
    private int protection;
    private int damage;

    public void setProtection(int p){
        this.protection = p;
    }

    public int getProtection(){
        return this.protection;
    }

    public void setDamage(int d){
        this.damage = d;
    }

    public int getDamage(){
        return damage;
    }

    public int getCost(){
        return this.cost;
    }

    public void setCost(int c){
        this.cost = c;
    }

    public int getWeight(){
        return this.weight;
    }

    public void setWeight(int w){
        this.weight = w;
    }

    public String getName(){
        return this.name;
    }

    public void setName(String n){
        this.name = n;
    }
}
