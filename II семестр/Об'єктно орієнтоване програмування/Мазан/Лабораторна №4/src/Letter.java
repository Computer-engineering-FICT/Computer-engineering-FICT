public class Letter {
    private char Symbol;
    public Letter (String letter) {
        Symbol = letter.charAt(0);
    }
    public Letter (char letter) {
        Symbol = letter;
    }
    public String str() {
        return "" + Symbol;
    }
}