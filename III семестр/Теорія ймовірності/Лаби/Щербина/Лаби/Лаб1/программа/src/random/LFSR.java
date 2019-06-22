package random;

/**
 * ��������� LFSR ����������� ����
 * 
 */
public class LFSR {
	// ������� ������� ��������
	static final int START_PRIME_POLYNOMIALS = 4;
	// ������������ ������� ��������� [4;20]
	static int[][] coefficientsPrimePolynomials = { { 2 }, { 1 }, { 0 }, { 2 },
			{ 3, 2, 1 }, { 3 }, { 2 }, { 1 }, { 5, 3, 0 }, { 3, 2, 0 },
			{ 9, 5, 0 }, { 0 }, { 11, 2, 0 }, { 2 }, { 6 }, { 4, 1, 0 }, { 2 } };
	private int indexPolynomial;// ������ �������� � �������
	private int indexLast;// ������ ���������� ��������
	private Registers register;// ��������

	/**
	 * @param capacity
	 *            - �����������
	 * @param startValue
	 *            - ��������� �������� ���������
	 */
	public LFSR(int capacity, long startValue) {
		register = new Registers(capacity, startValue);
		if (startValue == 0)
			throw new IllegalArgumentException();
		indexPolynomial = capacity - START_PRIME_POLYNOMIALS;
		indexLast = capacity - 1;

	}

	/**
	 * ������� �������� �����
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

	/**��������� ��������� ���
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

	/** ���������� ��������� ������
	 * @return
	 */
	public int getCapacity() {
		return register.getLength();
	}

}
