package ua.kpi.io33.zakolenko.lab5;

/**
 * This class describe data about object Word.
 * 
 * @author Roman Zakolenko
 * @version 1,6 22 Apr 2014
 */
public class Word {

	/**
	 * Field "word" which houses the meaning of the word.
	 */
	private String word;
	/**
	 * An array of objects of class Letter, of which the word.
	 */
	private Letter[] letters;

	/**
	 * @param a
	 *            this variable is assigned to the field "word".
	 */
	public Word(String a) {
		setWord(a);
		this.letters = new Letter[a.length()];
		for (int i = 0; i < a.length(); i++) {
			letters[i] = new Letter(a.charAt(i));
		}
	}

	/**
	 * @return value of field "word".
	 */
	public String getWord() {
		return new String(word);
	}

	/**
	 * @param word
	 *            is assigned to the field "word".
	 */
	public void setWord(String word) {
		this.word = new String(word);
	}

	/**
	 * @return field "letters".
	 */
	public Letter[] getLetters() {
		return letters.clone();
	}

	/**
	 * @param letter
	 *            is assigned to the field "letters".
	 */
	public void setLetters(Letter[] letter) {
		this.letters = letter.clone();
	}

	public StringBuffer collectWord() {
		StringBuffer s = new StringBuffer();
		for (int i = 0; i < this.letters.length; i++) {
			s.append(letters[i].getLetter());
		}
		return s;
	}

}
