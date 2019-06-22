import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

import com.csv.CSVParseThread;
import com.csv.CSVProcessor;
import com.main.AppSettings;


 /**
 * Тестовий клас вводу/виводу.
 * @author Куцовол Віктор
 */
public final class TestIO {

 /**
 * Конструктор.
 */
 private TestIO() {
  super();
 }

 /**
 * Виконується при запуску програми.
 * @param args параметри з командного рядка
 * @throws IOException виникає внаслідок помилки вводу/виводу
 */
 public static void main(final String[] args) throws IOException {
  final int num = 3;
  String del = (String) AppSettings.getInstance().get("delimiter");
  CSVProcessor processor = new CSVProcessor(del);
  Scanner in = new Scanner(System.in);
  File f = new File("serialized.dat");
  if (f.exists()) {
   try {
    processor.deserialize();
   } catch (Exception e) {
    System.out.println("Помилка десеріалізації");
   }
  } else {
   int flag = 0;
   while (flag != -1 && flag < num) {
    try {
     String fileName = in.nextLine();
     processor.load(fileName);
     flag = -1;
    } catch (IOException e) {
     flag++;
     if (flag == num) {
      throw e;
     }
    }
   }
   try {
    processor.serialize();
   } catch (Exception e) {
    System.out.println("Помилка серіалізації");
   }
  }
  ArrayList<String> strings = processor.getCsvStrings();
  Iterator<String> iterator = strings.iterator();
  while (iterator.hasNext()) {
   System.out.println(iterator.next());
  }

  CSVParseThread pth = new CSVParseThread(processor);
  try {
   pth.getThread().join();
  } catch (InterruptedException e) {
   System.out.println("Переривання потоку.");
  }
  Object[][] table = pth.getTable();
  for (int i = 0; i < table.length; i++) {
   for (int j = 0; j < table[i].length; j++) {
    System.out.print(table[i][j] + " ");
   }
   System.out.println();
  }
 }

}
