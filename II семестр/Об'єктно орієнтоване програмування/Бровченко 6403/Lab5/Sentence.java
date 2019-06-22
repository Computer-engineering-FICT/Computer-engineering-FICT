package Lab5;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Nastya on 19.04.2017.
 */

public class Sentence {
    private Word[] data;
    private Punktuatoin[] data1;
    private String sentence;

    public Sentence(String sentence_string) {
        sentence_string = new String(sentence_string.trim());
        int word_counter;
        word_counter = 1;
        char sumbol;
        int punkruation_counter = 1;
		/*
		 * знаходимо кількість символів пунктуації і кількість слів в даному
		 * реченні
		 */
        for (int i = 0; i < sentence_string.length(); i++) {
            sumbol = sentence_string.charAt(i);
            if (sentence_string.charAt(i) == ' ') {
                word_counter++;
            }
            if ((sumbol == '.') | (sumbol == ',') | (sumbol == '!')
                    | (sumbol == '?') | (sumbol == '/') | (sumbol == ':'))
                punkruation_counter++;

        }
		/*
		 * створюємо масив об'єктів класу Word
		 */
        Word[] word = new Word[word_counter];
		/*
		 * створюємо масив об'єктів класу Punktuatoin
		 */
        Punktuatoin[] punktuatoin = new Punktuatoin[punkruation_counter];
        word_counter = 0;
        punkruation_counter = 0;
		/*
		 * ствоюємо об'єкти Word Punktuatoin одноіменних масивів
		 */
        for (int i = 0; i < sentence_string.length(); i++) {
            sumbol = sentence_string.charAt(i);
            if (((i > 1) & (i < sentence_string.length() - 1))
                    && ((sentence_string.charAt(i - 1) == ' ')
                    & ((sentence_string.charAt(i + 1)) == ' ') & (sentence_string
                    .charAt(i) == '-'))) {
                punktuatoin[punkruation_counter] = new Punktuatoin('-');
                punkruation_counter++;
                sentence_string = new String(sentence_string.replaceFirst(
                        sentence_string.substring(i - 1, i + 1), "".trim()));
            } else if ((sumbol == '.') | (sumbol == ',') | (sumbol == '!')
                    | (sumbol == '?') | (sumbol == ':')) {
                punktuatoin[punkruation_counter] = new Punktuatoin(sumbol);
                punkruation_counter++;
                sentence_string = new String(sentence_string.replaceFirst("\\ "
                        + sentence_string.substring(i, i + 1), "".trim()));

            }
        }
        sentence_string = new String(sentence_string.replace(".", ""));
        String[] l = sentence_string.split(" ");
        for (int i = 0; i < l.length; i++) {
            word[i] = new Word(l[i].trim());
        }

        sentence = sentence_string;
        data = word;
        data1 = punktuatoin;
    }

    // метод передає масив слів у заданому речення
    public Word[] getWord() {
        return data;
    }

    // метод передає масив знаків пунктуації у заданому реченні
    public Punktuatoin[] getPunktuatoins() {
        return data1;
    }

    // метод передає кількість слів у заданому реченні
    public int wordNumber() {
        return data.length;
    }

    // метод передає кількість символів пунктуації а заданому реченні
    public int punktuationNumber() {
        return data1.length;
    }

    // метод повертає задане речення
    public String GetSen() {
        return sentence;
    }

}
