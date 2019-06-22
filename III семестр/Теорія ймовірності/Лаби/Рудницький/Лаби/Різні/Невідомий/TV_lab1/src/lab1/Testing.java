package lab1;
public class Testing {
	public static void FrequencyTest(int[] ary) {
		int freq = 0;
		for (int i = 0; i < ary.length; ++i) {
			if (ary[i] == 1) {
				freq = freq + 1;
			}
		}
		System.out.println("Результат частотного тесту вибірки: "
				+ (double) freq / (double) ary.length);
	}

	public static void DifFrequencyTest(int[] ary) {
		int dif = 0;
		for (int i = 0; i < (ary.length - 1); ++i) {
			if (ary[i] != ary[i + 1]) {
				dif = dif + 1;
			}
		}
		System.out.println("Результат диференційного частотного тесту: "
				+ (double) dif / (double) (ary.length - 1));
	}

	public static void RangTest(int[] array, int width){
		if (width <= 0 || width > 10) {
			throw new IllegalArgumentException("Width must be range [2;10]");
		}
		int[] result = new int[(int)Math.pow(2, width)];
		int window;
		for (int i = 0; i < array.length - width; i++){
			window = 0;
			for (int j = 0; j < width; j++) {
				window = window << 1;
				window = window | array[i + j];
			}
			result[window]++;
		}
		System.out.println("Результат рангового тесту(для вікна=4): ");
		for (int i = 0; i < result.length; i++) {
			System.out.println((int)result[i]);
		}
	}

	public static void LinearComplexityTest(int[] array) {
		final int n = array.length;
		int[] B = new int[n];
	int[] C = new int[n];
	B[0] = 1;
	C[0] = 1;
	int L = 0;
	int x = 1;
	for(int N = 0; N < n; N++){
		int d = array[N];
		for (int j = 1; j <= L; j++) {
			d ^= C[j] * array[N - j];
		}
		if(d==0){
			x++;
		}else{
			if(2*L>N){
				C[N]^=((int) Math.pow(N, x))*B[N];
				x++;
			}else{
				L=N+1-L;
				C[N]^=((int) Math.pow(N, x))*B[N];
				B[N]=C[N];
				x=1;
			}
		}
	}
	 System.out.println("Результат тесту на складність: "+ L);
}
}
