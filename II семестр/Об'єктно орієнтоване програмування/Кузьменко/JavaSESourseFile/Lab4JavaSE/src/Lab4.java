public class Lab4 {

	public static void main(String[] args) {
		String text = new String(
				"          The United Kingdom        of Great Britain   ?   Northern Ireland, is a! n - constitutional monarchy. "
						+ "The        power of Queen         Elizabeth II is  not-absolute...");
		if ((text.substring(0).trim().equals(""))) {
			System.out.println("no text");
		} else {
			/*
			 * ��������� ��'��� ����� Text, �� �������� ���� �����, ����
			 * �������� � ������ ��'���� ����� Sentence
			 */
			Text txt = new Text(text);
			System.out.println(text);
			for (int i = 0; i < txt.sentenceNumber(); i++) {
				System.out.println(txt.getSentences(i));
			}
			System.out.println();
			// ��������� ��'��� s ����� Sentence
			Sentence s;
			int count_vowel_letter;
			int max_word_vowel_letter = 0;
			/*
			 * ������ ����������� ������� �������� ��� � ������ ����
			 */
			for (int i = 0; i < txt.sentenceNumber(); i++) {
				s = new Sentence(txt.getSentences(i));
				for (int j = 0; j < s.getWord().length; j++) {
					count_vowel_letter = s.getWord()[j].find();
					if (max_word_vowel_letter < count_vowel_letter)
						max_word_vowel_letter = count_vowel_letter;
				}
			}
			/*
			 * �������� �� ����������� ������� �������� �������� �����
			 * �������� ������
			 */
			for (int k = 0; k <= max_word_vowel_letter; k++) {
				/*
				 * ����������� �� �������
				 */
				for (int i = 0; i < txt.sentenceNumber(); i++) {
					/*
					 * �������� ��'���� s i-�� �������
					 */
					s = new Sentence(txt.getSentences(i));
					/*
					 * ����������� �� ����� ������ �������
					 */
					for (int j = 0; j < s.getWord().length; j++) {
						if ((k == s.getWord()[j].find())) {
							System.out.print(s.getWord()[j].getWord().trim());
							System.out.print(" ");
						}
					}
				}
			}
		}
	}
}