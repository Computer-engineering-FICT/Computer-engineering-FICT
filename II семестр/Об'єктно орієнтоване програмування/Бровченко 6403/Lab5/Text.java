package Lab5;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Nastya on 19.04.2017.
 */

class Text {
    private Sentence[] data;
    private String text;
    private String allText;

    Text(String atext) {
        allText = atext;
        text = atext;
        char sumbol;
        int k = 0;
        int i;
        int j = 0;
        // виконуємо заміну послідовності табуляцій одним пробілом
        text = tab(text);
        // знаходимо кількість речень у тексті
        for (j = 0; j < text.length(); j++) {
            sumbol = text.charAt(j);
            if (sumbol == '.') {
                if ((j > 1)
                        && (j < text.length() - 1)
                        && ((text.charAt(j + 1) == '.') && (text.charAt(j + 2) == '.'))) {
                    k++;
                    j++;
                    j++;
                } else {

                    k++;
                }
            } else if ((sumbol == '?') | (sumbol == '!')) {

                k++;
            }
        }
		/*
		 * створюємо масив об'єктів класу Sentence розміром k
		 */
        Sentence[] sentenses = new Sentence[k];
        i = 0;
        int l = -1;
		/*
		 * записуємо кожне речення у елемент масиву sentenses
		 */
        for (j = 0; j < text.length(); j++) {
            sumbol = text.charAt(j);

            if (sumbol == '.') {
                if ((j > 1)
                        && (j < text.length() - 1)
                        && ((text.charAt(j + 1) == '.') && (text.charAt(j + 2) == '.'))) {
                    l++;
                    sentenses[l] = new Sentence(text.substring(i, j + 3));
                    i = j + 3;
                    j++;
                    j++;
                } else {
                    l++;
                    sentenses[l] = new Sentence(text.substring(i, j + 1));
                    i = j + 2;
                }
            } else if ((sumbol == '?') | (sumbol == '!')) {
                l++;
                sentenses[l] = new Sentence(text.substring(i, j + 1));
                i = j + 2;

            }

        }
        data = sentenses;
    }

    // метод замінює послідовність табуляцій одним пробілом
    private String tab(String str) {
        StringBuffer x = new StringBuffer(str);
        for (int i = 0; i < x.length(); i++) {

            if (x.charAt(i) == ' ') {
                do
                    if (x.charAt(i + 1) == ' ')
                        x.deleteCharAt(i);
                while ((x.charAt(i + 1) == ' '));
            }

        }

        str = new String(x);
        return str;
    }

    // метод повертає речення по його номеру i
    public String getSentences(int i) {
        return data[i].GetSen();
    }

    // метод повертає кількість речень
    public int sentenceNumber() {
        return data.length;
    }

    // метод повертає весь текст
    public String getText() {
        return allText;
    }



}