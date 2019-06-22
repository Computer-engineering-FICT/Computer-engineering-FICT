package ua.kpi.io33.zakolenko.lab5;

/**
 * This class describe data about object Punctuation.
 * 
 * @author Roman Zakolenko
 * @version 1,6 22 Apr 2014
 */
public class Punctuation {
	/**
	 * Field "symbol" which houses the meaning of the punctuation.
	 */
	private char symbol;
	/**
	 * Field "position" which houses the meaning of the position of punctuation
	 * of sentence.
	 */
	private int position;

	/**
	 * @param a
	 *            this variable is assigned to the field "symbol".
	 * @param p
	 *            this variable is assigned to the field "position".
	 */
	public Punctuation(char a, int p) {
		setSymbol(a);
		setPosition(p);
	}

	/**
	 * @return value of field "symbol".
	 */
	public char getSymbol() {
		return symbol;
	}

	/**
	 * @param symbol
	 *            is assigned to the field "symbol".
	 */
	public void setSymbol(char symbol) {
		this.symbol = symbol;
	}

	/**
	 * @return field "position".
	 */
	public int getPosition() {
		return position;
	}

	/**
	 * @param position
	 *            is assigned to the field "position".
	 */
	public void setPosition(int position) {
		this.position = position;
	}
}
