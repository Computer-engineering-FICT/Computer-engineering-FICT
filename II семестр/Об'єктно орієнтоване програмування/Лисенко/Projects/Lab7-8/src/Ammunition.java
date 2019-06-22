public class Ammunition {
    private String name;
    private int weight;
    private int cost;
    private int damage;
    private int protection;

    Ammunition(String name, int weight, int cost, int damage, int protection){
        this.setName(name);
        this.setWeight(weight);
        this.setCost(cost);
        this.setDamage(damage);
        this.setProtection(protection);
    }

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

    @Override
    public String toString(){
        return name+"(w:"+weight+",c:"+cost+",d:"+damage+",p:"+protection+")";
    }

    @Override
    public boolean equals(Object o){
        Ammunition a = (Ammunition) o;
        return getName().equals(a.getName()) &&  getWeight()==a.getWeight() && getCost()==a.getCost() &&
                getDamage()==a.getDamage() && getProtection()==a.getProtection();
    }

    @Override
    public int hashCode(){
        return toString().hashCode();
    }
}
