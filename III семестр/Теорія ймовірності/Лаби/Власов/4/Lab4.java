package terVer.lab4;
/**
 * @author Maxym Vlasov
 * @version 1.0
 */
public class Lab4 {
	public static void main(String[] args) {
		double x1[] = {50, 3, 7, 15, 56, 87, 114, 21};
		double y[] = {9, 4, 23, 27, 5, 8, 99, 2};
		int n=8;
		
		double x2[] = new double [n];
		double x3[] = new double [n];
		double cov[][] = new double [3][3];
		double cov1[][] = new double [3][3];
		double cov2[][] = new double [3][3];
		double cov3[][] = new double [3][3];
		
		for(int i=0; i<x1.length; i++){
			x2[i] = Math.pow(x1[i], 2);
		}
		
		for(int i=0; i<x1.length; i++){
			x3[i] = Math.pow(x1[i], 3);
		}
		double my=0;
		double mx1=0;
		double mx2=0;
		double mx3=0;
		double mx[] = new double [3]; 
		
		for (int i=0; i<n; i++){
			mx1 += x1[i];
			mx2 += x2[i];
			mx3 += x3[i];
			my += y[i];
		}
		mx1 = mx1/n;
		mx2 = mx2/n;
		mx3 = mx3/n;
		my=my/n;
		for (int i = 0; i < mx.length; i++) {	
			mx[0]=mx1;
			mx[1]=mx2;
			mx[2]=mx3;
		}
		double x[][]=new double [3][n];
		for(int i=0; i<3; i++){
			for (int j=0; j<n; j++){
				x[0][j]=x1[j];
				x[1][j]=x2[j];
				x[2][j] = x3[j];
			}
		}
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				double s=0;
				for (int z = 0; z < n; z++) {
					s+=(x[i][z]-mx[i])*(x[j][z]-mx[j]);
				}
				cov[i][j]=s/n;
				cov1[i][j]=cov[i][j];
				cov2[i][j]=cov[i][j];
				cov3[i][j]=cov[i][j];
				
			}
			
		}
		double L=0;
		double L1=0;
		double L2=0;
		double L3=0;
		double l1=0;
		double l2=0;
		double l3=0;
		double l4=0;
		double l5=0;
		double l6=0;
		double B1=0;
		double B2=0;
		double B3=0;
		double A=0;
		
		int power = 3;
		for(int i = 0; i < power; i++){
			int j = (i + 1) % power;
			int k = (i + 2) % power;
			
			L = L + cov[0][i] * cov[1][j] * cov[2][k];
			L = L - cov[0][k] * cov[1][j] * cov[2][i];
			

			
		}
		for (int i = 0; i < 3; i++) {
			double s=0;
			for (int j = 0; j < n; j++) {
				s+=(x[i][j]-mx[i])*(y[j]-my);
				
			}
			cov1[1][i]=s/n;
			}
		for(int i = 0; i < power; i++){
			int j = (i + 1) % power;
			int k = (i + 2) % power;
			
			L1 = L1 + cov[0][i] * cov[1][j] * cov[2][k];
			L1 = L1 - cov[0][k] * cov[1][j] * cov[2][i];
			
			double s=0;
			
			for (int m = 0; m < n; j++) {
				s+=(x[i][m]-mx[i])*(y[m]-my);
				
			}
			cov2[1][i]=s/n;
		}
		for(int i = 0; i < power; i++){
			int j = (i + 1) % power;
			int k = (i + 2) % power;
			
			L2 = L2 + cov[0][i] * cov[1][j] * cov[2][k];
			L2 = L2 - cov[0][k] * cov[1][j] * cov[2][i];
			
			double s=0;
			
			for (int m = 0; m < n; j++) {
				s+=(x[i][m]-mx[i])*(y[m]-my);
				
			}
			cov3[2][i]=s/n;
		}
		for(int i = 0; i < power; i++){
			int j = (i + 1) % power;
			int k = (i + 2) % power;
			
			L3 = L3 + cov[0][i] * cov[1][j] * cov[2][k];
			L3 = L3 - cov[0][k] * cov[1][j] * cov[2][i];
			
		
		}
	
		
		B1=L1/L;
		B2=L2/L;
		B3=L3/L;
		for (int i = 0; i < n; i++) {
			l4+=1-y[i];
			l1+=1-x1[i];
			l2+=1-x2[i];
			l3+=1-x3[i];
		}
		A = my-mx1*B1-mx2*B2-mx3*B3;
		System.out.println("y= "+ A + " + " + B1 +" x + "+B2+" x^2 + "+B3+" x^3");
	}
}
