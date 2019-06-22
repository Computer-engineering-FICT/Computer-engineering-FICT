package ua.kpi.io33.zakolenko.lab7;

public class Lab7 {
	public static void main(String args[]) {
		Munitions m1 = new Munitions(15, 20, "Алюминий");
		Munitions m3 = new Munitions(10, 30, "Платина");
		Munitions m4 = new Munitions(11, 45, "Медь");
		Munitions m2 = new Munitions(15, 22, "Алюминий");
		Munitions m5 = new Munitions(12, 67, "Железо");
		DoubleList list = new DoubleList(m1);
		list.add(m5);
		list.add(0, m4);
		DoubleList list1 = new DoubleList();
		list1.add(m3);
		list1.add(m2);
		list.addAll(list1);
		list.set(1, m5);
		list.add(4,m3);
	list.remove(5);
		System.out.println(list);
		list.clear();
		System.out.println(list);
		DoubleList gg=new DoubleList(m1);
		gg.remove(0);
		System.out.println(gg);
		gg.add(0,m4);
		System.out.println(gg);
	}
}
