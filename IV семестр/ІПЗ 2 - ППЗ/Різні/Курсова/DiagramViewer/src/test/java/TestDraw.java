import java.io.IOException;

import com.csv.CSVParseThread;
import com.csv.CSVProcessor;
import com.gui.DiagramDrawer;
import com.gui.SectorDiagramDrawer;
import com.main.AppSettings;

/**
 * Тестовий клас відображення діаграми.
 * @author Куцовол Віктор
 *
 */
public final class TestDraw {

 /**
  * Конструктор.
 */
 private TestDraw() {
  super();
 }

 /**
 * Виконується при запуску програми.
 * @param args параметри з командного рядка
 */
 public static void main(final String[] args) {
  String del = (String) AppSettings.getInstance().get("delimiter");
  CSVProcessor processor = new CSVProcessor(del);
  try {
   processor.load("mycsv.csv");
  } catch (IOException ex) {
   System.out.println("Помилка завантаження файлу.");
  }
  CSVParseThread pth = new CSVParseThread(processor);
  try {
   pth.getThread().join();
  } catch (InterruptedException e) {
   System.out.println("Переривання.");
  }
  final int height = 600;
  final int width = 600;
  TestFrame frame = new TestFrame("Test Draw");
  frame.setSize(height, width);
  try {
   DiagramDrawer ringDiagramDrawer = new SectorDiagramDrawer(pth.getTable());
   frame.setDiagramDrawer(ringDiagramDrawer);
  } catch (ArrayIndexOutOfBoundsException e) {
   System.out.println("Порожній CSV файл");
  }
  frame.setVisible(true);
 }

}
