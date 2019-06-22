package ua.kpi.io33.zakolenko.lab5;

import java.util.ArrayList;

/**
 * This class describe data about object Sentence.
 * 
 * @author Roman Zakolenko
 * @version 1,6 22 Apr 2014
 */
public class Sentence {
	/**
	 * Field "sent" which houses the meaning of the sentence.
	 */
	private String sent;
	/**
	 * An array of objects of class Word, of which the sentence.
	 */
	private Word[] words;
	/**
	 * The list of objects of class Punctuation that contains punctuation of the
	 * sentence.
	 */
	private ArrayList<Punctuation> p;

	/**
	 * @param a
	 *            this variable is assigned to the field "sent".
	 * @param s
	 *            this variable is assigned to the field "p".
	 */
	public Sentence(String a, char s) {
		setSent(a + s);
		ArrayList<Punctuation> p1 = new ArrayList<Punctuation>();
		for (int i = 0; i < a.length(); i++) {
			if (a.charAt(i) == ',' || a.charAt(i) == ';' || a.charAt(i) == ':'
					|| a.charAt(i) == '-') {
				p1.add(new Punctuation(a.charAt(i), i));
			}
		}
		p1.add(new Punctuation(s, a.length()));
		p = p1;
		String sent1[] = a.split("[,-:;]\\s|\\s[,-:;]|[,-:;]|\\s");
		int k = 0;
		for (int i = 0; i < sent1.length; i++) {
			if (sent1[i].isEmpty()) {
				k++;
			}
		}
		this.words = new Word[sent1.length - k];
		for (int i = 0, j = 0; i < sent1.length; i++) {
			if (!sent1[i].isEmpty()) {
				words[j] = new Word(sent1[i]);
				j++;
			}
		}
	}

	/**
	 * @return value of field "sent".
	 */
	public String getSent() {
		return new String(sent);
	}

	/**
	 * @param sent
	 *            is assigned to the field "sent".
	 */
	public void setSent(String sent) {
		this.sent = new String(sent);
	}

	/**
	 * @return field "words".
	 */
	public Word[] getWords() {
		return words.clone();
	}

	/**
	 * @param word
	 *            is assigned to the field "words".
	 */
	public void setWord(Word[] word) {
		this.words = word.clone();
	}

	/**
	 * @return field "p".
	 */
	public ArrayList<Punctuation> getP() {
		return new ArrayList<Punctuation>(p);
	}

	/**
	 * @param p
	 *            is assigned to the field "p";
	 */
	public void setP(ArrayList<Punctuation> p) {
		this.p = new ArrayList<Punctuation>(p);
	}

	public StringBuffer collectSentence() {
		StringBuffer s = new StringBuffer();
		for (int i = 0, j = 0, z = 0; i < this.words.length; i++) {
			z = z + words[i].collectWord().length();
			if (z + 1 == p.get(j).getPosition()
					|| z + 2 == p.get(j).getPosition()) {
				s.append(words[i].collectWord());
				s.append(p.get(j).getSymbol());
				s.append(" ");

				j++;
			} else {
				s.append(words[i].collectWord());
				s.append(" ");
			}
		}
		s.append(p.get(p.size() - 1).getSymbol());
		return s;
	}
}
