

public class Word
{
    public Word(char[] word)
    {
        Letter[] letters = new Letter[word.length];

        for (int i = 0; i < word.length; i++)
            letters[i] = new Letter(word[i]);

        this.letters = letters;
    }


    public String toString() {
        String s = new String();

        for (Letter l:letters)
            s += l.toString();

        return s;
    }

    public Letter[] getLetters() {
        return letters;
    }

    public void setLetters(Letter[] letters) {
        this.letters = letters;
    }

    private Letter[] letters;
}
