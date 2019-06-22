public class Armor extends Ammunition {
        Armor(String n, int w, int c, int d, int p){
            this.setName(n);
            this.setWeight(w);
            this.setCost(c);
            this.setDamage(d);
            this.setProtection(p);
        }
}
