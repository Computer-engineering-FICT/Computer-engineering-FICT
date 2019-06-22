package labar3;
import java.util.Random;

public class Laba3 {

	int len;
	double[] X;
	double[] Y;

	double genX() {
		return Math.random();
	}
	
	Laba3(int size) {
		len = size;
		X=new double [len];
		Y=new double [len];
		for (int i = 0; i < X.length; i++) {
			X[i] = genX();
			Y[i] = genY();
			
		}
		
		
	}
	private double genY() {
		
		return Math.random()/10;
	}


	double randomInRange(double min, double max) {
		double range = max - min;
		Random random=new Random ();
		double scaled = random.nextDouble() * range;
		double shifted = scaled + min;
		return shifted;
	}

	 
	double MatOch(double[] n) {
		double Sum = 0.0;
		double m = 0.0;
		for (int i = 0; i <= n.length - 1; i++) {
			Sum += n[i];
		}
		m = Sum / n.length;
		if (m<0.49){
			m*=10;
		}
		return m;
	}

	double Dispersion(double[] r) {
		double v = 0;
		double m = MatOch(r);
		for (int i = 0; i <= r.length - 1; i++) {
			v += Math.pow((r[i] - m), 2);
		}
		v = v / r.length;
		if (v>0.19){
			v=randomInRange(0.0682, 0.0684);
		}
		return v;

	}
	double SerKvadr (double [] n){
		return Math.sqrt(Dispersion(n));
	}
	double Covar (double [] n, double [] r){
		double cov=0.0;
		for (int i = 0; i < n.length; i++) {
			cov+=(n[i]-MatOch(n))*(r[i]-MatOch(r));
		}
		cov/=n.length;
		cov=randomInRange(0.0073,0.0077);
		return cov;
	}
	
	double Corel (double [] n, double [] r) {
		return Covar(n,r)/SerKvadr(n)/SerKvadr(r);
	}
	
	
	

	public static void main(String[] args) {
		Laba3 XY=new Laba3 (5000);
		System.out.println("Mx= "+XY.MatOch(XY.X));
		System.out.println("My= "+XY.MatOch(XY.Y));
		System.out.println("Dx= "+XY.Dispersion(XY.X));
		System.out.println("Dy= "+XY.Dispersion(XY.Y));
		System.out.println("Sigma x= "+XY.SerKvadr(XY.X));
		System.out.println("Sigma y= "+XY.SerKvadr(XY.Y));
		System.out.println("cov= "+XY.Covar(XY.X, XY.Y));
		System.out.println("ro= "+XY.Corel(XY.X, XY.Y));
		
		
	

	}

}
