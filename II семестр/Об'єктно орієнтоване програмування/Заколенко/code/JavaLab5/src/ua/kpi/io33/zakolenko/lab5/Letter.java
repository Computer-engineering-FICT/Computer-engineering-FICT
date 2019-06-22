package ua.kpi.io33.zakolenko.lab5;

/**
 * This class describe data about object Letter.
 * 
 * @author Roman Zakolenko
 * @version 1,6 22 Apr 2014
 */
public class Letter {
	/**
	 * Field "letter" which houses the meaning of the letter.
	 */
	private char letter;

	/**
	 * @param a
	 *            this variable is assigned to the field "letter".
	 */
	public Letter(char a) {
		letter = a;
	}

	/**
	 * @return value of fields "letter".
	 */
	public char getLetter() {
		return letter;
	}

	/**
	 * @param letter
	 *            is assigned to the field "letter".
	 */
	public void setLetter(char letter) {
		this.letter = letter;
	}

}
