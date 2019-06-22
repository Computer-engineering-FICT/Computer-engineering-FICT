
public class test {

		// Тест первый - частотный.
		public static double test1(byte[] result) {
			double suma = 0;
			for (int i = 0; i < result.length; i++) if (result[i]==1) suma++;
			return (suma / result.length);
		}
				
		// Тест второй - дифференциально частотный
		public static double test2(byte[] result) {
			double suma = 0;
			for (int i = 0; i < result.length - 1; i++) if (result[i] != result[i + 1]) suma++;
			return Math.abs(suma / result.length - 1);
		}
			
		// Тест третий - ранговый.
		public static int[] test3(byte[] result, int window_width) {
			int[] table = new int[1 << window_width];
			int value_inside_window = 0;
			final int last_step = result.length - window_width + 1;
			for (int i = 0; i < last_step; i++) {
				value_inside_window = 0;
				for (int j = 0; j < window_width; j++) 
					if (result[i + j]==1) value_inside_window += 1 << j;
				table[value_inside_window]++;
			}
			return table;
		}
				
		// Тест четветрый - линейная проверка
		private static int[] IncC(int[]c,int[]b){
			int[]nc=new int[c.length];
			for(int i=0;i<nc.length;i++)
			nc[i]=(c[i]+b[i])%2;
			return nc;
		}
		private static int[]IncB(int[]b,int x){
			int[]nb=new int[b.length];
			for(int i=0;i<b.length-x;i++)nb[i+x]=b[i];
			return nb;
		}
		public static void test4(byte[]a){
			int x=1,l=0,n=0,d;
			int[]c=new int[a.length],b=new int[a.length],t=new int[a.length];
			c[0]=1;
			b[0]=1;
			do{
				d=a[n];
				for(int i=1;i<l;i++)d=(c[i]*a[n-i]+d)%2;
				if(d==0){x++;n++;}
				else{ if(2*l>n){
					c=IncC(c, IncB(b, x));
					x++;
					n++;
				}
				else {
					l=n+1-l;
					for(int i=0;i<c.length;i++)t[i]=c[i];
					c=IncC(c, IncB(b, x));
					for (int i=0;i<b.length;i++)b[i]=t[i];
					x=1;
					n++;
				}
				}
			}while(n<a.length);
			System.out.println("Результаты 4-го теста(линейная проверка):"+(l));
	}
}
