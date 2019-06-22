package DDrawer;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.geom.Rectangle2D;

/**
 * ����� ��� ��������� ��������.
 * @author ������ �., ����� ��-73
 */
public class OldDiagramDrawer {

	/**
	 * ������� ������.
	 */
	private String[][] table;
	/**
	 * ������ ��� ��������� ��������.
	 */
	private DiagramPanel panel;
	/**
	 * ����� ��� ����������� ������������� ������� ��������.
	 */
	private Color[] colors;
	/**
	 * ������������� ������� ��� ��������� ������� ���������.
	 */
	private Rectangle legend;
	/**
	 * ������������� ������� ��� ��������� ���������.
	 */
	private Rectangle diagram;
	/**
	 * ����� ������� ���������.
	 */
	private Font font;
	/**
	 * ����� �� ��������� ��� ��������� ������� ���������.
	 */
	
	private final Font DEFAULT_FONT = new Font("Courier", Font.BOLD, 12);
	
	/**
	 * ����������� �� ��������� ������ ��� ��������� ��������.
	 */
	public OldDiagramDrawer() {
		table = null;
		panel = null;
		colors = null;
		font = DEFAULT_FONT;
	}
	
	/**
	 * ����������� ������ ��� ��������� ��������.
	 * @param table ������� ������
	 */
	public OldDiagramDrawer(String[][] table) {
		this.table = table;
		panel = null;
		colors = new Color[table.length];
		generateColors();
		font = DEFAULT_FONT;
	}
	
	/**
	 * ����������� ������ ��� ��������� ��������.
	 * @param table ������� ������
	 * @param panel ������ ��� ��������� ���������
	 */
	public OldDiagramDrawer(String[][] table, DiagramPanel panel) {
		this.table = table;
		this.panel = panel;
		colors = new Color[table.length];
		generateColors();
		font = DEFAULT_FONT;
	}
	
	/**
	 * ����������� ������ ��� ��������� ��������.
	 * @param table ������� ������
	 * @param font ����� ��� ��������� ������� ���������
	 */
	public OldDiagramDrawer(String[][] table, Font font) {
		this.table = table;
		panel = null;
		colors = new Color[table.length];
		generateColors();
		this.font = font;
	}
	
	/**
	 * ����������� ������ ��� ��������� ��������.
	 * @param table ������� ������
	 * @param panel ������ ��� ��������� ���������
	 * @param font ����� ��� ��������� ������� ���������
	 */
	public OldDiagramDrawer(String[][] table, DiagramPanel panel, Font font) {
		this.table = table;
		this.panel = panel;
		colors = new Color[table.length];
		generateColors();
		this.font = font;
	}
	
	/**
	 * ���������� ����� ��� ������� �������� ������� ������.
	 */
	private void generateColors() {
		int r, g, b;
		r = 0;
		g = 255;
		b = 0;
		int step = 255 / table.length;
		colors[0] = new Color(r, g, b);
		for (int i = 1; i < table.length; i++) {
			r += step/3;
			g -= step;
			b += step;
			colors[i] = new Color(r, g, b);
		}
	}
	
	/**
	 * ��������� ������������� ������� ��� ��������� ���������.
	 */
	private void getDiagramSize() {
		int x = (int)(panel.getWidth()/10);
		int y = (int)(panel.getHeight()/10);
		int side;
		if (x >= y) {
			side = 8*y;
		}
		else {
			side = 6*x;
		}
		diagram = new Rectangle(x, y, side, side);
	}

	/**
	 * ������������� ������� ������.
	 * @param table ������� ������
	 */
	public void setTable(String[][] table) {
		this.table = table;
		colors = new Color[table.length];
		generateColors();
	}
	
	/**
	 * ���������� ������� ������.
	 * @return ������� ������
	 */
	public String[][] getTable() {
		return table;
	}

	/**
	 * ������������� ������ ��� ��������� ���������.
	 * @param panel ������ ��� ��������� ���������
	 */
	public void setPanel(DiagramPanel panel) {
		this.panel = panel;
	}

	/**
	 * ���������� ������ ��� ��������� ���������.
	 * @return ������ ��� ��������� ���������
	 */
	public DiagramPanel getPanel() {
		return panel;
	}

	/**
	 * ������������� ����� ��� ��������� ������� ���������.
	 * @param font ����� ��� ��������� ������� ���������
	 */
	public void setFont(Font font) {
		this.font = font;
	}	
	/**
	 * ���������� ����� ��� ��������� ������� ���������.
	 * @return ����� ��� ��������� ������� ���������
	 */
	public Font getFont() {
		return font;
	}
	
	/**
	 * ������ ���������.
	 * @param g ����������� ��������
	 */
	public void draw(Graphics g) {
		
		legend = new Rectangle(new Dimension(0, 0));
		g.setFont(font);
		FontMetrics fontMetrics = g.getFontMetrics();
		int space = (int)fontMetrics.getStringBounds(table[0][0], g).getHeight();
		for (int i = 0; i < table.length; i++) {
			Rectangle2D bounds = fontMetrics.getStringBounds(table[i][0], g);
			int width;
			if (bounds.getWidth() > legend.getWidth()) {
				width = (int)bounds.getWidth();
			}
			else {
				width = (int)legend.getWidth();
			}
			legend.setSize((int)(width+2*bounds.getHeight()), (int)(legend.getHeight()+2*bounds.getHeight()));
		}
		if (legend.getWidth() > (panel.getWidth()/10)) {
			panel.setSize((int)(panel.getWidth()+(legend.getWidth()-(panel.getWidth()/10))), (int)panel.getHeight());
			panel.setPreferredSize(panel.getSize());
			panel.revalidate();
		}
		if (legend.getHeight() > panel.getHeight()) {
			panel.setSize((int)panel.getWidth(), (int)(panel.getHeight()+(legend.getHeight()-panel.getHeight())));
			panel.setPreferredSize(panel.getSize());
			panel.revalidate();
		}
		legend.setLocation((int)(panel.getWidth()*0.5), (int)((panel.getHeight()-legend.getHeight())/2));
		
		g.setFont(font);
		int y = (int)legend.getY();
		for (int i = 0; i < table.length; i++) {
			int x = (int)legend.getX();
			g.setColor(colors[i]);
			//g.drawLine(arg0, arg1, arg2, arg3)
			g.fillRect(x, y, space, space);
			x += 2*space;
			y += 0.75*space;
			g.setColor(Color.BLACK);
			g.drawString(table[i][0], x, y);
			y += space;
		}
		
		double sum = 0;
		for (int i = 0; i < table.length; i++) {
			sum += Double.valueOf(table[i][1]);
		}
		getDiagramSize();
		int startAngle = 0;
		int arcAngle = 0;
		for (int i = 0; i < table.length; i++) {
			startAngle += arcAngle;
			arcAngle = (int)((Double.valueOf(table[i][1])/sum) * legend.getWidth()/table.length);
			g.setColor(colors[i]);			
			g.fillArc((int)diagram.getX(), (int)diagram.getY(), (int)diagram.getWidth(), (int)diagram.getHeight(), startAngle, arcAngle);
		}
	}
	
}
