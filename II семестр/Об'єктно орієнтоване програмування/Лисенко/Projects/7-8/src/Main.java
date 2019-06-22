/*
Lab7:
C2 = 6116 % 2 = 0 => Інтерфейс List
C3 = 6116 % 3 = 2 => Двозв’язний список

Lab6:
C13 = 6116 % 13 = 6 => Визначити ієрархію амуніції лицаря. Екіпірувати лицаря. Порахувати вартість амуніції.
                       Провести сортування амуніції за вагою. Знайти елементи амуніції, що відповідає заданому
                       діапазону цін.
 */
public class Main {
    public static void main(String[] args) {
        Knight kn = new Knight();
        kn.addInstock(new Armor("armor1", 5, 11, 0, 5));
        kn.addInstock(new Armor("armor2", 4, 10, 0,4));
        kn.addInstock(new Sword("sword1", 3, 20, 20,0));
        kn.addInstock(new Sword("sword2", 5, 10, 10,0));
        kn.addInstock(new Shield("shield1", 6, 17, 0,12));
        kn.addInstock(new Shield("shield2", 5, 9, 0,9));

        kn.addInused(1);
        kn.addInused(2);
        kn.addInused(4);

        System.out.println("Current ammunition:");
        System.out.printf("%-10s%-6s%-6s%-8s%-8s\n", "Name", "Wight", "Cost", "Damage", "Protect");
        for (Ammunition a: kn.getInused()) {
            System.out.printf("%-10s%-6s%-6s%-8s%-8s\n", a.getName(), a.getWeight(), a.getCost(), a.getDamage(), a.getProtection());
        }

        System.out.println("\nCost current ammunition: "+kn.costCurrentAmmunition());

        System.out.println("\nAmmunition in stock, sort by weight:");
        kn.sortWeightInstock();
        System.out.printf("%-10s%-6s%-6s%-8s%-8s\n", "Name", "Wight", "Cost", "Damage", "Protect");
        for (Ammunition a: kn.getInstock()){
            System.out.printf("%-10s%-6s%-6s%-8s%-8s\n", a.getName(), a.getWeight(), a.getCost(), a.getDamage(), a.getProtection());
        }

        int MINCOST = 5;
        int MAXCOST = 15;
        System.out.println("\nAmmunition in stock in cost range "+MINCOST+"-"+MAXCOST);
        Ammunition[] sc = kn.searchCost(MINCOST, MAXCOST);
        if (sc.length==0){
            System.out.println("Not found");
        } else {
            System.out.printf("%-10s%-6s%-6s%-8s%-8s\n", "Name", "Wight", "Cost", "Damage", "Protect");
            for (Ammunition a: sc){
                System.out.printf("%-10s%-6s%-6s%-8s%-8s\n", a.getName(), a.getWeight(), a.getCost(), a.getDamage(), a.getProtection());
            }
        }

        try {
            kn.addInused(10);
        } catch (IndexException ext) {
            System.out.println("\nCaught IndexException");
        }
    }
}
