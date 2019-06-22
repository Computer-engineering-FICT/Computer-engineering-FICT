package random;

/**
 * генератор LFSR рознесеного типа
 * 
 */
public class LFSR {
	// степень первого полинома
	static final int START_PRIME_POLYNOMIALS = 4;
	// коэффициенты простых полиномов [4;20]
	static int[][] coefficientsPrimePolynomials = { { 2 }, { 1 }, { 0 }, { 2 },
			{ 3, 2, 1 }, { 3 }, { 2 }, { 1 }, { 5, 3, 0 }, { 3, 2, 0 },
			{ 9, 5, 0 }, { 0 }, { 11, 2, 0 }, { 2 }, { 6 }, { 4, 1, 0 }, { 2 } };
	private int indexPolynomial;// индекс полинома в массиве
	private int indexLast;// индекс последнего элемента
	private Registers register;// регистры

	/**
	 * @param capacity
	 *            - разрядность
	 * @param startValue
	 *            - начальное значение регистров
	 */
	public LFSR(int capacity, long startValue) {
		register = new Registers(capacity, startValue);
		if (startValue == 0)
			throw new IllegalArgumentException();
		indexPolynomial = capacity - START_PRIME_POLYNOMIALS;
		indexLast = capacity - 1;

	}

	/**
	 * функция обратной связи
	 * 
	 * @return
	 */
	private int f() {
		int result = register.getRegister(indexLast);
		for (int i = 0; i < coefficientsPrimePolynomials[indexPolynomial].length; i++) {
			result = result
					^ register
							.getRegister(coefficientsPrimePolynomials[indexPolynomial][i]);
		}
		return result;
	}

	/**возращает следующий бит
	 * @return
	 */
	public int next() {
		int result = register.getRegister(indexLast);
		int valueF = f();
		register.setRigester(indexLast, 0);
		register.leftShift();
		register.setRigester(0, valueF);
		return result;
	}

	/** количество регистров памяти
	 * @return
	 */
	public int getCapacity() {
		return register.getLength();
	}

}
