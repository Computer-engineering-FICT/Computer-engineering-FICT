package Panels;

import javax.swing.JScrollPane;

public class scrollPane_Center extends JScrollPane {
	private static final long serialVersionUID = 1L;
	public static Panel_Center Panel_Draw;

	public scrollPane_Center() {
		Panel_Draw = new Panel_Center();
		this.setViewportView(Panel_Draw);
		this.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		this.getVerticalScrollBar().setUnitIncrement(16);
		this.setPreferredSize(getPreferredSize());
		this.setFocusable(true);
	}

}
