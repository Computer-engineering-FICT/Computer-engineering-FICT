package ua.kpi.io33.zakolenko.lab6;

import java.util.Arrays;
import java.util.Comparator;

public class Munitions {

	private int weight;
	private int price;
	private String material;


	public int getWeight() {
		return weight;
	}


	public void setWeight(int weight) {
		this.weight = weight;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}

	public String getMaterial() {
		return new String(material);
	}

	public void setMaterial(String material) {
		this.material = new String(material);
	}

	public Munitions(int w, int p, String m) {
		setWeight(w);
		setPrice(p);
		setMaterial(m);
	}



	public Munitions(Munitions obj) {
		setWeight(obj.getWeight());
		setPrice(obj.getPrice());
		setMaterial(obj.getMaterial());
	}

	public static int cost(Munitions[] m) {
		int price = 0;
		for (int i = 0; i < m.length; i++) {
			price = price + m[i].getPrice();
		}
		return price;
	}

	public static void sortedByWeight(Munitions[] m) {
		Arrays.sort(m, new Comparator<Munitions>() {
			@Override
			public int compare(Munitions m1, Munitions m2) {
				return m1.getWeight() - m2.getWeight();
			}
		});
	}



	public static Munitions[] priceRange(Munitions[] m, int a, int b) {
		int length = 0;
		for (int i = 0; i < m.length; i++) {
			if (m[i].getPrice() >= a && m[i].getPrice() <= b) {
				length++;
			}
		}

		Munitions[] m1 = new Munitions[length];
		for (int i = 0; i < m.length; i++) {
			if (m[i].getPrice() >= a && m[i].getPrice() <= b) {
				m1[i] = m[i];
			}
		}

		if (length == 0) {
			return null;
		} else {
			return m1;
		}
	}
}
