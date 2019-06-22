package random;

/**
 * регистры памяти
 *
 */
public class Registers {
	private int length;//
	private long registers;//

	/**
	 * @param countRegister
	 *            - длина регистра
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
	 *            -длина регистра
	 * @param value
	 *            - значение
	 */
	public Registers(int countRegister, long value) {
		this(countRegister);
		registers = value;
	}

	/**
	 * возращает длину регистра
	 * 
	 * @return
	 */
	public int getLength() {
		return length;
	}

	/**
	 * задает значение регистра
	 * 
	 * @param number
	 *            - номер
	 * @param value
	 *            - значение
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
	 * возращает значение регистра
	 * 
	 * @param number
	 *            - номер регистра
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
	 * возращает значение всех регистов
	 * 
	 * @return
	 */
	public long getAllRegister() {
		return registers;
	}

	/**
	 * сдвиг влево на один разряд
	 */
	public void leftShift() {
		registers = registers << 1;
	}

	/**
	 * сдвиг вправо на один разряд
	 */
	public void rightShift() {
		registers = registers >> 1;
	}
}
