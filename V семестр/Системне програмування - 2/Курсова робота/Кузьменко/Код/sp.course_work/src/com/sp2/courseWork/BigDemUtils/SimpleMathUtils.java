/*
 * 
 */
package com.sp2.courseWork.BigDemUtils;

import java.math.BigDecimal;
import java.math.BigInteger;

import static com.sp2.courseWork.BigDemUtils.Utils.*;

// TODO: Auto-generated Javadoc

/**
 * The Class SimpleMathUtils.
 *
 * @author Kuzmenko Volodimir
 */
public class SimpleMathUtils {

	/**
	 * sine.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return sin(x)
	 */
	public static BigDecimal sin(final BigDecimal x) {
		BigDecimal arg = toLowRadians(x);
		BigDecimal res = new BigDecimal(BigInteger.ZERO, mc);
		BigDecimal d;
		BigInteger fact = BigInteger.ONE;
		BigInteger minusOne = BigInteger.ONE;
		minusOne = minusOne.multiply(new BigInteger("-1"));
		BigDecimal buf;
		int flag = 1;

		for (int k = 0; k < flag; k++) {
			buf = res;
			d = arg.pow(2 * k + 1);
			fact = factorial(2 * k + 1).multiply(minusOne.pow(k));
			d = d.divide(new BigDecimal(fact), mc);
			res = res.add(d, mc);
			if (!res.toString().equalsIgnoreCase(buf.toString())) {
				flag = flag + 1;
			}
		}
		return res;

	}

	/**
	 * sine.
	 *
	 * @param x
	 *            double argument
	 * @return sin(x)
	 */
	public static BigDecimal sin(final double x) {
		return sin(new BigDecimal(x));
	}

	/**
	 * sine.
	 *
	 * @param x
	 *            String argument
	 * @return sin(x)
	 */
	public static BigDecimal sin(final String x) {
		return sin(new BigDecimal(x));
	}

	/**
	 * cosine.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return cos(x)
	 */
	static public BigDecimal cos(final BigDecimal x) {
		BigDecimal arg = toLowRadians(x);
		BigDecimal res = new BigDecimal(BigInteger.ZERO);
		BigDecimal d;
		BigInteger fact = BigInteger.ONE;
		BigInteger minusOne = BigInteger.ONE;
		minusOne = minusOne.multiply(new BigInteger("-1"));
		int flag = 1;
		BigDecimal buf;
		for (int k = 0; k < flag; k++) {
			buf = res;
			d = arg.pow(2 * k, mc);
			fact = factorial(2 * k).multiply(minusOne.pow(k));
			d = d.divide(new BigDecimal(fact), mc);
			res = res.add(d, mc);
			if (!res.toString().equalsIgnoreCase(buf.toString())) {
				flag = flag + 1;
			}
		}
		return res;
	}

	/**
	 * cosine.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return cos(x)
	 */
	public static BigDecimal cos(final double x) {
		return sin(new BigDecimal(x, mc));
	}

	/**
	 * cosine.
	 *
	 * @param x
	 *            String argument
	 * @return cos(x)
	 */
	public static BigDecimal cos(final String x) {
		return cos(new BigDecimal(x, mc));
	}

	/**
	 * tangent.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return tan(x)
	 */
	public static BigDecimal tan(final BigDecimal x) {
		BigDecimal b = sin(x);
		b = b.divide(cos(x), mc);
		return b;

	}

	/**
	 * tangents.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return sin(x)
	 */
	public static BigDecimal tan(final double x) {
		return tan(new BigDecimal(x, mc));
	}

	/**
	 * tangent.
	 *
	 * @param x
	 *            String argument
	 * @return sin(x)
	 */
	public static BigDecimal tan(final String x) {
		return tan(new BigDecimal(x, mc));
	}

	/**
	 * cotangent.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return ctan(x)
	 */
	public static BigDecimal ctan(final BigDecimal x) {
		BigDecimal b = cos(x);
		b = b.divide(sin(x), mc);
		return b;
	}

