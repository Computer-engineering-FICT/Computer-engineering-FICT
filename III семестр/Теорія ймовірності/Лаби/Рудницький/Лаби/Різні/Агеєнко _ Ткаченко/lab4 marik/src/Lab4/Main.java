package Lab4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Main {
	
	static double sigma;
	static double mo;
	static double[][] g2 = {{0.020,0.040,0.103,0.211,0.446,0.713,1.386,2.41,3.22,4.6,5.99},{0.01,0.02,0.05,0.1,0.2,0.3,0.5,0.7,0.8,0.9,0.95}};
	static double[][] g9 = {{2.09,2.53,3.32,4.17,5.38,6.39,8.34,10.66,12.24,14.68,16.92},{0.01,0.02,0.05,0.1,0.2,0.3,0.5,0.7,0.8,0.9,0.95}};
	static double[] an = {2.06,2.32,2.55,2.7,2.8,2.95,3.1};
	                
	public static void main(String[] args) {
		InputStream stream = System.in;
		System.out.println("Choose mode\n1.Generate sequence\n2.Input sequence");
		try {
			switch (stream.read()){
			case 49:
				generate();
				break;
			case 50:
				input();
				break;
			default:
				System.out.println("Try again next time");
				break;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static void input() {
		double[] sequence = null;
		try{
			BufferedReader stream = new BufferedReader(new InputStreamReader(System.in));
			System.out.println("Enter count <=10 and >=4");
			stream.readLine();
			int count = Integer.parseInt(stream.readLine());
			sequence = new double[count];
			for(int i=0; i<count; i++){
				System.out.println("Enter "+(i+1)+" element");
				sequence[i]=Double.parseDouble(stream.readLine());
				mo+=sequence[i];
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		Arrays.sort(sequence);
		double R = sequence[sequence.length-1]-sequence[0];
		sigma = R/an[sequence.length-4];
		mo /=sequence.length;
		System.out.println("Математическое ожидание = "+mo+"\nСреднее квадратическое отклонение = "+sigma);
		process(sequence);
	}

	private static void generate() {
		double[] sequence = new double[1000];
		Normal generator = new Normal(3.0,1.0);
		for(int i=0; i<1000; i++){
			sequence[i]=generator.next();
		}
		mo = generator.getM(sequence);
		sigma = Math.sqrt(generator.getD(sequence, mo));
		System.out.println("Математическое ожидание = "+mo+"\nСреднее квадратическое отклонение = "+sigma);
		Arrays.sort(sequence);
		process(sequence);
	}
	
	private static void process(double[] sequence){
		double[] p;
		if(sequence.length>10){
			p = new double[10];
		}else{
			p = new double[3];
		}
		double[] separator = new double[p.length+1];
		double[] m = new double[p.length];
		double hi2 = 0;
		separator[0] = sequence[0];
		separator[separator.length-1] = sequence[sequence.length-1];
		double interval =((separator[separator.length-1]-separator[0])/p.length);
		for(int i=1; i<separator.length-1; i++){
			double tmp = interval*i+separator[0];
			boolean exit =true;
			do{
				for(int j=0; j<sequence.length; j++){
					if(sequence[j]==tmp){
						exit=false;
						tmp+=0.00000001;
						break;
					}
				}
				exit=true;
				separator[i]=tmp;
			}while(exit==false);
		}
		Laplas lp;
		double S = 0;
		for(int i=0; i<m.length; i++){
			for(int j=0; j<sequence.length; j++){
				if(sequence[j]<=separator[i+1] && sequence[j]>=separator[i]){
					m[i]++;
				}
			}
			lp = new Laplas(separator[i],separator[i+1],mo,sigma);
			p[i]=lp.getP();
			S+=p[i];
			hi2+=Math.pow(m[i]-sequence.length*p[i], 2)/sequence.length/p[i];
		}
		System.out.println(S);
		//hi2/=2;
		System.out.println("hi^2="+hi2);
		double[][] g;
		double e;
		if(m.length-1==9){
			g=g9;
			e=1;
		}else{
			g=g2;
			e=0.7;
		}
		for(int i=0; i<g[0].length; i++){
			if(Math.abs(Math.round(hi2)-g[0][i])<e){
				System.out.println("Приближенное значение из таблицы = "+(g[0][i])+"\nЗначение функции g = "+g[1][i]+"\nВероятность, что величина соответствует нормальному распределению = "+(1-g[1][i]));
				break;
			}
		}
	}
}
