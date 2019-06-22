package lab1;

import java.util.ArrayList;

class Collection {
	static int n;
	static key_gen buf;
	static int k;

	static ArrayList<key_gen> creat_coll(int n) {
		ArrayList<key_gen> coll = new ArrayList<key_gen>();
		for (int i = 0; i < n; i++) {
			buf = new key_gen(i, 34 + i, (long) 4577777 + i, (float) 6 + i);
			coll.add(buf);
		}
		return coll;
	}

	static ArrayList<key_gen> obmen(ArrayList<key_gen> coll, int n, int n1) {
		buf = new key_gen(n, null, null, null);
		buf = coll.get(n1);
		coll.set(n1, coll.get(n));// .set_key(n);
		coll.set(n, buf);// .set_key(n1);
		return coll;
	}

	static ArrayList<key_gen> dell(ArrayList<key_gen> coll, int k) {
		if (k < coll.size()) {
			buf = new key_gen(k, null, null, null);
			coll.set(k, buf);
		} else
			System.out.println("Такого поля не існує ! (" + k + ")");
		return coll;
	}

	static ArrayList<key_gen> add_coll(ArrayList<key_gen> coll,
			ArrayList<key_gen> coll_1) {
		k = coll.size();
		for (int i = 0; i < coll_1.size(); i++) {
			coll_1.get(i).set_key(k + i);
		}
		coll.addAll(coll_1);
		return coll;
	}

	static void search_int(ArrayList<key_gen> coll, int int_s) {
		System.out.println("search_int  (" + int_s + ")");
		for (int i = 0; i < coll.size(); i++) {
			if (int_s == coll.get(i).get_int()) {
				coll.get(i).print_key();
			}
		}
	}

	static void search_long(ArrayList<key_gen> coll, long long_s) {
		for (int i = 0; i < coll.size(); i++) {
			if (long_s == coll.get(i).get_long()) {
				System.out.println("search_int  (" + long_s + ")");
				coll.get(i).print_key();
			}
		}
	}

	static void search_float(ArrayList<key_gen> coll, float float_s) {
		k = 0;
		for (int i = 0; i < coll.size(); i++) {
			if (float_s == coll.get(i).get_float()) {
				System.out.println("search_int  (" + float_s + ")");
				coll.get(i).print_key();
			}
		}
	}

//	static ArrayList<key_gen> 



	static void sort_int(ArrayList<key_gen> coll) {
		System.out.println("sort_int");
		int a;
		System.out.println(coll.size());
//		for (int i = 0; i < coll.size() - 1; i++) {
//			for (int j = 1; j < coll.length; j++) {
//				a = coll.get(j - 1).get_int();
//				a1 = coll.get(j).get_int();
//				if (a < coll[j]) {
////					System.out.println("a = " + a + '\n' + "a1 = " + a1);
////					coll = obmen(coll, j, j + 1);
//
//				}
//			}
//		}
//		for (int i = 0 ; i<coll.length;i++)
//			System.out.println(coll[i]);
//		return coll;
	}

	static void print_coll(ArrayList<key_gen> coll) {
		System.out.println("print_coll");
		for (int i = 0; i < coll.size(); i++) {
			coll.get(i).print_key();
			// System.out.println();
		}
	}

	public static void main(String args[]) {
//		sort_int();
		int huy = 0;
		ArrayList<key_gen> c = new ArrayList<key_gen>();
		ArrayList<key_gen> c1 = new ArrayList<key_gen>();
		c = creat_coll(10);
		c1 = creat_coll(10);
		c = add_coll(c, c1);
		c = obmen(c, 2, 7);
		// dell(30);
		search_int(c, 34);
		sort_int(c);
		// buf=new key_gen(n, 45, 65, 34);
		// key_gen [] coll_1=search_int(25);
		// coll = coll_1;
		// print_coll();
		// coll.sort_int();
		// obmen(coll[8], coll[1]);
		print_coll(c);
	}
}