package Lab4;

import org.apache.commons.math.analysis.integration.LegendreGaussIntegrator;


public class Laplas {
	
	double a;
	double b;
	double m;
	double sigma;
	double[] x;
	double[] Fx;
	
	Laplas(double a, double b, double m, double sigma){
		this.a=a;
		this.b=b;
		this.m=m;
		this.sigma=sigma;
	}
	
	public double getP(){
		double x1 = (b-m)/sigma;
		double x2 = (a-m)/sigma;
		return Math.copySign(getFx(Math.abs(x1)), x1)-Math.copySign(getFx(Math.abs(x2)), x2);
	}
	
	private double getFx(double x){
		LegendreGaussIntegrator integrator = new LegendreGaussIntegrator(5,100);
		try {
			return 1/Math.sqrt(2*Math.PI)*integrator.integrate(new LaplasFunction(), 0, x);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