	/**
	 * cotangent.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return ctan(x)
	 */
	public static BigDecimal ctan(final double x) {
		return ctan(new BigDecimal(x, mc));
	}

	/**
	 * cotangent.
	 *
	 * @param x
	 *            String argument
	 * @return ctan(x)
	 */
	public static BigDecimal ctan(final String x) {
		return ctan(new BigDecimal(x, mc));
	}

	/**
	 * arc sine.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return asin(x)
	 */
	public static BigDecimal asin(final BigDecimal x) {
		if (x.abs().compareTo(BigDecimal.ONE) == 1) {
			throw new IllegalArgumentException("|x|<1");
		} else {
			BigInteger fact1;
			BigInteger fact2;
			BigDecimal res = BigDecimal.ZERO;
			BigDecimal b;
			BigDecimal g;
			BigInteger two = new BigInteger("2");
			BigDecimal buf;
			int flag = 1;
			for (int k = 0; k < flag; k++) {
				buf = res;
				fact1 = factorial(2 * k);
				fact2 = factorial(k);
				fact2 = fact2.pow(2);
				fact2 = fact2.multiply(new BigInteger(Integer
						.toString(2 * k + 1)));
				fact2 = fact2.multiply(two.pow(2 * k));
				b = new BigDecimal(fact1, mc);
				b = b.divide(new BigDecimal(fact2, mc), mc);
				g = x.pow(2 * k + 1, mc);
				b = b.multiply(g, mc);
				res = res.add(b, mc);
				if (!res.toString().equalsIgnoreCase(buf.toString())) {
					flag = flag + 1;
				}
			}
			return res;
		}
	}

	/**
	 * arc sine.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return asin(x)
	 */
	public static BigDecimal asin(final double x) {
		return asin(new BigDecimal(x, mc));
	}

	/**
	 * arc sine.
	 *
	 * @param x
	 *            String argument
	 * @return asin(x)
	 */
	public static BigDecimal asin(final String x) {
		return asin(new BigDecimal(x, mc));
	}

	/**
	 * arc cosine.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return acos(x)
	 */
	public static BigDecimal acos(final BigDecimal x) {
		if (x.abs().compareTo(BigDecimal.ONE) == 1) {
			throw new IllegalArgumentException("|x|<1");
		} else {
			BigDecimal pito2 = PI.divide(new BigDecimal(2));
			return pito2.subtract(asin(x), mc);
		}
	}

	/**
	 * arc cosine.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return cosine(x)
	 */
	public static BigDecimal acos(final double x) {
		return acos(new BigDecimal(x, mc));
	}

	/**
	 * arc cosine.
	 *
	 * @param x
	 *            String argument
	 * @return acos(x)
	 */
	public static BigDecimal acos(final String x) {
		return acos(new BigDecimal(x, mc));
	}

	/**
	 * arc tangent.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return atan(x)
	 */
	public static BigDecimal atan(final BigDecimal x) {
		BigDecimal b;
		BigDecimal res = BigDecimal.ZERO;
		BigDecimal g;
		BigDecimal buf;
		int flag = 1;
		for (int k = 0; k < flag; k++) {
			buf = res;
			b = new BigDecimal((2 * k + 1) * Math.pow(-1, k));
			g = x.pow(2 * k + 1, mc);
			g = g.divide(b, mc);
			res = res.add(g, mc);
			if (!res.toString().equalsIgnoreCase(buf.toString())) {
				flag = flag + 1;
			}
		}
		return res;
	}

	/**
	 * arc tangent.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return atan(x)
	 */
	public static BigDecimal atan(final double x) {
		return actan(new BigDecimal(x, mc));
	}

	/**
	 * arc tangent.
	 *
	 * @param x
	 *            String argument
	 * @return atan(x)
	 */
	public static BigDecimal atan(final String x) {
		return actan(new BigDecimal(x, mc));
	}

	/**
	 * arc cotangent.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return actan(x)
	 */
	public static BigDecimal actan(final BigDecimal x) {
		BigDecimal pito2 = PI.divide(new BigDecimal(2));
		return pito2.subtract(atan(x), mc);
	}

