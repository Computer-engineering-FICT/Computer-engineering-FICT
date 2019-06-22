package random;

/**
 * �������� ������
 *
 */
public class Registers {
	private int length;//
	private long registers;//

	/**
	 * @param countRegister
	 *            - ����� ��������
	 */
	public Registers(int countRegister) {
		if (countRegister > 0)
			this.length = countRegister;
		else
			throw new IllegalArgumentException();
		registers = 0;
	}

	/**
	 * @param countRegister
	 *            -����� ��������
	 * @param value
	 *            - ��������
	 */
	public Registers(int countRegister, long value) {
		this(countRegister);
		registers = value;
	}

	/**
	 * ��������� ����� ��������
	 * 
	 * @return
	 */
	public int getLength() {
		return length;
	}

	/**
	 * ������ �������� ��������
	 * 
	 * @param number
	 *            - �����
	 * @param value
	 *            - ��������
	 */
	public void setRigester(int number, int value) {
		if ((number < 0) || (number >= length))
			throw new IndexOutOfBoundsException();
		if ((value < 0) || (value > 1))
			throw new IllegalArgumentException();
		long v = value << number;
		registers = registers | v;
	}

	/**
	 * ��������� �������� ��������
	 * 
	 * @param number
	 *            - ����� ��������
	 * @return
	 */
	public int getRegister(int number) {
		if ((number < 0) || (number >= length))
			throw new IndexOutOfBoundsException();
		long result = registers & (1 << number);
		result = result >> number;
		return (int) result;
	}

	/**
	 * ��������� �������� ���� ��������
	 * 
	 * @return
	 */
	public long getAllRegister() {
		return registers;
	}

	/**
	 * ����� ����� �� ���� ������
	 */
	public void leftShift() {
		registers = registers << 1;
	}

	/**
	 * ����� ������ �� ���� ������
	 */
	public void rightShift() {
		registers = registers >> 1;
	}
}
