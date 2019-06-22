/**
 * Created by Max-Burbil on 01.03.2017.
 */
import java.util.Scanner;
public class Lab3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Введите длину слова: ");
        int len = sc.nextInt();
        String basictext = "text";
        String text = "В заданому, тексті замінити слова заданої довжини визначеним рядком";
        System.out.print(text+"\n");

        String text1[] = Splitfunc(text);
        for (int i = 0; i < text1.length; i++) {
            if (text1[i].length() == len) {
                text1[i] = basictext;
            }
        }

        for (int i = 0; i < text1.length; i++){
            System.out.print(text1[i] + " ");
        }

    }

    private static String[] Splitfunc(String s){
        String pattern = "\\s+|,\\s*";
        return s.split(pattern);
    }
}