package main;

import javax.swing.JDialog;
import app.controller.Controller;
import app.view.Authorisation;
import app.view.Fonts;
import app.view.MyWindowsListener;
/**
 * �������� ����. ��� ���������� ������ ��������. ��������� ����������
 * @author Vova
 *
 */
public class MainClass {
/**
 * �������� �����
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
