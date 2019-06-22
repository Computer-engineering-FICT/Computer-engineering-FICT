
import java.util.regex.Pattern;

public class Letter
{

    public Letter(char letter)
    {
        this.letter = letter;
    }

    public String toString() {
        return letter + "";
    }

    public static boolean isLetter(char letter){
        return Pattern.compile("[A-Za-zА-ЯіІЇїЄє]").matcher(letter + "").find();
    }

    public char getLetter() {
        return letter;
    }

    public void setLetter(char letter) {
        this.letter = letter;
    }

    private char letter;
}
