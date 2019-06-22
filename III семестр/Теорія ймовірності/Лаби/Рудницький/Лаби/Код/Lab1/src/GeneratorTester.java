public class GeneratorTester {
	public static double frequancyTest(int[] array) {
		int result = 0;
		for (int i = 0; i < array.length; i++) {
			if(array[i] == 1) {
				result++;
			}
		}
		return ((double) result/array.length);
	}
	
	public static double xorFrequancyTest(int[] array) {
		int result = 0;
		for (int i = 0; i < array.length - 1; i++) {
			if ((array[i] ^ array[i + 1]) == 1) {
				result++;
			}
		}
		return ((double) result/(array.length - 1));
	}
	
	public static int[] rankTest(int[] array, int width){
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
		return result;
	}
	
	public static void complexityTest(int[] array) {
	    final int N = array.length;
	    int[] b = new int[N];
	    int[] c = new int[N];
	    int[] t = new int[N];
	    b[0] = 1;
	    c[0] = 1;
	    int l = 0;
	    int m = -1;
	    for (int n = 0; n < N; n++) {
	        int d = 0;
	        for (int i = 0; i <= l; i++) {
	            d ^= c[i] * array[n - i];
	        }
	        if (d == 1) {
	            System.arraycopy(c, 0, t, 0, N);
	            int N_M = n - m;
	            for (int j = 0; j < N - N_M; j++) {
	                c[N_M + j] ^= b[j];
	            }
	            if (l <= n / 2) {
	                l = n + 1 - l;
	                m = n;
	                System.arraycopy(t, 0, b, 0, N);
	            }
	        }
	    }
	    System.out.println(l);
	}
}
