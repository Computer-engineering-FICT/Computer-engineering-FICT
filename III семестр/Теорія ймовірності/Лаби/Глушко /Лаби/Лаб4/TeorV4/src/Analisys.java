
public class Analisys {

//математическое ожидание	
	public static double mx(double[] chisla){
		double m = 0;
		
		for (int i = 0; i < chisla.length; i++) {
			m += chisla[i];
		}
		m /= chisla.length;
		return m;
	}

//дисперсия	
	public static double dispersia(double[] chisla){
		double moz = mx(chisla);
		double d = 0;
		
		for (int i = 0; i < chisla.length; i++) {
			d += Math.pow(chisla[i] - moz, 2);
		}
		return d/chisla.length;
	}
	
	public static double sigma (double[] chisla){
		return Math.sqrt(dispersia(chisla));
	}

//ковариация	
	public static double covar (double[] x, double[] y){
		
		double cov=0;
		double mx = mx(x);
		double my = mx(y);
		for (int i=0 ;i< x.length; i++){
			cov+=(x[i]-mx)*(y[i]-my);
		}
		cov/=x.length;
		return cov;
	}

//корреляция	
	public static double coral (double[] x, double[] y){
		return covar(x, y)/(sigma(x) * sigma(y));
	}
	
//детерминант
	public static double determ (double[][] mas){
		if (mas.length == 3 & mas[0].length == 3){
			return mas[0][0]*mas[1][1]*mas[2][2]-mas[0][0]*mas[1][2]*mas[2][1]-mas[0][1]*mas[1][0]*mas[2][2]+mas[0][1]*mas[1][2]*mas[2][0]+mas[0][2]*mas[1][0]*mas[2][1]-mas[0][2]*mas[1][1]*mas[2][0];
		}
		System.out.println("dimention of matrix must be 3x3");
		return 0;
	}
	
		public static int getSign (int i, int j){
			if ((double)(i+j)/2 == (i+j)/2){
				return 1;
			}else{
				return -1;
			}
		}
		
		public static double [][] getSolveMatrix (double [][]a, int ex){
			double [][] res = new double [a.length][a[0].length-1];
			int k = 0;
			int l = 0; 
			for (int i=0; i< a.length; i++){
					l =0;
					for (int j=0; j< a[0].length-1; j++){
						if (j!=ex){
							res[i][l] = a[i][j];
							l++;
						}else{
							res[i][l] = a[i][a[0].length-1];
							l++;
						}
					}
					k++;
			}
			return res;
		}
		
		public static double [][] getMatrix (double [][]a, int exy, int exx){
			if (a.length != a[0].length){
				System.out.println("Wrong dimension! Results false!!!!!");
			}
			double [][] res = new double [a.length-1][a.length-1];
			int k = 0;
			int l = 0; 
			for (int i=0; i< a.length; i++){
				if (i!=exy){
					l =0;
					for (int j=0; j< a[0].length; j++){
						if (j!=exx){
							res[k][l] = a[i][j];
							l++;
						}
					}
					k++;
				}
			}
			return res;
		}
		
		public static double determinant (double [][] a){
			double res = 0;
			if (a.length != a[0].length){
				System.out.println("Wrong dimension! Results false!!!!!");
			}else{
				if (a.length ==1){
					res = a[0][0];
				}else{
					for (int i=0; i<a.length; i++){			
						res+=getSign(0,i)*a[i][0]*determinant(getMatrix(a,i,0));
					}
				}			
			}		
			return res;
		}
}