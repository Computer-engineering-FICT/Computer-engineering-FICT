package lab5;
import java.util.ArrayList;

/**
 * Created by Max-Burbil on 06.04.2017.
 */
public class Text extends Sentence {
    private String txt;

    Text(String txt) {
        super(txt);
        this.txt = txt;
    }


    ArrayList<Sentence> sentence = new ArrayList<Sentence>();
    ArrayList<Punctuation> punctuation = new ArrayList<Punctuation>();

    protected void ObjSplit() {
        int indexPunctuation = 0;
        for (String txt_iter : this.txt.split("\\.\n")) {
            this.sentence.add(new Sentence(txt_iter));
            indexPunctuation+=txt_iter.length();
            this.punctuation.add(new Punctuation(this.txt.charAt(indexPunctuation)));
            indexPunctuation++;
        }

        for(Sentence s: sentence){
            for(Word w: s.word){
                System.out.print(w.getWord());
            }
            System.out.println(" ");
        }

    }
    protected void myTask(int a, String s) {
        String words;
        String basictext = s;
        String result = "";
        for (int i = 0; i < this.word.size(); i++) {
            words = this.word.get(i).getWord();
            if (words.length() == a) {
                words = basictext;
            }
            result += words + " ";

        }
        System.out.print(result);
    }
}