	/**
	 * arc cotangent.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return atan(x)
	 */
	public static BigDecimal actan(final double x) {
		return actan(new BigDecimal(x, mc));
	}

	/**
	 * arc cotangent.
	 *
	 * @param x
	 *            String argument
	 * @return atan(x)
	 */
	public static BigDecimal actan(final String x) {
		return atan(new BigDecimal(x, mc));
	}

	/**
	 * hyperbolic sine.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return sinh(x)
	 */
	public static BigDecimal sinh(final BigDecimal x) {
		BigDecimal res = exp(x);
		res = res.subtract(exp(x.multiply(new BigDecimal(-1))), mc);
		res = res.divide(new BigDecimal(2), mc);
		return res;
	}

	/**
	 * hyperbolic sine.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return sinh(x)
	 */
	public static BigDecimal sinh(final double x) {
		return sinh(new BigDecimal(x, mc));
	}

	/**
	 * hyperbolic sine.
	 *
	 * @param x
	 *            String argument
	 * @return sin(x)
	 */
	public static BigDecimal sinh(final String x) {
		return sinh(new BigDecimal(x, mc));
	}

	/**
	 * hyperbolic cosine.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return cosh(x)
	 */
	public static BigDecimal cosh(final BigDecimal x) {
		BigDecimal res = exp(x);
		res = res.add(exp(x.multiply(new BigDecimal(-1))), mc);
		res = res.divide(new BigDecimal(2), mc);
		return res;
	}

	/**
	 * hyperbolic cosine.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return cosh(x)
	 */
	public static BigDecimal cosh(final double x) {
		return cosh(new BigDecimal(x, mc));
	}

	/**
	 * hyperbolic cosine.
	 *
	 * @param x
	 *            String argument
	 * @return cosh(x)
	 */
	public static BigDecimal cosh(final String x) {
		return cosh(new BigDecimal(x, mc));
	}

	/**
	 * hyperbolic tangent.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return tanh(x)
	 */
	public static BigDecimal tanh(final BigDecimal x) {
		BigDecimal b = sinh(x);
		b = b.divide(cosh(x), mc);
		return b;
	}

	/**
	 * hyperbolic tangent.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return tanh(x)
	 */
	public static BigDecimal tanh(final double x) {
		return tanh(new BigDecimal(x, mc));
	}

	/**
	 * hyperbolic tangent.
	 *
	 * @param x
	 *            String argument
	 * @return tanh(x)
	 */
	public static BigDecimal tanh(final String x) {
		return tanh(new BigDecimal(x, mc));
	}

	/**
	 * hyperbolic cotangent.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return s(x)
	 */
	public static BigDecimal ctanh(final BigDecimal x) {
		return BigDecimal.ONE.divide(tanh(x), mc);
	}

	/**
	 * hyperbolic cotangent.
	 *
	 * @param x
	 *            double argument
	 * @return ctanh(x)
	 */
	public static BigDecimal ctanh(final double x) {
		return ctanh(new BigDecimal(x, mc));
	}

	/**
	 * hyperbolic cotangent.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return sin(x)
	 */
	public static BigDecimal ctanh(final String x) {
		return exp(new BigDecimal(x, mc));
	}

	/**
	 * exponent with double arguments.
	 *
	 * @param x
	 *            double argument
	 * @return exp(x)
	 */
	public static BigDecimal exp(double x) {
		return exp(new BigDecimal(x, mc));
	}

	/**
	 * exponent with BigDecimal agruments.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return exp(x)
	 */
	public static BigDecimal exp(BigDecimal x) {
		BigDecimal d;
		BigDecimal res = BigDecimal.ZERO;
		BigDecimal buf;
		int flag = 1;
		for (int k = 0; k < flag; k++) {
			buf = res;
			d = x.pow(k, mc);
			d = d.divide(new BigDecimal(factorial(k)), mc);
			res = res.add(d, mc);
			if (!res.toString().equalsIgnoreCase(buf.toString())) {
				flag = flag + 1;
			}
		}
		return res;
	}

