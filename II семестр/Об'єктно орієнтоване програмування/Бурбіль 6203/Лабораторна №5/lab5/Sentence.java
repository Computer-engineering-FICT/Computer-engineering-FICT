package lab5;
import java.util.ArrayList;

/**
 * Created by Max-Burbil on 06.04.2017.
 */
public class Sentence {
    protected String sentenc;
    ArrayList<Word> word = new ArrayList<Word>();

    Sentence(String txt) {
        this.sentenc = txt;


        for (String word_iter : this.sentenc.split(" ")) {
            this.word.add(new Word(word_iter));

        }
    }
}
