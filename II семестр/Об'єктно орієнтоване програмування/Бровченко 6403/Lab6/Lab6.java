package Lab6;

import java.util.ArrayList;

/**
 * Created by Nastya on 09.05.2017.
 */
public class Lab6 {
    public static void main(String[] args) {
        /**
         * створюємо різну амуніцію
         */
        Armor armor = new Armor("armor1", 100, 20.5);
        Shield shield = new Shield("shield1", 90, 56.7);
        Sword sword = new Sword("sword1", 120, 10.8);
        Helmet helmet = new Helmet("helmet1", 60, 3.8);
        /**
         * ствоорюємо масив амуніції для екіпіровки
         * одного лицаря
         */
        ArrayList<Ammunition> am = new ArrayList<Ammunition>();
        am.add(helmet);
        am.add(shield);
        am.add(sword);
        am.add(armor);
        for (Ammunition ammunition : am) {
            System.out.println(ammunition.getInformation());
        }
        /**
         * перевіряємо чи набрана амуніція підходить для
         * одного лицаря
         */
        if (isCorrectAmmunition(am)) {
            Chevalier chevalier = new Chevalier(am);
            System.out.print("Вартість амуніції лицаря: ");
            /**рахуємо вартість амуніції лицаря*/
            System.out.println(chevalier.getPriceAmmunition());
            /**сортуємо за вагою*/
            chevalier.sortAmmunition(am);
            System.out.println("\nВідсортована амуніція");
            for (int i = 0; i < am.size(); i++) {
                System.out.println(( chevalier.getAmmunition().get(i))
                        .getInformation());
            }
        }
        /**діапазон цін для амуніції*/
        int minPrice = 15; int maxPrice = 100;
        System.out.println("\nAмуніція із вибраного діапазону цін: " + minPrice
                + "-" + maxPrice);
        /**пошук амуніції по заданому діапазоні*/
        for (int i = 0; i < am.size(); i++) {
            if ((am.get(i).getPrice() >= minPrice)
                    && (am.get(i).getPrice() <= maxPrice)) {
                System.out.println(am.get(i).getInformation());
            }
        }

    }
    /**
     *
     * @param am масив амуніції для лицаря
     * @return boolean чи підходить амуніція для 1 лицаря
     */
    public static boolean isCorrectAmmunition(ArrayList<Ammunition> am) {
        int q = 0;
        boolean bul = true;
        Ammunition buf;
        for (Ammunition ammunition : am) {
            q = 0;
            buf = ammunition;
            for (Ammunition amOne : am) {
                if ((buf.getClass()).equals(amOne.getClass()))
                    q++;
            }
            if (q >= 2) {
                bul = false;
                break;
            }
        }
        return bul;
    }
}

