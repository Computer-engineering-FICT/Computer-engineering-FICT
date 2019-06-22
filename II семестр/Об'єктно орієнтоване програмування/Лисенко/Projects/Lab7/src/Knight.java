import java.util.ArrayList;
import java.util.Comparator;
import java.util.Collections;

public class Knight {
    private ArrayList<Ammunition> instock = new ArrayList<>();
    private Ammunition[] inused = new Ammunition[3];

    public Ammunition[] getInstock(){
        return this.instock.toArray(new Ammunition[0]);
    }

    public void sortWeightInstock(){
        Collections.sort(this.instock, new SortWeight());
    }

    public Ammunition[] getInused(){
        return this.inused.clone();
    }

    public void addInused(int index){
        if(0<=index && index<this.instock.size()){
            switch(instock.get(index).getClass().getName()){
                case "Armor": {
                    this.inused[0] = instock.get(index);
                    break;
                }
                case "Sword": {
                    this.inused[1] = instock.get(index);
                    break;
                }
                case "Shield": {
                    this.inused[2] = instock.get(index);
                    break;
                }
            }
        }
    }

    public void addInstock(Ammunition a){
        this.instock.add(a);
    }

    public int costCurrentAmmunition(){
        int i = 0;
        for (Ammunition a: this.inused){
            if (a != null){
                i += a.getCost();
            }
        }
        return i;
    }

    public Ammunition[] searchCost(int min, int max){
        ArrayList<Ammunition> ma = new ArrayList<>();
        for (Ammunition a: instock){
            if (a.getCost()>=min && a.getCost()<=max){
                ma.add(a);
            }
        }
        Collections.sort(ma, new SortCost());
        return ma.toArray(new Ammunition[0]);
    }

    private class SortWeight implements Comparator<Ammunition> {
        @Override
        public int compare(Ammunition a, Ammunition b) {
            return a.getWeight() - b.getWeight();
        }
    }

    private class SortCost implements Comparator<Ammunition> {
        @Override
        public int compare(Ammunition a, Ammunition b) {
            return a.getCost() - b.getCost();
        }
    }
}
