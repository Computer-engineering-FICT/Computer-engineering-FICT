package DDrawer;

import javax.swing.JFrame;
import javax.swing.JScrollPane;

/**
 * Класс фрейма для предствления диаграммы.
 * @author Сидора Сергій, група ІО-73
 */
public class DrawFrame extends JFrame {

	private static final long serialVersionUID = 1L;
	/**
	 * Панель для рисования диаграммы.
	 */
	private DiagramPanel panel;
	
	/**
	 * Конструктор фрейма для представления диаграммы.
	 * @param table Таблица данных
	 */
	public DrawFrame(String[][] table) {
		super();
		panel = new DiagramPanel(new DiagramDrawer(table));
		panel.setPreferredSize(panel.getPreferredSize());
		JScrollPane pane = new JScrollPane(panel, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED, JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		pane.setWheelScrollingEnabled(true);
		pane.setPreferredSize(panel.getPreferredSize());
		getContentPane().add(pane);
	}
	
}

