package Lab3;





public class Lagr {

	private double values [][];
	private double a;
	private double b;
	
	public double[][] getFunctValues(){
		return values;
	}
	
	public String showTable(){
		StringBuffer result = new StringBuffer("<html>");
		double interpol[] = new double[12];
		for (int i = 1; i < interpol.length; i++) {
			countTable(0, 5, i);
			interpol[i] = lagr(a, b, 3.232323, i);
		}
		double delta;
		double deltaExact;
		double kDelta;
		for (int i = 1; i < interpol.length - 1; i++) {
			delta = interpol[i] - interpol[i + 1];
			countTable(0, 5, i);
			deltaExact = interpol[i] - getFunctionValue(3.232323);
			kDelta = Math.abs(1 - delta/deltaExact);
			result.append("n = " + i);
			result.append(" delta = " + delta);
			result.append(" deltaExact = " + deltaExact);
			result.append(" kDelta = " + kDelta + "<br>");
		}
		return result.toString();
	}
	public int fact(int n){
		int result = 1;
		for(int i = 1; i < n+1; i++){
			result *= i;
		}
		return result;
	}
	
	public void countTable(double a, double b, int n){
		this.a = a;
		this.b = b;
		double h = (b - a)/n;
		values = new double [n+1][2];
		for (int i = 0; i < values.length; i++) {
			values[i][0] = a + i*h;
			values[i][1] = getFunctionValue(a + i*h);
		}
	}
	public double lagr(double a, double b, double x, int n){
		double h = (b - a)/n;
		double m = (x - a)/h;
		
		
		double result = 0;
		double inres = 1;
		
		
		for (int i = 0; i < values.length; i++) {
			inres = 1;
			for (int j = 0; j < values.length; j++) {
				if(i != j){
					inres *= (m - j);
				}
			}
			
			result += (Math.pow(-1, (n - i)))*inres*values[i][1]/(fact(i)*fact(n - i));
		}
		return result;
	}
	
	
	public double getFunctionValue(double x){
	//	return Math.sin(x);
		return Math.pow(Math.E, Math.sin(x));
	}
	public static void main(String[] args) {
		double arg = Math.PI*0.25;
		Lagr ob = new Lagr();
		ob.countTable(0, 5, 10);
		System.out.println(ob.lagr(0, 5, 1.5, 10));


	}

}
