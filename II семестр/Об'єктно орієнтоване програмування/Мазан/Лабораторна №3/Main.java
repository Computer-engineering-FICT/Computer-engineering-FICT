import java.util.Arrays;
import java.util.Scanner;
public class Main {

    public static void main(String[] args) {
        String Base_Text = "- В мене до вас питання. Скільки людей переглядають телебачення щодня і щодня?\n - Ну, насправді, це залежить від країни:" +
                "Якщо в нас його переглядає майже виключно старше покоління, то на Заході/в Японії та інших розвинених країнах його переглядає" +
                " значно більша кількість людей.\n - Це тому що в Японії є аніме? - Я не можу відповісти на це запитання, але на Заході телебачення" +
                " однозначно цікавіше за те, яке в Україні.";
        int Word_Length = 0;
        int Start_Symb = 0, i, k = 0;

        //Введення даних
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введіть довжину слів, які треба вивести із питальних речень: ");
        try {
            Word_Length = scanner.nextInt();
        } catch (Exception exception) {
            System.out.println("Виникла помилка: " + exception);
        }
        //Масив із питальних речень
        String[] Words = Base_Text.split(" ");
        String[] Sentences = new String[Words.length];
        String[] Words_To_Print = new String[Words.length];

        for (i = 0; i < Base_Text.length(); i++) {
            if (Base_Text.charAt(i) == '.' || Base_Text.charAt(i) == '!' || Base_Text.charAt(i) == '?') {
                if (Base_Text.charAt(i) == '?') {
                    Sentences[k] = Base_Text.substring(Start_Symb, i + 1);
                    k++;
                }
                Start_Symb = i + 1;
            }
        }
        //Масив зі слів, які потрібно отримати
        for (i = 0; i < Words.length; i++) {
            if (Words[i].replaceAll("\\.|:|;|,|!|\\?", "").length() == Word_Length) {
                for (k = 0; k < Sentences.length; k++) {
                    if (Sentences[k] == null) {
                        continue;
                    }
                    if (Sentences[k].contains(Words[i].replaceAll("\\.|:|;|,|!|\\?", ""))
                            && !Arrays.asList(Words_To_Print).contains(Words[i].replaceAll("\\.|:|;|,|!|\\?", ""))) {
                        Words_To_Print[i] = Words[i].replaceAll("\\.|:|;|,|!|\\?", "");
                    }
                }
            }
        }
        //Виведення слів
        for (i = 0; i < Words.length; i++) {
            if (Words_To_Print[i] != null) {
                System.out.println(Words_To_Print[i]);
            }
        }
    }
}

