import java.util.Arrays;

public class SentenceMember
{
    public SentenceMember(String sentenceMember)
    {
        char[] chars = sentenceMember.toCharArray();
        symbol = (!Letter.isLetter(chars[chars.length - 1])) ? new Symbol(chars[chars.length - 1]) : null;
        word = (symbol == null) ? new Word(Arrays.copyOfRange(chars, 0, chars.length)) : new Word(Arrays.copyOfRange(chars, 0, chars.length - 1));
    }


    public String toString() {
        String s = word.toString();
        if (symbol != null) s+=symbol.toString();
        s += " ";
        return s;
    }

    public Word getWord() {
        return word;
    }

    public Symbol getSymbol() {
        return symbol;
    }

    public void setWord(Word word) {
        this.word = word;
    }

    public void setSymbol(Symbol symbol) {
        this.symbol = symbol;
    }

    private Word word;
    private Symbol symbol;
}
