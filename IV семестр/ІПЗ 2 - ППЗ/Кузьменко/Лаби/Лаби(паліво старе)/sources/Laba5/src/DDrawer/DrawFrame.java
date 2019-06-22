package DDrawer;

import javax.swing.JFrame;
import javax.swing.JScrollPane;

/**
 * ����� ������ ��� ������������ ���������.
 * @author ������ �����, ����� ��-73
 */
public class DrawFrame extends JFrame {

	private static final long serialVersionUID = 1L;
	/**
	 * ������ ��� ��������� ���������.
	 */
	private DiagramPanel panel;
	
	/**
	 * ����������� ������ ��� ������������� ���������.
	 * @param table ������� ������
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

