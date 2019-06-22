import java.util.ArrayList;
import java.util.List;

public class Lab3 {
    public static void main(String[] args) {
        StringBuilder s = new StringBuilder("Hello, world.  This is the the program. This is is my program."); //Введення рядка
        int len = 3; // Задаємо довжину шуканих слів
        String text = s.toString().trim();

        if (text.length() == 0) // Виключна ситуація на введення пустого рядка
        {
            System.out.println("the text is empty");
            return;
        }

        if (!text.contains("?")) System.out.println("there are no '?' in string"); // Якщо немає питальних речень

        else { // Замінюємо всі непотрібні розділові знаки на проіли
            text = text.replaceAll(",", " ");
            text = text.replaceAll("!", " ");
            text = text.replaceAll(" - ", " ");
            text = text.replaceAll(";", " ");
            text = text.replaceAll(":", " ");
            text = text.replaceAll(" -", " ");
            text = text.replaceAll("- ", " ");

            List<String> list = new ArrayList<>(); // Список, в який будуть додаватись шукані слова
            String sentence = new String();
            for (String x : text.split("\\.")) { // Шукаємо питальні речення
                if (x.contains("?")) {
                    System.out.println(x.trim());
                    sentence = x.replaceAll("\\?", " ").trim();
                    for (String i : sentence.split("\\ ")) { //Розділяємо речення на слова і шукаємо слова з довжиною len
                        if (i.length() == len && !list.contains(i)) list.add(i);
                    }
                }
            }
            System.out.println(list);
        }
    }
}