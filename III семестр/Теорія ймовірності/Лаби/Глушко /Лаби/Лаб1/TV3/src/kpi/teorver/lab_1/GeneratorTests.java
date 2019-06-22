package kpi.teorver.lab_1;

public class GeneratorTests {
	public static void Test1(int[] source) {
		int set = 0;
		for (int i = 0; i < source.length; i++) {
			if (source[i] == 1)
				set++;
		}
		System.out.println("Тест 1: " + set + " '1' в " + source.length
				+ " битах");
	}

	public static void Test2(int[] source) {
		int switches = 0;
		for (int i = 1; i < source.length; i++) {
			if (source[i] != source[i - 1])
				switches++;
		}
		System.out.println("Тест 2: " + switches + " разнобитных пар в " + (source.length - 1)
				+ " парах");
	}

	public static void Test3(int[] source, int wndsize) {

		int counters[] = new int[1 << wndsize];
		int j, k, idx;
		for (j=0; j<source.length - wndsize + 1; j++) {
			for (idx=0, k=0; k<wndsize; k++)
				idx |= source[j+k] << wndsize-k-1;
			counters[idx]++;
		}
		System.out.format("Тест 3: содержимое окон размера %d\n", wndsize);
		for (j=0, k=1<<wndsize; j<k; j++) {
			StringBuffer sb = new StringBuffer("\t");
			int zeros = 32 - Integer.numberOfLeadingZeros(j);
			zeros = wndsize - zeros;
			for (int i=0; i<zeros; i++)
				sb.append('0');
			if (j > 0)
				sb.append(Integer.toBinaryString(j));
			sb.append(": %d\n");
			System.out.format(sb.toString(), counters[j]);
		}
	}

	private static int tmpB[];
	private static void CorrectC(int[] C, int[] B, int x, boolean updateB) {
		int i, ex;
		if (updateB) { // save C in tmpB
			for (i=0; i<x; i++)
				tmpB[i] = C[i];
		}
		for (i=x, ex=0; i<C.length; i++) {
			if (updateB) // save C in tmpB (continue)
				tmpB[i] = C[i];
			ex = ex + C[i] & B[i-x];
			C[i] = ex & 1;
			ex >>= 1;
		}
	}

	public static void Test4(int[] source) {
		int x = 1, L = 0, N = 0, d;
		int[] C = new int[source.length], B = new int[source.length], t;
		tmpB = new int[source.length];
		C[0] = 1;
		B[0] = 1;
		do {
			// step 2
			d = source[N];
			// Calculating formula from step 2
			for (int j = 1; j < L; j++)
				d ^= C[j] & source[N - j];
			if (d == 0) // step 3; on success skip steps 4, 5
				x++;
			else { // failure on step 3, go through steps 4 or 5
				if (2 * L > N) { // step 4: correct C and x:=x+1
					CorrectC(C, B, x, false);
					x++;
				} else { // step 5: correct C, save previous C into B and X:=1
					L = N + 1 - L;
					CorrectC(C, B, x, true); // tmpB will contain previous C
					// swap B and tmpB so B will contain previous C
					t = B;
					B = tmpB;
					tmpB = t;
					x = 1;
				}
			}
			N++; // step 6 followed by check for completion
		} while (N < source.length);
		System.out.format("Тест 4: Линейная сложность последовательности :%d\n", L);
	}

}
