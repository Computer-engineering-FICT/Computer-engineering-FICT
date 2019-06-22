public class Word extends SentenceMember{
    private Letter[] symbols;
    public Word(String w) {
        char[] word_chars = w.toCharArray();
        symbols = new Letter[word_chars.length];
        for (int i =0; i<word_chars.length;i++) {
            symbols[i] = new Letter(word_chars[i]);
        }
    }

    @Override
    public int length() {
        return symbols.length;
    }

    @Override
    public String str() {
        String result = "";
        for (int i = 0; i < symbols.length; i++) {
            result += symbols[i].str();
        }
        return result;
    }

}