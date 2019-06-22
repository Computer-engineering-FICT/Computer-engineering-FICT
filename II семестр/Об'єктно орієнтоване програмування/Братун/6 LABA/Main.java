package ua.kpi.io33.zakolenko.lab6;

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
