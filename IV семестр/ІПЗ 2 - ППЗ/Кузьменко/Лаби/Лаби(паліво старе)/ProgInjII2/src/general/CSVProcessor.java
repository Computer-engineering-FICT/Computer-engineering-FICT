package general;

import java.io.File;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.util.ArrayList;

/**
 * @author Sydora Sergiy, IO-73
 */
public class CSVProcessor {
    /**
     * Масив строкових даних.
     */
    private ArrayList < String > mas;

    /**
     * @param f
     * Файл, з котрого зчитуються дані
     * @return mas масив з прочитаними даними
     * @throws IOException
     * Помилка при роботі із файлом
     */
    public ArrayList < String > parse(final File f) throws IOException {
        mas = new ArrayList < String >();
        BufferedReader in = new BufferedReader(new FileReader(f));
        String str, temp;
        while ((str = in.readLine()) != null) {           
            for (int i = 0; i < str.length(); i+=2 ) {
                temp = "";
              int j = (str.indexOf(",") > 0) ? str.indexOf(",") : str.length();
                for (; i < j; i++) {
                    temp = temp + str.charAt(i);
                    str = str.replaceFirst(Character.toString(str.charAt(i)),
                                                                         " ");
                }
                str = str.replaceFirst(",", " ");
                mas.add(temp);
            }
            mas.add("/n");
        }
        return mas;
    }

    /**
     * @param file
     * Шлях до файлу, в котрий виконується запис
     */
    public void writemas(final File file) {
        try {
            PrintWriter out = new PrintWriter(new BufferedWriter(
                    new FileWriter(file)));
            for (int i = 0; i < mas.size(); i++) {
                if (mas.get(i).equals("/n")) {
                    out.println();
                } else {
                    String s = (mas.get(i + 1).equals("/n")) ? "" : ", ";
                    out.print(mas.get(i) + s);
                }
            }
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * @param file
     * Файл, куди буде виконана серіалізація
     */
    public void serialize(final File file) {
        try {
            ObjectOutputStream out = new ObjectOutputStream(
                    new FileOutputStream(file));
            out.writeObject(mas);
            out.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * @param file
     * Файл, із котрого ми будемо десеріалізувати масив
     */
    public void deserialize(final File file) throws IOException {
        try {
            ObjectInputStream in = new ObjectInputStream(new FileInputStream(
                    file));
            try {
                mas = (ArrayList < String >) in.readObject();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * @return Повертає масив, з котрим працює процесор
     */
    public ArrayList < String > getmas() {
        return mas;
    }
}
