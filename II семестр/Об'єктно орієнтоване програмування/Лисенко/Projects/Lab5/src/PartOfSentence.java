public class PartOfSentence {
    private Boolean part; // true - Word, false - Punctuation
    private Letter[] letters;
    private char punctuation;


    public PartOfSentence(String part, String a) {
        if (part.toLowerCase().equals("word")) {
            this.part = true;
            this.setWord(a);
        } else if (part.toLowerCase().equals("punctuation")) {
            this.part = false;
            this.setPunctuation(a);
        }
    }
    public void setWord(String a){
        if (part){
            this.letters = new Letter[a.length()];
            for (int i = 0; i < a.length(); i++) {
                this.letters[i] = new Letter(a.charAt(i));
            }
        }
    }

    public String getWord(){
        String a = "";
        if (part) {
            for (Letter i : this.letters) {
                a += i.getLetter();
            }
        }
        return a;
    }

    public void setLetters(Letter[] a){
        this.letters = a.clone();
    }

    public Letter[] getLetters (){
        return this.letters.clone();
    }

    public void setPunctuation(String a){
        if (!this.part && a.length()==1) {
            this.punctuation = a.charAt(0);
        }
    }

    public char getPunctuation(){
        if (!this.part) {
            return this.punctuation;
        }
        return ' ';
    }

    public String getNameOfPart() {
        if (part) {
            return "Word";
        } else {
            return "Punctuation";
        }
    }
}
