package Lab7;

import java.util.ListIterator;

public class Lab6 {
	/**
	 * Головний метод
	 */
	public static void main(String[] args) {

		/**
		 * створюємо різну амуніцію
		 */
		
		Armor armor = null;
		Shield shield = null;
		Sword sword = null;
		Helmet helmet = null;
		try {
			armor = new Armor("armor1", 100, 20.5);
			shield = new Shield("shield1", 90, 56.7);
			sword = new Sword("sword1", 120, 10.8);
			helmet = new Helmet("helmet1", 60, 3.8);
			Helmet h = new Helmet(" msdf", -5, 10);
		} catch (MyException e) {
			e.printStackTrace();
		}
		/**
		 * ствоорюємо масив амуніції для екіпіровки
		 * одного лицаря
		 */
		MyCollection am = new MyCollection();
		try {
			am.add(helmet);
			am.add(shield);
			am.add(armor);
			am.add(sword);
		} catch (NullPointerException e) {
			System.out.println("null exception");
		} catch (ArrayIndexOutOfBoundsException e2) {
			System.out.println("ArrayIndexOutOfBoundsException");
		}

		ListIterator<Ammunition> itr = am.listIterator(0);
		Helmet hel = null;
		try {
			hel = new Helmet("sdfsdf", 20, 20);
		} catch (MyException e) {
			e.printStackTrace();
		}
		while (itr.hasNext()) {
			Ammunition ammunition = itr.next();
			if (ammunition != null) {
				System.out.println(ammunition.getInformation());

			}
		}
		am.remove(helmet);
		am.add(hel);

		/**
		 * перевіряємо чи набрана амуніція підходить для
		 * одного лицаря
		 */

		if (am.isCorrectAmmunition()) {
			Chevalier chevalier = new Chevalier(am);
			System.out.print("Вартість амуніції лицаря: ");
			/**рахуємо вартість амуніції лицаря*/
			System.out.println(chevalier.getPriceAmmunition());
			/**сортуємо за вагою*/
			chevalier.sortAmmunition(am);
			System.out.println("\nВідсортована амуніція:");
			ListIterator<Ammunition> itr1 = chevalier.sortAmmunition(am)
					.listIterator();
			while (itr1.hasNext()) {
				System.out.println(itr1.next().getInformation());
			}
			System.out.println();
		}
		/**діапазон цін для амуніції*/
		int minPrice = 15;
		int maxPrice = 100;
		System.out.println("\nAмуніція із вибраного діапазону цін: " + minPrice
				+ "-" + maxPrice);
		/**пошук амуніції по заданому діапазоні*/
		itr = am.listIterator();
		while (itr.hasNext()) {
			Ammunition ammunition = itr.next();
			if ((ammunition.getPrice() <= maxPrice)
					&& (ammunition.getPrice() >= minPrice)) {
				System.out.println(ammunition.getInformation());
			}
		}

	}
}
