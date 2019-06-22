import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;

public class Calc3 {
	private double mu;
	private double sigma;
	
	private Random randomGussian = new Random();
	private double [] masLognormal;
	
	public Calc3(double psi, double v,int n) {
		this.mu = Math.log(psi);
		this.sigma = v;
		masLognormal = new double [n];
		
	}
	
	public void generate(){
		for (int i = 0; i < masLognormal.length; i++) {
			masLognormal[i]=Math.exp(mu + Math.sqrt(sigma)*randomGussian.nextGaussian());
		}
		double sum = 0;
		
		for (int i = 0; i < masLognormal.length; i++) {
			sum +=masLognormal[i];
		}
		sum=sum/masLognormal.length;
		System.out.println("Мат очікування експериментальне "+sum);
		
		double sumTeor = Math.exp(mu+sigma/2);
		System.out.println("Маточікування        теоретичне "+sumTeor);
		double dusp =0;
		
		BigDecimal duspBig = new BigDecimal(new Double(0));
		duspBig.setScale(1000, BigDecimal.ROUND_UNNECESSARY);
		
		for (int i = 0; i < masLognormal.length; i++) {
			duspBig=duspBig.add(new BigDecimal(Math.pow(masLognormal[i]-sum, 2)));
		}
		
		System.out.println();
		
		BigDecimal q = new BigDecimal(masLognormal.length-1);
		q.setScale(1000);
		duspBig = duspBig.divide(q,RoundingMode.HALF_UP);
		System.out.println("Дисперсія експериментальна "+duspBig.doubleValue());
		double duspTeor = (Math.exp(sigma)-1)*Math.exp(2*mu+sigma);
		System.out.println("Дисперсія       теоретична "+duspTeor);
		System.out.println();
		Arrays.sort(masLognormal);
		System.out.println("Медіана експериментальна "+masLognormal[masLognormal.length/2]);
		System.out.println("Медіана       теоретична "+Math.exp(mu));
		
	}
	
	public void writeData(){
		System.out.println("");
		ArrayList<Double> result = new ArrayList<Double>();
		for (Double value : masLognormal) {
			result.add(value);
		}
		
		try {
			ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("result.dat"));
			oos.writeObject(result);
			oos.close();
			System.out.println("Готово");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
