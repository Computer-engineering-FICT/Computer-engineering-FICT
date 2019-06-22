import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;


/**
 * Клас адаптера вікна.
 * @author Куцовол Віктор
 *
 */
public class TestWindowAdapter extends WindowAdapter {

 /**
 * Об'єкт класу TestFrame.
 */
 private TestFrame testFrame;

 /**
 * Конструктор.
 * @param frame об'єкт вікна
 */
 public TestWindowAdapter(final TestFrame frame) {
  testFrame = frame;
 }

 /**
 * Виконується при закриванні вікна.
 * @param we віконна подія
 */
 public final void windowClosing(final WindowEvent we) {
  testFrame.setVisible(false);
  System.exit(0);
 }

}
