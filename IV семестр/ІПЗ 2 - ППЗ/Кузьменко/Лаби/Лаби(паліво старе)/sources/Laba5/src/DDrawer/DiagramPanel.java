package DDrawer;

import java.awt.Graphics;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JPanel;

/**
 * Класс панели для рисования.
 * @author Сидора Сергій, група ІО-73
 */
public class DiagramPanel extends JPanel {

	private static final long serialVersionUID = 1L;
	/**
	 * Класс для рисования диаграммы.
	 */
	private DiagramDrawer drawer;
	
	/**
	 * Конструктор панели для рисования диаграммы.
	 */
	public DiagramPanel() {
		super();
		drawer = null;
		System.out.println("Test001!");
		addMouseListener(new MouseEvents());
	}
	
	/**
	 * Конструктор панели для рисования диаграммы.
	 * @param drawer Класс для рисования диаграммы
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
	 * Возвращает класс для рисования диаграммы.
	 * @return Класс для рисования диаграммы
	 */
	public DiagramDrawer getDrawer() {
		return drawer;
	}

	/**
	 * Устанавливает класс для рисования диаграммы.
	 * @param drawer Класс для рисования диаграммы
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
