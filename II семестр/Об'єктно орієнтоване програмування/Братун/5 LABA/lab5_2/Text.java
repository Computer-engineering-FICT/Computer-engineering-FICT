package ua.kpi.io33.zakolenko.lab5;

/**
 * This class describe data about object Text.
 * 
 * @author Roman Zakolenko
 * @version 1,6 22 Apr 2014
 */
public class Text {
	/**
	 * Field "txt" which houses the meaning of the text.
	 */
	private String txt;
	/**
	 * An array of objects of class Sentence, of which the text.
	 */
	private Sentence[] sentence;

	/**
	 * @param s
	 *            this variable is assigned to the field "txt".
	 */
	public Text(String s) {
		String s1 = s.replaceAll("\\s+", " ");
		setTxt(s1);
		String sent1[] = s1.split("\\.|!|\\?");
		this.sentence = new Sentence[sent1.length];
		int z = 0;
		for (int i = 0; i < sent1.length; i++) {
			z = z + sent1[i].length();
			sentence[i] = new Sentence(sent1[i], s1.charAt(z + i));
		}
	}

	/**
	 * @return value of field "txt".
	 */
	public String getTxt() {
		return new String(txt);
	}

	/**
	 * @param txt
	 *            is assigned to the field "txt".
	 */
	public void setTxt(String txt) {
		this.txt = new String(txt);
	}

	/**
	 * @return field "sentence".
	 */
	public Sentence[] getSentence() {
		return sentence.clone();
	}

	/**
	 * @param sentence
	 *            is assigned to the field "sentence".
	 */
	public void setSentence(Sentence[] sentence) {
		this.sentence = sentence.clone();
	}

	public StringBuffer collectText() {
		StringBuffer s = new StringBuffer();
		for (int i = 0; i < this.sentence.length; i++) {
			s.append(sentence[i].collectSentence());
		}
		return s;
	}
}
