package allocator2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import junit.framework.TestCase;

public class Tester extends TestCase {

	private static Random random = new Random();

	private static int TEST_SIZE = 10000;

	private static Memory memory = new Memory();

	private static int MAX_ITEM_VALUE = 300;

	private static List<Integer> list = new ArrayList<>();
	private static List<Integer> listSize = new ArrayList<>();

	private static Map<Integer, int[]> testMap = new HashMap<>();

	public void test() {
		// int trueCounter = 0;
		int action;
		int addr;
		int size;
		for (int i = 0; i < TEST_SIZE; i++) {
			action = random.nextInt(3);
			switch (action) {
			case 0:
				size = random.nextInt(MAX_ITEM_VALUE);
				addr = memory.memAlloc(size);
				if (addr != -1) {
					fill(addr, size);
				}
				break;
			case 1:
				if (list.size() == 0)
					break;
				addr = random.nextInt(list.size());
				memory.memFree(addr);
				testMap.remove(addr);
				break;
			case 2:
				if (list.size() == 0)
					break;
				size = random.nextInt(MAX_ITEM_VALUE);
				addr = random.nextInt(list.size());
				int newAddr = memory.memRealloc(addr, size);
				if (newAddr != -1) {
					testMap.remove(addr);
					int[] data = new int[size];
					for (int j = 0; j < size; j++)
						data[j] = memory.read(addr + j);
					testMap.put(newAddr, data);
				}
			}
			assertTrue(checkMemory());
			// System.out.println(i + " " + checkMemory());
			// if (checkMemory())
			// trueCounter++;
		}
		// System.out.println("true " + trueCounter + " of " + TEST_SIZE);
	}

	private static void fill(int addr, int size) {
		int[] data = new int[size];
		for (int i = 0; i < size; i++) {
			data[i] = random.nextInt(100);
			memory.write(addr + i, data[i]);
		}
		testMap.put(addr, data);
	}

	private static boolean check(int[] a, int[] b) {
		if ((a == null) || (b == null) || (a.length != b.length)) {
			return false;
		}
		for (int i = 0; i < a.length; i++)
			if (a[i] != b[i]) {
				return false;
			}
		return true;
	}

	private static boolean checkMemory() {
		for (int i = 0; i < list.size(); i++) {
			int[] data = new int[listSize.get(i)];
			for (int j = 0; j < data.length; j++)
				data[j] = memory.read(list.get(i) + j);
			if (!check(data, (int[]) testMap.get(list.get(i))))
				return false;
		}
		return true;
	}

}
