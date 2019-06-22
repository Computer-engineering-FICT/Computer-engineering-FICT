package ua.kpi.io33.zakolenko.lab6;

/**
 * Is used to create objects of the class Helmet, Armor and Shield which are
 * then sorted by the specified field.
 * 
 * @author Roman Zakolenko
 * @version 1,7 05 May 2014
 * @see ua.kpi.io33.zakolenko.lab6.Munitions ua.kpi.io33.zakolenko.lab6.Shield
 *      ua.kpi.io33.zakolenko.lab6.Armor ua.kpi.io33.zakolenko.lab6.Helmet
 */
public class Main {
	public static void main(String[] args) {
		Helmet h = new Helmet(35, 115, "������");
		Armor a = new Armor(25, 200, "�����");
		Shield s = new Shield(10, 110, "������");
		Munitions[] munitions = { h, a, s };
		System.out.println("����� ��������� �������� ������: "
				+ Munitions.cost(munitions));
		Munitions.sortedByWeight(munitions);
		System.out.println("��������������� �� ���� ��������� ������:");
		for (int i = 0; i < munitions.length; i++) {
			System.out.print(munitions[i].getWeight() + " ");
		}
		System.out.println();
		Munitions d[];
		d = Munitions.priceRange(munitions, 50, 200);
		System.out.println("��������� �� ������� ��������� ���:");
		for (int i = 0; i < d.length; i++) {
			System.out.print(d[i].getPrice() + " ");
		}
	}
}
