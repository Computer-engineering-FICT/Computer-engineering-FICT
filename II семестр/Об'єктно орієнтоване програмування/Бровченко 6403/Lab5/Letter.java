package Lab5;

/**
 * Created by Nastya on 19.04.2017.
 */
public class Letter {
    private char data;
    protected String letter;

    public Letter(char sumbol) {
        data = sumbol;
        letter = String.valueOf(sumbol);
    }

    // метод повертає задану букву
    public char getLetter() {
        return data;
    }

    // метод перевіряє чи є задана буква голосною
    public boolean isVowelLetter() {
        if ((letter.equalsIgnoreCase("a")) | (letter.equalsIgnoreCase("e"))
                | (letter.equalsIgnoreCase("u"))
                | (letter.equalsIgnoreCase("y"))
                | (letter.equalsIgnoreCase("i"))
                | (letter.equalsIgnoreCase("o")))
            return true;
        else
            return false;
    }

}
