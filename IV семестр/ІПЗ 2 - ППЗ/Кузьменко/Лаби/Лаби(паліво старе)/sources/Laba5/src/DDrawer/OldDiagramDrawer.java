package DDrawer;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.geom.Rectangle2D;

/**
 * Класс для рисования диаграмм.
 * @author Сидора С., група ІО-73
 */
public class OldDiagramDrawer {

	/**
	 * Таблица данных.
	 */
	private String[][] table;
	/**
	 * Панель для рисования диаграмм.
	 */
	private DiagramPanel panel;
	/**
	 * Цвета для визуального представления каждого значения.
	 */
	private Color[] colors;
	/**
	 * Прямоугольная область для рисования легенды диаграммы.
	 */
	private Rectangle legend;
	/**
	 * Прямоугольная область для рисования диаграммы.
	 */
	private Rectangle diagram;
	/**
	 * Шрифт легенды диаграммы.
	 */
	private Font font;
	/**
	 * Шрифт по умолчанию для рисования легенды диаграммы.
	 */
	
	private final Font DEFAULT_FONT = new Font("Courier", Font.BOLD, 12);
	
	/**
	 * Конструктор по умолчанию класса для рисования диаграмм.
	 */
	public OldDiagramDrawer() {
		table = null;
		panel = null;
		colors = null;
		font = DEFAULT_FONT;
	}
	
	/**
	 * Конструктор класса для рисования диаграмм.
	 * @param table Таблица данных
	 */
	public OldDiagramDrawer(String[][] table) {
		this.table = table;
		panel = null;
		colors = new Color[table.length];
		generateColors();
		font = DEFAULT_FONT;
	}
	
	/**
	 * Конструктор класса для рисования диаграмм.
	 * @param table Таблица данных
	 * @param panel Панель для рисования диаграммы
	 */
	public OldDiagramDrawer(String[][] table, DiagramPanel panel) {
		this.table = table;
		this.panel = panel;
		colors = new Color[table.length];
		generateColors();
		font = DEFAULT_FONT;
	}
	
	/**
	 * Конструктор класса для рисования диаграмм.
	 * @param table Таблица данных
	 * @param font Шрифт для рисования легенды диаграммы
	 */
	public OldDiagramDrawer(String[][] table, Font font) {
		this.table = table;
		panel = null;
		colors = new Color[table.length];
		generateColors();
		this.font = font;
	}
	
	/**
	 * Конструктор класса для рисования диаграмм.
	 * @param table Таблица данных
	 * @param panel Панель для рисования диаграммы
	 * @param font Шрифт для рисования легенды диаграммы
	 */
	public OldDiagramDrawer(String[][] table, DiagramPanel panel, Font font) {
		this.table = table;
		this.panel = panel;
		colors = new Color[table.length];
		generateColors();
		this.font = font;
	}
	
	/**
	 * Генерирует цвета для каждого значения таблицы данных.
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
	 * Вычисляет прямоугольную область для рисования диаграммы.
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
	 * Устанавливает таблицу данных.
	 * @param table Таблица данных
	 */
	public void setTable(String[][] table) {
		this.table = table;
		colors = new Color[table.length];
		generateColors();
	}
	
	/**
	 * Возвращает таблицу данных.
	 * @return Таблица данных
	 */
	public String[][] getTable() {
		return table;
	}

	/**
	 * Устанавливает панель для рисования диаграммы.
	 * @param panel Панель для рисования диаграммы
	 */
	public void setPanel(DiagramPanel panel) {
		this.panel = panel;
	}

	/**
	 * Возвращает панель для рисования диаграммы.
	 * @return Панель для рисования диаграммы
	 */
	public DiagramPanel getPanel() {
		return panel;
	}

	/**
	 * Устанавливает шрифт для рисования легенды диаграммы.
	 * @param font Шрифт для рисования легенды диаграммы
	 */
	public void setFont(Font font) {
		this.font = font;
	}	
	/**
	 * Возвращает шрифт для рисования легенды диаграммы.
	 * @return Шрифт для рисования легенды диаграммы
	 */
	public Font getFont() {
		return font;
	}
	
	/**
	 * Рисует диаграмму.
	 * @param g Графический контекст
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
