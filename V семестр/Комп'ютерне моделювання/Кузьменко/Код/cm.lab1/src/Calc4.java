import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;



public class Calc4 {
	private final BigDecimal mu;
	private final BigDecimal sigma;
	public static long ITER = 1000;
	public static MathContext context = new MathContext(100);
	private Random randomGussian = new Random();
	private BigDecimal[] masLognormal;;

	public Calc4(double mu, double v, int n) {
		this.mu = BigDecimalUtils.ln(new BigDecimal(mu), 100);
		this.sigma = new BigDecimal(v);
		masLognormal = new BigDecimal[n];

	}

	public void generate() {
		for (int i = 0; i < masLognormal.length; i++) {

			masLognormal[i] = new BigDecimal(0);
			masLognormal[i] =masLognormal[i]
					.add(BigDecimalUtils.exp(
							BigDecimalUtils.sqrt(sigma, 100)
									.multiply(
											new BigDecimal(randomGussian
													.nextGaussian())).add(mu), 100));
		}
		BigDecimal sum = new BigDecimal(0);

		for (int i = 0; i < masLognormal.length; i++) {

			sum = sum.add(masLognormal[i]);
		}
		sum = sum.divide(new BigDecimal(masLognormal.length),
				RoundingMode.HALF_UP);
		System.out.println("Мат очікування експериментальне "
				+ sum.doubleValue());

		BigDecimal buf = new BigDecimal(0);
		buf = buf.add(mu);
		BigDecimal rr =sigma.divide(new BigDecimal(2)); 
		buf = buf.add(rr);
		BigDecimal sumTeor = BigDecimalUtils.exp(buf, 100);

		System.out.println("Маточікування        теоретичне "
				+ sumTeor);
		double dusp = 0;

		BigDecimal duspBig = new BigDecimal(new Double(0));
		duspBig.setScale(1000, BigDecimal.ROUND_UNNECESSARY);

		for (int i = 0; i < masLognormal.length; i++) {
			duspBig = duspBig.add(pow(masLognormal[i].subtract(sum), 2));
		}

		System.out.println();

		BigDecimal q = new BigDecimal(masLognormal.length - 1);
		q.setScale(1000);
		duspBig = duspBig.divide(q, RoundingMode.HALF_UP);
		System.out.println("Дисперсія експериментальна "
				+ duspBig.doubleValue());

		BigDecimal duspTeor = (BigDecimalUtils.exp(sigma, 100)
				.subtract(new BigDecimal(1))).multiply(BigDecimalUtils.exp(mu
				.multiply(new BigDecimal(2)).add(sigma), 100));
		System.out.println("Дисперсія       теоретична " + duspTeor);

		System.out.println();
		Arrays.sort(masLognormal);
		System.out.println("Медіана експериментальна "
				+ masLognormal[masLognormal.length / 2]);

		System.out.println("Медіана       теоретична " + BigDecimalUtils.exp(mu, 100));

		BigDecimal bigSum = new BigDecimal(0);

		for (int i = 0; i < masLognormal.length; i++) {
			bigSum = bigSum.add(masLognormal[i]);
		}
		bigSum = bigSum.divide(new BigDecimal(masLognormal.length),
				RoundingMode.HALF_UP);

		
		BigDecimal nlm = BigDecimalUtils.ln(bigSum, 100);
		BigDecimal mnMed = mu;

		BigDecimal res = nlm.subtract(mnMed);
		System.out.println("sigma "+BigDecimalUtils.sqrt(res.multiply(new BigDecimal(2)),100));
	}

	public void writeData() {
		System.out.println("Запис..");
		ArrayList<Double> result = new ArrayList<Double>();
		for (BigDecimal value : masLognormal) {
			result.add(value.doubleValue());
		}

		try {
			ObjectOutputStream oos = new ObjectOutputStream(
					new FileOutputStream("result.dat"));
			oos.writeObject(result);
			oos.close();
			System.out.println("Готово!");
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private BigDecimal pow(BigDecimal a, int b) {
		BigDecimal res = a;
		for (int i = 0; i < b - 1; i++) {
			res = res.multiply(a);
		}
		return res;
	}

	public static BigDecimal ln(BigDecimal x) {
		if (x.equals(BigDecimal.ONE)) {
			return BigDecimal.ZERO;
		}

		x = x.subtract(BigDecimal.ONE);
		BigDecimal ret = new BigDecimal(ITER + 1);
		for (long i = ITER; i >= 0; i--) {
			BigDecimal N = new BigDecimal(i / 2 + 1).pow(2);
			N = N.multiply(x, context);
			ret = N.divide(ret, context);

			N = new BigDecimal(i + 1);
			ret = ret.add(N, context);

		}

		ret = x.divide(ret, context);
		return ret;
	}

	private BigDecimal factorial(int n) {
		BigDecimal fact = new BigDecimal(1);
		for (int i = 0; i < n; i++) {
			fact = fact.multiply(new BigDecimal(i + 1));
		}
		return fact;
	}
}
