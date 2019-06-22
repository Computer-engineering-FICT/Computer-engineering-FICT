import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Tester {
	public static double firstTest(boolean[] generation) {
		int counter = 0;
		for (int i = 0; i < generation.length; i++)
			if (generation[i])
				counter++;
		return counter / (double) generation.length;
	}

	public static double secondTest(boolean[] generation) {
		int counter = 0;
		for (int i = 0; i < generation.length - 1; i++) {
			if (generation[i] != generation[i + 1])
				counter++;
		}
		return counter / (float) generation.length;
	}

	public static short[] thirdTest(boolean[] generation, int k) {

		short[] win = new short[(short) Math.pow(2, k)];
		int n, m;
		int temp;
		for (int i = 0; i <= generation.length - k; i++) {
			n = 0;
			m = 1;
			for (int j = k; j > 0; j--) {
				if (generation[i + j - 1])
					temp = 1;
				else
					temp = 0;
				n += m * temp;
				m *= 2;
			}
			win[n]++;
		}
		return win;
	}

	private static ArrayList<Integer> genArrayList(boolean[] generation) {
		ArrayList<Integer> result = new ArrayList<Integer>(generation.length);
		for (int i = 0; i < generation.length; i++)
			result.add(generation[i] ? 1 : 0);
		return result;
	}

	private static int win(ArrayList<Integer> test, int i, int window) {
		int win = 0;
		for (int j = 0; j < window; j++) {
			if (test.get(i + j) == 1) {
				win += (int) Math.pow(2, window - j - 1);
			}
		}
		return win;
	}

	private static boolean win1(ArrayList<Integer> test, int window,
			Map<Integer, Integer> map) {
		int i = 0;
		boolean flag = false;
		while (!flag && i < test.size() - window) {
			int check = test.get(i + window);
			int win = win(test, i, window);
			Integer map1 = map.get(win);
			if (map1 == null) {
				map.put(win, check);
				i++;
			} else {
				if (map1 == check) {
					i++;
				} else {
					flag = true;
				}
			}
		}
		map.clear();
		return flag;
	}

	public static int fourthTest(boolean[] generation) {
		ArrayList<Integer> test = genArrayList(generation);
		int window = 1;
		boolean flag = true;
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		while (flag) {
			flag = win1(test, window, map);
			window++;
		}
		return window - 1;
	}
}