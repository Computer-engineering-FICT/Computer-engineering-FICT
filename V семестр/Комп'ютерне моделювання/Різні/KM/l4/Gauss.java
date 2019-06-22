package l4;

public class Gauss {
		//Розв'язання системи лінійних рівняннь методом Гаусса

		private final static int nn=20;

		private double[][] a;
		private double[] x;
		private double[] b;
		private int n;
		private double d;

		public double[] getResult(double[][] koef, double[] free){
			a = new double[nn][nn];
			x = new double[nn];
			b = new double[nn];
			
			n = koef.length;

			for(int i=1;i<=n;i++){
				for(int j=1;j<=n;j++){
					a[i][j]=koef[i-1][j-1];
				}
			}

			//заповнення вектору вільних членів
			for(int i=1;i<=n;i++){
				b[i] = free[i-1];
			}
			
			//Прямий хід
			for(int i=1;i<=n-1;i++){
				for(int k=i+1;k<=n;k++){
					d = a[k][i]/a[i][i];
					for (int j=i+1;j<=n;j++){
						a[k][j] = a[k][j]-a[i][j]*d;
					}
					b[k] = b[k]-b[i]*d;
				}
			}
			
			//Зворотній хід
			for(int i=n;i>=1;i--){
				for(int j=i+1;j<=n;j++){
					b[i] = b[i]-a[i][j]*x[j];
				}
				x[i] = b[i]/a[i][i];
			}

			double[] rez = new double[n];
			for(int i=1;i<=n;i++){
				rez[i-1] = x[i];
			}
			return rez;
		}
}
