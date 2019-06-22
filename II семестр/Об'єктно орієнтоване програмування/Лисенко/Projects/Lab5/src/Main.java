/*
C17 = 6116 % 17 = 13 => В заданому тексті знайти підрядок максимальної довжини, що є паліндромом,
                        тобто читається однаково зліва на право та з права на ліво.
 */
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter text:");
        Text str = new Text(scan.nextLine());
        Sentence[] sentences = str.getSentences();
        int nSentences = sentences.length;
        Boolean bool = false;
        ArrayList<Letter> arr = new ArrayList<>();

        for (int i = 0; i < nSentences; i++) {
            int nPartsOfSentence = sentences.length;
            for (int j = 0; j < nPartsOfSentence; j++) {
                if (sentences[i].getPartsOfSentence()[j].getNameOfPart().equals("Word")) {
                    int nLetters = sentences[i].getPartsOfSentence()[j].getLetters().length;
                    for (int k = 0; k < nLetters; k++) {

                    }
                } else {

                }
            }
        }

        /*for (int i = 0; i < nSentences-1; i++) {
                int nPartsOfSentence = sentences.length;
                for (int j = 0; j <= i; j++) {
                    String s = str.getTxt().substring(j, len-i+j);
                    String turn_s = "";
                    for (int q = len-i-1; q >= 0; q--) {
                        turn_s += s.substring(q,q+1);
                    }
                    if (s.equals(turn_s)) {
                        bool = true;
                        arr.add(s);
                    }
                }
                if (bool) {
                    break;
                }
            }
*/

        int n = arr.size();
        switch (n){
            case 0: System.out.println("No palindromes");
                break;
            case 1: String p = arr.get(0);
                System.out.println("Maximum length of palindrome: " + p.length() + "\nPalindrome: " + p);
                break;
            default:System.out.println("Maximum length of palindrome: " + arr.get(0).length() +
                    "\nNumber of maximal palindromes: " + n + "\nPalindromes: ");
                for(String i: arr) {
                    System.out.println(i);
                }
        }
    }
}
