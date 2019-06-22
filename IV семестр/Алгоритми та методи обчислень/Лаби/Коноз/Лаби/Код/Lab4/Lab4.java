package Lab4;

public class Lab4 {

	private double secondDerivative(double x){
		return 2 + Math.cos(Math.PI*x);
	}
	private double firstDerivitate(double x){
		return 2*x + Math.PI*Math.sin(Math.PI*x);
	}
	public double function(double x){
		return x*x - Math.cos(Math.PI*x);
	}
	
	private double metHord(double constant, double x){
		return x - (function(x)*(constant-x))/(function(constant) - function(x));
	}
	
	public double solveFunktion(double a, double b, double eps){
		double result = 0.0;
		if(function(b)*secondDerivative(b) > 0)
			result = counting(b, a, eps);
		else if (function(a)*secondDerivative(a) > 0)
			result = counting(a, b, eps);
		
		
		return result;
	}
	
	private double counting(double constant, double change, double eps){
		double x = metHord(constant, change);
		while(Math.abs(x - change) > eps){
			change = x;
			x = metHord(constant, change);
		}
		return x;
	}

}
