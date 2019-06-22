
public class Lab1_PT {
	static int NumberIteration =10000 ;

	public static void main(String[] args) {
		RandomGenerator r = new RandomGenerator(NumberIteration);
		int [] randomTest = r.getRandomValue();
		System.out.print("Диференційний Тест: ");
		System.out.println(test1(randomTest));
		System.out.print("Частотний тест: ");
		System.out.println(test2(randomTest));
		System.out.println("Ранговий Тест");
		for (int i = 0; i < test3(randomTest, 5).length; i++) {
			System.out.println("rang "+i+" : "+test3(randomTest, 5)[i]);
		}
		System.out.println("Тест з лінійною складністю");
		test4(randomTest);
		
	}
	
	// тест 1 - частотний
	public static double test1(int[] result) {
		double suma = 0;
		for (int i = 0; i < result.length; i++)
			if (result[i] == 1)
				suma++;
		return (suma / result.length);
	}

	// тест 2 - диференційний частотний
	public static double test2(int[] result) {
		double suma = 0;
		for (int i = 0; i < result.length - 1; i++)
			if (result[i] != result[i + 1])
				suma++;
		return Math.abs(suma / result.length - 1);
	}
	// тест 3 - ранговий
	public static int[] test3(int[] result, int window_width) {
		int[] table = new int[1 << window_width];
		int value_inside_window = 0;
		final int last_step = result.length - window_width + 1;
		for (int i = 0; i < last_step; i++) {
			value_inside_window = 0;
			for (int j = 0; j < window_width; j++)
				if (result[i + j] == 1)
					value_inside_window += 1 << j;
			table[value_inside_window]++;
		}
		return table;
	}
	
	// тест 4 - тест на лінійну складність вибірки
	public static void test4 (int [] s)
	{
		byte [] b,c,t;
		b = new byte[s.length];
		c = new byte[s.length];
		t = new byte[s.length];
		b[0]=1;
		c[0]=1;
		int N,L,m;
		N=0;
		L=0;
		m=-1;
		int d;
	    while (N < s.length)
	    {	      
	    	d = 0;
	        for (int i = 0; i <= L; i++) 
	            d += s[N-i] * c[i];
	        d = d % 2;	  
		    if (d != 0)
	        {
		    	t = (byte[])c.clone();
			    for (int i = 0; i <= s.length + m - 1 - N; i++)
			    	c[N - m + i] = (byte)(c[N - m + i] ^ b[i]);
			     if (L <= (N / 2))
			     {
			    	 L = N + 1 - L;
			         m = N;
			         b = (byte[])t.clone();
			            }
			  }
			        N++;
			  }
	    System.out.print(L);
	}
}

