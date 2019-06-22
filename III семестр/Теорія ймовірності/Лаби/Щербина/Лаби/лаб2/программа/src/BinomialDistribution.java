import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.Random;

/**
 * ������������ �������������
 * 
 * @author Nikita
 * 
 */
public class BinomialDistribution {
	public MathContext eps = new MathContext(500, RoundingMode.HALF_UP);// ��������
	private BigDecimal[] F;// ������������ �������
	private Random random = new Random();// ��������� ��������� �����

	/**
	 * �����������
	 * 
	 * @param n
	 *            - ����������
	 * @param p
	 *            - �����������
	 */
	public BinomialDistribution(int n, double p) {

		BigDecimal bigP = new BigDecimal(p);
		BigDecimal bigQ = BigDecimal.ONE.subtract(bigP);

		BigInteger[] c = new BigInteger[n + 1];// �������� ������������ �
		BigDecimal[] p_i = new BigDecimal[n + 1];// �������� � � ������� i
		BigDecimal[] q_i = new BigDecimal[n + 1];// �������� q � ������� n-i

		// ���������� q � ������� i
		q_i[n] = BigDecimal.ONE;
		q_i[n - 1] = bigQ;

		for (int i = n - 2; i > -1; i--) {
			q_i[i] = q_i[i + 1].multiply(bigQ, eps);
		}
		// System.out.println("q � ������� n-i");
		// for (int i = 0; i < q_i.length; i++) {
		// System.out.println(i + " " + q_i[i].toString());
		// }

		// ���������� p � ������� i
		p_i[0] = BigDecimal.ONE;
		p_i[1] = bigP;
		for (int i = 2; i < p_i.length; i++) {
			p_i[i] = p_i[i - 1].multiply(bigP, eps);
		}
		// System.out.println("p � ������� i");
		// for (int i = 0; i < p_i.length; i++) {
		// System.out.println(i + " " + p_i[i].toString());
		// }

		// ���������� ������������ �
		BigInteger[] bigNumber = new BigInteger[n + 1];
		for (int i = 0; i < bigNumber.length; i++)
			bigNumber[i] = new BigInteger(Integer.toString(i));
		c[0] = bigNumber[1];
		c[1] = bigNumber[n];
		int k = n / 2;
		if (n % 2 == 1)
			k++;
		for (int i = 2; i <= k; i++)
			c[i] = c[i - 1].multiply(bigNumber[n - i + 1]).divide(bigNumber[i]);
		for (int i = k + 1; i < c.length; i++) {
			c[i] = c[n - i];
		}

//		 System.out.println("����������� �");
//		 for (int i = 0; i < c.length; i++) {
//		 System.out.println(i + " " + c[i].toString());
//		 }

		// ���������� ������������ �� ������� �������
		BigDecimal[] pX = new BigDecimal[n + 1];
		for (int i = 0; i < pX.length; i++) {
			BigDecimal bigDecimalC = new BigDecimal(c[i]);
			pX[i] = bigDecimalC.multiply(p_i[i].multiply(q_i[i]));
		}
//		 double summa=0;
//		 System.out.println("�������� P[i]");
//		 for (int i = 0; i < pX.length; i++) {
//		 System.out.println(i + " " + pX[i].toString());
//		 summa+=pX[i].doubleValue();
//		 }
//		 System.out.println("����� ����������� = "+summa);

		// ���������� ������������� ������� F(x)
		F = new BigDecimal[n + 2];
		F[0] = pX[0];
		for (int i = 1; i < pX.length; i++) {
			F[i] = F[i - 1].add(pX[i]);
		}
//		 System.out.println("�������� F(x)]");
//		 for (int i = 0; i < pX.length; i++) {
//		 System.out.println(i + " " + F[i].toString());
//		 }
	}

	/**
	 * ������ ��������� �����
	 * 
	 * @return
	 */
	public int nextNumber() {
		double dr = random.nextDouble();
		BigDecimal R = new BigDecimal(dr);
		int result = 0;
		if (R.compareTo(F[0]) >= 0) {
			int left = 0;
			int right = F.length - 1;
			int m = -1;
			while (right - left > 1) {
				m = (left + right) / 2;
				int compare = F[m].compareTo(R);
				if (compare < 0) {
					left = m;
				} else {
					if (compare > 0) {
						right = m;
					} else {
						left = m;
						break;
					}
				}
			}
			result = left + 1;
		}
		// System.out.println(result + "     r = " + R.toString());
		return result;
	}
}
