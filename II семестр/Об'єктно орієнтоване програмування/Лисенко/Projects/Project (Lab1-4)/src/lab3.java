/*
C3  = 6116 % 3  = 2  => String
C17 = 6116 % 17 = 13 => В заданому тексті знайти підрядок максимальної довжини, що є паліндромом,
                        тобто читається однаково зліва на право та з права на ліво.
 */
import java.util.ArrayList;
import java.util.Scanner;

public class lab3 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter text:");
        String str = scan.nextLine();
        int len = str.length();
        Boolean bool = false;
        ArrayList<String> arr = new ArrayList<>();

        for (int i = 0; i < len-1; i++) {
            for (int j = 0; j <= i; j++) {
                String s = str.substring(j, len-i+j);
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

        int n = arr.size();
        switch (n){
            case 0: System.out.println("No palindromes");
                    break;
            case 1: String p = arr.get(0);
                    System.out.println("Maximum length of palindrome: " + p.length() + "\nPalindrome: " + p);
                    break;
            default:System.out.println("Maximum length of palindrome: " + arr.get(0).length() +
                    "\nNumber of palindromes: " + n + "\nPalindromes: ");
                    for(String i: arr) {
                        System.out.println(i);
                    }
        }
    }
}
