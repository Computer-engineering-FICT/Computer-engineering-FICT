import java.*;

public class Text
{

    public Text(String text)
    {
        String[] strings = text.split("\\.");
        Sentence[] sentences = new Sentence[strings.length];

        for (int i = 0; i < strings.length; i++)
            sentences[i] = new Sentence(strings[i] + ".");

        this.text = sentences;
    }

    public String toString() {
        String s = new String();

        for (Sentence t:text)
            s += t.toString();

        return s;
    }

    public void registerFunction(){
        for (Sentence sentence:text){

            SentenceMember[] sentenceMembers = sentence.getSentenceMembers();
            for (SentenceMember sm:sentenceMembers){

                Word word = sm.getWord();
                String s = new String(getCharArr(word.getLetters()));
                sm.setWord(new Word(Lab3.RegisterFunction(s).trim().toCharArray()));
            }
        }
    }

    public void noRegisterFunction(){
        for (Sentence sentence:text){

            SentenceMember[] sentenceMembers = sentence.getSentenceMembers();
            for (SentenceMember sm:sentenceMembers){

                Word word = sm.getWord();
                String s = new String(getCharArr(word.getLetters()));
                sm.setWord(new Word(Lab3.noRegisterFunction(s).trim().toCharArray()));
            }
        }
    }

    private static char[] getCharArr(Letter[] letters){
        char[] chars = new char[letters.length];

        for (int i = 0; i < letters.length; i++)
            chars[i] = letters[i].getLetter();

        return chars;
    }

    private Sentence[] text;
}
