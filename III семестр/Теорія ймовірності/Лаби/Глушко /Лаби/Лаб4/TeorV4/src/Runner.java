
public class Runner {
	public static void main(String[] args) {
		double [] y = {13, 1, 6, 2};
		double [][] x = {{1, 2, 1, 4},  		//x1
						 {3, 6, 2, 5},		//x2
						 {7, 2, 3, 1}};		//x3

		double [][] covar = new double [3][3];
		
		double [][] l1 = new double [3][3];
		double [][] l2 = new double [3][3];
		double [][] l3 = new double [3][3];
		
//zapolnenie matrici covariacii
		for (int i = 0; i < covar.length; i++) {
			for (int j = 0; j < covar[i].length; j++) {
				covar[i][j] = Analisys.covar(x[i], x[j]);
				l1[i][j] = covar[i][j];
				l2[i][j] = covar[i][j];
				l3[i][j] = covar[i][j];
			}
		}
		
		for (int i = 0; i < l1.length; i++) {
			l1[i][0] = Analisys.covar(x[i], y);
			l2[i][1] = l1[i][0];
			l3[i][2] = l1[i][0];
		}
		
		double beta1 = Analisys.determ(l1)/Analisys.determ(covar);
		double beta2 = Analisys.determ(l2)/Analisys.determ(covar);
		double beta3 = Analisys.determ(l3)/Analisys.determ(covar);
		
		double alpha = Analisys.mx(y)-beta1*Analisys.mx(x[0])-beta2*Analisys.mx(x[1])-beta3*Analisys.mx(x[2]);
		
		System.out.println("y(x) = " + alpha + " + " + beta1 + "*x1 + " + beta2 + "*x2 + " + beta3 + "*x3");
		
	}
}
