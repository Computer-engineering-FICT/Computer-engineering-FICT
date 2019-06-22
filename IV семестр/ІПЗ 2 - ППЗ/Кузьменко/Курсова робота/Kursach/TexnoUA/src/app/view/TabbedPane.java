package app.view;

import java.awt.Component;
import java.awt.GridLayout;

import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;


@SuppressWarnings("serial")
/**
 * ���� �� �������� ��������� ����������� ��� ������� ��������� ���� ��������
 *
 */
public class TabbedPane extends JPanel {
	/**
	 * ������ �������
	 */
	public static JTabbedPane tabbedPane = new JTabbedPane();

	/**
	 * ��������� ���� �����
	 */

	public TabbedPane() {
		super(new GridLayout(1, 1));
		add(tabbedPane);
		setFont(Fonts.getFont());
		tabbedPane.setTabLayoutPolicy(JTabbedPane.SCROLL_TAB_LAYOUT);
		
	}
/**
 * �����, �� ���� �� ����� ���� ������
 * @param panel ���� �������
 * @param name ��� �������
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
	 * �����, �� ���������� ����� ����� 
	 * @param className ����� �����
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
