package lab5;
import java.util.ArrayList;

/**
 * Created by Max-Burbil on 06.04.2017.
 */
public class Word {
    private String word;

    ArrayList<Letter> letter = new ArrayList<Letter>();

    Word(String text) {
        this.word = text;
        ArrayList<Punctuation> punctuations = new ArrayList<Punctuation>();
        for (int j = 0; j < this.word.length(); j++) {
            if (this.word.charAt(j) == '-' || this.word.charAt(j) == ',') {
                punctuations.add(new Punctuation(text.charAt(j)));
            } else {
                this.letter.add(new Letter(text.charAt(j)));
            }

        }
    }
    protected String getWord() {
        return this.word;
    }
}
