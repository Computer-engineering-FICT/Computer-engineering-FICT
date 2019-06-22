package DDrawer;

import java.awt.Graphics;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JPanel;

/**
 * ����� ������ ��� ���������.
 * @author ������ �����, ����� ��-73
 */
public class DiagramPanel extends JPanel {

	private static final long serialVersionUID = 1L;
	/**
	 * ����� ��� ��������� ���������.
	 */
	private DiagramDrawer drawer;
	
	/**
	 * ����������� ������ ��� ��������� ���������.
	 */
	public DiagramPanel() {
		super();
		drawer = null;
		System.out.println("Test001!");
		addMouseListener(new MouseEvents());
	}
	
	/**
	 * ����������� ������ ��� ��������� ���������.
	 * @param drawer ����� ��� ��������� ���������
	 */
	public DiagramPanel(DiagramDrawer drawer) {
		super();
		this.drawer = drawer;
		System.out.println("Test002!");
		addMouseListener(new MouseEvents());
	}

	public class MouseEvents extends MouseAdapter {
		public void mousePressed(MouseEvent event){
			System.out.println("Test000000000!");
			DiagramDrawer.change(event.getPoint());
			repaint();
		}
		/*public void MouseClick(MouseEvent event){
			System.out.println("Test!");
		}*/		
	}
	
	/**
	 * ���������� ����� ��� ��������� ���������.
	 * @return ����� ��� ��������� ���������
	 */
	public DiagramDrawer getDrawer() {
		return drawer;
	}

	/**
	 * ������������� ����� ��� ��������� ���������.
	 * @param drawer ����� ��� ��������� ���������
	 */
	public void setDrawer(DiagramDrawer drawer) {
		this.drawer = drawer;
	}
	
	/* (non-Javadoc)
	 * @see javax.swing.JComponent#paintComponent(java.awt.Graphics)
	 */
	public void paintComponent(Graphics g) {
		super.paintComponents(g);
		if (drawer == null) {
			
		}
		else {
			drawer.setPanel(this);
			drawer.draw(g);
		}
	}	

	
}
