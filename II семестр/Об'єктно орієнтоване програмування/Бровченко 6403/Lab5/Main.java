package Lab5;

/**
 * Created by Nastya on 19.04.2017.
 */
public class Main {
    public static void main(String[] args) {
        String text = "London is the capital of Great Britain.";
        if ((text.substring(0).trim().equals(""))) {
            System.out.println("no text");
        } else {
			/*
			 * створюємо об'єкт класу Text, та передаємо йому текст, який
			 * складаєть з масиву об'ектів класу Sentence
			 */
            Text txt = new Text(text);
            System.out.println(txt.getText());
            System.out.println();
            // Створюємо об'єкт класу Sentence
            Sentence s;
            int count_vowel_letter;
            int max_word_vowel_letter = 0;
			/*
			 * шукаємо максимальну кількість голосних був в одному слові
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
			 * відповідно до максимальної кількості голосних виводимо слова
			 * заданого тексту
			 */
            for (int k = 0; k <= max_word_vowel_letter; k++) {
				/*
				 * переглядаємо всі речення
				 */
                for (int i = 0; i < txt.sentenceNumber(); i++) {
					/*
					 * передаємо об'єкту s i-те речення
					 */
                    s = new Sentence(txt.getSentences(i));
					/*
					 * переглядаємо всі слова даного речення
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

