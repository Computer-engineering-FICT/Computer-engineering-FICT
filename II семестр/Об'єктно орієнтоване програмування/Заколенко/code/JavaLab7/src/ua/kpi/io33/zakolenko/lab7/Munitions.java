package ua.kpi.io33.zakolenko.lab7;

import java.util.Arrays;
import java.util.Comparator;

/**
 * This class describe data about object Munitions.
 * 
 * @author Roman Zakolenko.
 * @version 1,6 20 May 2014.
 */
public class Munitions {
	/**
	 * The field "weight" contains value of weight munition.
	 */
	private int weight;
	/**
	 * The field "price" contains value of price munition.
	 */
	private int price;
	/**
	 * THe field "material" contains value of material munition.
	 */
	private String material;

	/**
	 * @param w
	 *            assigned with field weight.
	 * @param p
	 *            assigned with field price.
	 * @param m
	 *            assigned with field material.
	 */
	public Munitions(int w, int p, String m) {
		setWeight(w);
		setPrice(p);
		setMaterial(m);
	}

	/**
	 * @param obj
	 *            contains the field whose values ​​will be installed at the new
	 *            object of class Munitions.
	 */
	public Munitions(Munitions obj) {
		setWeight(obj.getWeight());
		setPrice(obj.getPrice());
		setMaterial(obj.getMaterial());
	}

	/**
	 * @return value of field weight.
	 */
	public int getWeight() {
		return weight;
	}

	/**
	 * @param weight
	 *            assigned with field weight.
	 */
	public void setWeight(int weight) {
		this.weight = weight;
	}

	/**
	 * @return value of field price.
	 */
	public int getPrice() {
		return price;
	}

	/**
	 * @param price
	 *            assigned with field price.
	 */
	public void setPrice(int price) {
		this.price = price;
	}

	/**
	 * @return value of fields material.
	 */
	public String getMaterial() {
		return new String(material);
	}

	/**
	 * @param material
	 *            assigned with field material.
	 */
	public void setMaterial(String material) {
		this.material = new String(material);
	}

	/**
	 * @return true if compared objects of class Munitions are equal else return
	 *         false.
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Munitions))
			return false;
		Munitions obj1 = (Munitions) obj;
		if (this.weight == obj1.weight && this.price == obj1.price
				&& this.material.equals(obj1.material)) {
			return true;
		} else {
			return false;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		int hash = 11;
		hash = hash * this.weight + this.price;
		hash = hash * this.price + this.material.hashCode();
		return hash;
	}

	/**
	 * @return string which contains information about object of class
	 *         Munitions.
	 */
	@Override
	public String toString() {
		return new String("Weight: " + getWeight() + "; Price: " + getPrice()
				+ "; Material: " + getMaterial() + ".");
	}

	/**
	 * @param m
	 *            contains elements of class Munitions.
	 * @return the sum of the fields price of objects of class Munitions that
	 *         contains in array m.
	 */
	public static int cost(Munitions[] m) {
		int price = 0;
		for (int i = 0; i < m.length; i++) {
			price = price + m[i].getPrice();
		}
		return price;
	}

	/**
	 * @param m
	 *            contains elements of class Munitions.
	 */
	public static void sortedByWeight(Munitions[] m) {
		Arrays.sort(m, new Comparator<Munitions>() {
			@Override
			public int compare(Munitions m1, Munitions m2) {
				return m1.getWeight() - m2.getWeight();
			}
		});
	}

	/**
	 * @param m
	 *            contains elements of class Munitions.
	 * @param a
	 *            is initial value range.
	 * @param b
	 *            is end of the range.
	 * @return array of objects of class Munitions that go to the specified
	 *         range.
	 */
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
		return m1;
	}
}
