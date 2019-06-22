
import java.io.IOException;

public class Lab3
{
    public static void main(String[] args) throws IOException
    {
        int c3 = 6305 % 3; // String
        int c17 = 6305 % 17; // В кожному слові заданого тексту, видалити всі наступні входження першої літери цього слова
        Lab3Frame frame = new Lab3Frame("Лабораторна робота 3");
        frame.setVisible(true);
    }
    /*з урахуванням регістру*/
    public static String RegisterFunction(String row)
    {
        String[] words = row.trim().split(" ");
        String result = new String();
        for (String word:words)
        {
            String firstLetter = word.substring(0, 1);
            String[] s = word.substring(1).split(firstLetter);
            result += firstLetter;
            for (String letters:s)
            {
                result += letters;
            }
            result += " ";
        }
        return result;
    }

    /*без урахування регістру*/
    public static String noRegisterFunction(String row)
    {
        String[] words = row.trim().split(" ");
        String result = new String();
        for (String word:words)
        {
            char[] letters = word.toCharArray();
            char firstLetter = letters[0];
            if (Character.isUpperCase(firstLetter))
                for (int i = 1; i < letters.length; i++)
                {
                    letters[i] = (letters[i] == firstLetter || Character.toUpperCase(letters[i]) == firstLetter) ? Character.toUpperCase(letters[i]) : letters[i];
                }
            else
                for (int i = 1; i < letters.length;i++)
                {
                    letters[i] = (letters[i] == firstLetter || Character.toLowerCase(letters[i]) == firstLetter) ? Character.toLowerCase(letters[i]) : letters[i];
                }
            word = new String(letters);
            result += RegisterFunction(word);
        }
        return result;
    }
}
