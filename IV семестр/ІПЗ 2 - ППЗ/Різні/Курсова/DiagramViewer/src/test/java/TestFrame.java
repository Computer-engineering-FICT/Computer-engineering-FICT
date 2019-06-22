import java.awt.Frame;
import java.awt.Graphics;

import com.gui.DiagramDrawer;


 /**
 * Тестовий клас вікна.
 * @author Куцовол Віктор
 *
 */

@SuppressWarnings("serial")
public class TestFrame extends Frame {

/**
 * Поле стратегії відображувача діаграм.
 */
 private DiagramDrawer diagramDrawer;

 /**
 * Встановлює стратегію відображувача діаграм.
 * @param strategy стратегія відображувача діаграм
 */
 public final void setDiagramDrawer(final DiagramDrawer strategy) {
  diagramDrawer = strategy;
 }

 /**
  * Виконується при відображенні.
  * @param g графічний контекст
  */
 public final void paint(final Graphics g) {
  super.paint(g);
  if (diagramDrawer != null) {
   diagramDrawer.draw(g);
  }
 }

 /**
 * Конструктор.
 * @param title заголовок вікна
 */
 public TestFrame(final String title) {
  super(title);
  TestWindowAdapter adapter = new TestWindowAdapter(this);
  addWindowListener(adapter);
 }

}
