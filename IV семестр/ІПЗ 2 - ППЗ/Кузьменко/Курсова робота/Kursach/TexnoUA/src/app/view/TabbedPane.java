package app.view;

import java.awt.Component;
import java.awt.GridLayout;

import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;


@SuppressWarnings("serial")
/**
 * Клас що реалізовує інтерфейс користувача для вкладок головного вікна програми
 *
 */
public class TabbedPane extends JPanel {
	/**
	 * панель вкладок
	 */
	public static JTabbedPane tabbedPane = new JTabbedPane();

	/**
	 * створення нової панелі
	 */

	public TabbedPane() {
		super(new GridLayout(1, 1));
		add(tabbedPane);
		setFont(Fonts.getFont());
		tabbedPane.setTabLayoutPolicy(JTabbedPane.SCROLL_TAB_LAYOUT);
		
	}
/**
 * метод, що додає до панелі нову вкладу
 * @param panel нова вкладка
 * @param name ім’я вкладки
 */
	public static void addTabPanel(JPanel panel, String name) {
		tabbedPane.addTab(name, panel);
		tabbedPane.setVisible(true);
		tabbedPane.updateUI();
		for (Component component : tabbedPane.getComponents()) {
			component.setFont(Fonts.getFont());
		}
	}
	/**
	 * метод, що встановлює новий стиль 
	 * @param className назва стилю
	 */
	public static void setStyle(String className){
		try {
			tabbedPane.updateUI();
			UIManager.setLookAndFeel(className);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (UnsupportedLookAndFeelException e) {
			e.printStackTrace();
		}
	}

}