	/**
	 * exponent with String arguments.
	 *
	 * @param x
	 *            String argument
	 * @return exp(x)
	 */
	public static BigDecimal exp(String x) {
		return exp(new BigDecimal(x, mc));
	}

	/**
	 * natural logarithm.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return ln(x)
	 */
	public static BigDecimal ln(BigDecimal x) {
		BigDecimal b = x.subtract(BigDecimal.ONE, mc);
		b = b.divide(x.add(BigDecimal.ONE), mc);
		BigDecimal res = BigDecimal.ZERO;
		BigDecimal d;
		BigDecimal buf;
		int flag = 1;
		for (int k = 0; k < flag; k++) {
			buf = res;
			d = BigDecimal.ONE.divide(new BigDecimal(2 * k + 1), mc);
			d = d.multiply(b.pow(2 * k + 1), mc);
			res = res.add(d, mc);
			if (!res.toString().equalsIgnoreCase(buf.toString())) {
				flag = flag + 1;
			}
		}
		return res.multiply(new BigDecimal(2), mc);

	}

	/**
	 * natural logarithm with double arguments.
	 *
	 * @param x
	 *            double argument
	 * @return ln(x)
	 */
	public static BigDecimal ln(double x) {
		return ln(new BigDecimal(x));
	}

	/**
	 * natural logarithm.
	 *
	 * @param x
	 *            String argument
	 * @return ln(x)
	 */
	public static BigDecimal ln(String x) {
		return ln(new BigDecimal(x, mc));
	}

	/**
	 * common logarithm.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return sin(x)
	 */
	public static BigDecimal lg(BigDecimal x) {
		BigDecimal res = ln(x);
		BigDecimal b = ln(10.0);
		return res.divide(b, mc);
	}

	/**
	 * common logarithm.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return lg(x)
	 */
	public static BigDecimal lg(double x) {
		return lg(new BigDecimal(x, mc));
	}

	/**
	 * common logarithm.
	 *
	 * @param x
	 *            String argument
	 * @return lg(x)
	 */
	public static BigDecimal lg(String x) {
		return (new BigDecimal(x, mc));
	}

	/**
	 * logarithm.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @param a
	 *            the a
	 * @return log(x)
	 */
	public static BigDecimal log(BigDecimal x, BigDecimal a) {
		BigDecimal res = ln(x);
		BigDecimal b = ln(a);
		return res.divide(b, mc);
	}

	/**
	 * logarithm.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @param a
	 *            the a
	 * @return log(x)
	 */
	public static BigDecimal log(double x, double a) {
		return log(new BigDecimal(x), new BigDecimal(x));
	}

	/**
	 * logarithm.
	 *
	 * @param x
	 *            String argument
	 * @param a
	 *            the a
	 * @return log(x)
	 */
	public static BigDecimal log(String x, String a) {
		return log(new BigDecimal(x, mc), new BigDecimal(a, mc));
	}

	/**
	 * square root.
	 *
	 * @param x
	 *            BigDecimal argument
	 * @return sqrt(x)
	 */
	public static BigDecimal sqrt(BigDecimal x) {
		if (x.signum() < 0) {
			throw new IllegalArgumentException("x < 0");
		}
		BigInteger n = x.movePointRight(mc.getPrecision() << 1).toBigInteger();
		int bits = (n.bitLength() + 1) >> 1;
		BigInteger ix = n.shiftRight(bits);
		BigInteger ixPrev;
		do {
			ixPrev = ix;
			ix = ix.add(n.divide(ix)).shiftRight(1);
		} while (ix.compareTo(ixPrev) != 0);

		return new BigDecimal(ix, mc.getPrecision());
	}

	/**
	 * square root.
	 *
	 * @param x
	 *            double argument
	 * @return sqrt(x)
	 */
	public static BigDecimal sqrt(double x) {
		return sqrt(new BigDecimal(x, mc));
	}

	/**
	 * square root.
	 *
	 * @param x
	 *            String argument
	 * @return sqrt(x)
	 */
	public static BigDecimal sqrt(String x) {
		return sqrt(new BigDecimal(x, mc));
	}

}
