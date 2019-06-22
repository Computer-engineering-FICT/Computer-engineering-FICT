import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;


public class Calc2 {
	private double psi;
	private double v;
	private Random random = new Random();
	public Calc2(double psi, double sigma) {
		this.psi = psi;
		//sigma = v^2
		this.v = sigma;
		calcLaplasMas();
		calcTj();
		test();
		
		for (int i = 0; i < laplasArg.length; i++) {
		//	System.out.println(laplasArg[i]+"|"+laplasF[i]);
		}
	}

	private double[] laplasF = new double[501];
	private double[] laplasArg = new double [501];
	
	public double [] masTj = new double [2000];

	

	private void calcLaplas() {
		double arg = 0;
		double h = 0.01;

		int i = 0;
		while (arg < 5) {
			laplasArg[i] = arg;
			laplasF[i] = Math.rint(10000.0 * CalcIntegral(0, arg, 500)) / 10000.0;
			arg += h;
			i++;
		}
		

	}

	private double CalcIntegral(double a, double b, int n) {
		double result, h;
		int i;

		h = (b - a) / n; // Шаг сетки
		result = 0;

		for (i = 1; i <= n; i++) {
			result += InFunction(a + h * i - h / 2); // Вычисляем в средней
														// точке и добавляем в
														// сумму
		}
		result *= h;

		return result;
	}

	private double InFunction(double t) {
		return (1 / Math.sqrt(2 * Math.PI)) * Math.exp(-Math.pow(t, 2) / 2);
	}

	public void calcLaplasMas() {
		calcLaplas();

		
	}
	private void calcTj(){
		
		for (int i = 0; i < masTj.length; i++) {
			double argum = Math.random()-0.5;
			argum = Math.rint(10000.0 * argum) / 10000.0;
			
			int j;
			for (j=0; j < laplasF.length-1; j++) {
				if (Math.abs(argum)<laplasF[j+1] & Math.abs(argum)>laplasF[j]){
					break;
				}
			}	
			
			//System.out.println(argum+"|"+laplasF[j]);
			double agr;
			if (argum<0){
				agr = -laplasArg[j];
				
			}else{
				agr = laplasArg[j];
			}
			
			
			masTj[i]= (Math.exp(Math.log(psi))+agr*2*v*v);
		}
	}
	public void test (){
		double d = 0;
		for (int i = 0; i < masTj.length; i++) {
			d+=masTj[i];
		}
		d=d/masTj.length;
		
		double dusp =0;
		
		for (int i = 0; i < masTj.length; i++) {
			dusp+=Math.pow(masTj[i]-d, 2);
		}
		dusp = dusp/(masTj.length-1);
		System.out.println("середнє "+d);
		Arrays.sort(masTj);
		System.out.println("мода "+masTj[masTj.length/2]);
		
		System.out.println(dusp);
		System.out.println();
		
		//Arrays.sort(masTj);
		//System.out.println("md "+masTj[masTj.length/2]);
	}
	public ArrayList<Double> getTj(){
		ArrayList<Double> arlist = new ArrayList<>();
		for (int i = 0; i < masTj.length; i++) {
			arlist.add(masTj[i]);
		}
		return arlist;
	}
}
