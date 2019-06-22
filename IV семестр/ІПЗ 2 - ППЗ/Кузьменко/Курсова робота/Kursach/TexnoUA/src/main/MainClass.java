package main;

import javax.swing.JDialog;
import app.controller.Controller;
import app.view.Authorisation;
import app.view.Fonts;
import app.view.MyWindowsListener;
/**
 * головний клас. тут відбувається запуск програми. Стоврення контролера
 * @author Vova
 *
 */
public class MainClass {
/**
 * головний метод
 */
	@SuppressWarnings("unused")
	public static void main(String[] args) {
		new Fonts();
		Controller controller = new Controller();
		Authorisation dialog = new Authorisation();
		dialog.setDefaultCloseOperation(JDialog.DO_NOTHING_ON_CLOSE);
		dialog.addWindowListener(new MyWindowsListener());
		dialog.setVisible(true);
		

	}

}
