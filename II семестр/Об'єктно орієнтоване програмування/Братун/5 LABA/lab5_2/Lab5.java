package ua.kpi.io33.zakolenko.lab5;

/**
 * Is used to create objects of the class Text and Letter, as well as to remove
 * from the specified substring of this string.
 * 
 * @author Roman Zakolenko
 * @version 1,7 07 Apr 2014
 * @see ua.kpi.io33.zakolenko.lab5.Text ua.kpi.io33.zakolenko.lab5.Sentence
 *      ua.kpi.io33.zakolenko.lab5.Word ua.kpi.io33.zakolenko.lab5.Letter
 *      ua.kpi.io33.zakolenko.lab5.Punctuation
 */
public class Lab5 {

	/**
	 * Method that removes from the specified string specified substring.
	 * 
	 * @param t
	 *            associated with an object of class Text.
	 * @param a
	 *            indicates the beginning of the substring.
	 * @param b
	 *            indicates the end of the substring.
	 */
	public static void removeOfString(Text t, Letter a, Letter b) {
		boolean k = true;
		StringBuffer s = new StringBuffer();
		for (int i = 0; i < t.getSentence().length; i++) {
			int a1 = t.getSentence()[i].getSent().indexOf(a.getLetter());
			int b1 = t.getSentence()[i].getSent().lastIndexOf(b.getLetter());
			if (a1 != -1 && b1 != -1) {
				s.append(t.getSentence()[i].getSent().substring(0, a1)
						+ t.getSentence()[i].getSent().substring(b1 + 1));
				k = false;
			} else {
				s.append(t.getSentence()[i].getSent());
			}
		}
		if (k) {
			System.out.println("В данной строке не найдено заданых символов.");
		} else {
			Text t1 = new Text(s.toString());
			System.out.println("Вы ввели текст:" + "\n" + t.getTxt());
			System.out.println("Отредактированный текст:");
			System.out.println(t1.getTxt());
		}
	}

	public static void main(String[] args) {
		String s = "Толкин подготовил несколько карт Средиземья и отдельных его областей, "
				+ "где проходят события его            произведений! Не все они были опубликованы "
				+ "при жизни.";
		Text b = new Text(s);
		Letter a = new Letter('н');
		Letter k = new Letter('й');
		removeOfString(b, a, k);
		Sentence w1 = new Sentence("Roma poshel spat, potomu chto", '.');
		System.out.println(w1.collectSentence());
		System.out.println(b.collectText());
	}
}
