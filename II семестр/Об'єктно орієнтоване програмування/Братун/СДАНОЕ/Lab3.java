

public class Lab3 {
    public static void main(String[] args)  {
        int c3 = 6305 % 3; // String
        int c17 = 6305 % 17; // В заданому тексті замінити слова заданої довжини визначеним рядком.
        Lab3Frame frame = new Lab3Frame("Лабораторна робота 3");
        frame.setVisible(true);
    }

    public static String changeWords(String row1, String row2, String row3) {
        String[] words = row1.trim().split(" ");
        String result = new String();
        int value = new Integer(row2.trim());
        for (int i = 0; i < words.length; i++) {
            if (words[i].length() == value) {
                words[i] = row3.trim();
            }
        }
        for (int j =0; j < words.length; j++) {
            result += words[j] + " ";
        }
        return result;
    }
}

