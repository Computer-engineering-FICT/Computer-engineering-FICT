package app.view;

import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import javax.swing.JOptionPane;

/**
 * Клас що обробляє події вікон
 * @author Vova
 *
 */
public class MyWindowsListener implements WindowListener {
	/**
	 * @param e
	 */
	@Override
	public void windowActivated(WindowEvent e) {
		// TODO Auto-generated method stub

	}
/**
 * @param e
 */
	@Override
	public void windowClosed(WindowEvent e) {
		// TODO Auto-generated method stub

	}
	/**
	 * метод що оброробляэ подію закриття вікна.
	 * при закритті вікна викликатиметься діалог що попереджає 
	 * про завершення роблоти програми
	 */
	@Override
	public void windowClosing(WindowEvent e) {
		Object[] objects = new Object[2];
		objects[0] = new String(Languages.getProperty("yesBtn"));
		objects[1] = new String(Languages.getProperty("noBtn"));
		int result = JOptionPane.showOptionDialog(e.getWindow(),
				Languages.getProperty("autorisLabel1"), Languages.getProperty("info"),
				JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null,
				objects, null);
		if (result == JOptionPane.YES_OPTION) {
			e.getWindow().dispose();
			System.exit(0);
		}
	}
/**
 * @param e подія вікна 
 */
	@Override
	public void windowDeactivated(WindowEvent e) {
		// TODO Auto-generated method stub

	}
/**
 * @param e подія вікна
 */
	@Override
	public void windowDeiconified(WindowEvent e) {
		// TODO Auto-generated method stub

	}
/**
 * @param e подія вікна
 */
	@Override
	public void windowIconified(WindowEvent e) {
		// TODO Auto-generated method stub

	}
/**
 * @param e подія вікна
 */
	@Override
	public void windowOpened(WindowEvent e) {
		// TODO Auto-generated method stub

	}
}
