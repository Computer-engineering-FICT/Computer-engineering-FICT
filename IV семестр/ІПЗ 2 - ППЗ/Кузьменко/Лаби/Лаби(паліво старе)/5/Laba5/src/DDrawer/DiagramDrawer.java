package DDrawer;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Rectangle;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import java.awt.geom.Rectangle2D;
import java.awt.geom.Point2D;
import java.util.ArrayList;


import DDrawer.DiagramPanel.MouseEvents;

/**
 * ����� ��� ��������� ��������.
 * @author ������ �����, ����� ��-73
 */
public class DiagramDrawer {

	/**
	 * ������� ������.
	 */
	private static String[][] table;
	/**
	 * ������� ������ ��� ���������.
	 */
	private static ArrayList < Rectangle2D > R2D;
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
	 * ���� �� ����������� ��������� ������������� �������� �������
	 * ��� � �������������� � ����, ���������� � ������������ �������������.
	 */
	private boolean converted;
	
	/**
	 * ����������� �� ��������� ������ ��� ��������� ��������.
	 */
	public DiagramDrawer() {
		table = null;
		panel = null;
		colors = null;
		font = DEFAULT_FONT;
		R2D = new ArrayList<Rectangle2D>();
		converted = false;
	}
	
	/**
	 * ����������� ������ ��� ��������� ��������.
	 * @param table ������� ������
	 */
	public DiagramDrawer(String[][] table) {
		this.table = table;
		panel = null;
		colors = new Color[table.length];
		generateColors();
		font = DEFAULT_FONT;
		this.R2D = new ArrayList<Rectangle2D>();
		converted = false;
	}
	
	/**
	 * ����������� ������ ��� ��������� ��������.
	 * @param table ������� ������
	 * @param panel ������ ��� ��������� ���������
	 */
	public DiagramDrawer(String[][] table, DiagramPanel panel) {
		this.table = table;
		this.panel = panel;
		colors = new Color[table.length];
		generateColors();
		font = DEFAULT_FONT;
		this.R2D = new ArrayList<Rectangle2D>();
		converted = false;
	}
	
	/**
	 * ����������� ������ ��� ��������� ��������.
	 * @param table ������� ������
	 * @param font ����� ��� ��������� ������� ���������
	 */
	public DiagramDrawer(String[][] table, Font font) {
		this.table = table;
		panel = null;
		colors = new Color[table.length];
		generateColors();
		this.font = font;
		this.R2D = new ArrayList<Rectangle2D>();
		converted = false;
	}
	
	/**
	 * ����������� ������ ��� ��������� ��������.
	 * @param table ������� ������
	 * @param panel ������ ��� ��������� ���������
	 * @param font ����� ��� ��������� ������� ���������
	 */
	public DiagramDrawer(String[][] table, DiagramPanel panel, Font font) {
		this.table = table;
		this.panel = panel;
		colors = new Color[table.length];
		generateColors();
		this.font = font;
		this.R2D = new ArrayList<Rectangle2D>();
		converted = false;
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
	
	public static void change(Point2D p) {
		/*for (Rectangle2D r : R2D) {
			if (r.contains(p)) {*/
		for (int i = 0; i < table.length; i++) {
			System.out.println("MinX: "+R2D.get(i).getMinX()+"    MaxX: "+R2D.get(i).getMaxX()+"    CurX: "+p.getX());
			if ( (p.getX() >= R2D.get(i).getMinX()) && (p.getX() <= R2D.get(i).getMaxX()) ) {
				System.out.println("Test in Area");
				R2D.add(i, new Rectangle2D.Double(R2D.get(i).getX(), R2D.get(i).getY(), R2D.get(i).getWidth(), R2D.get(i).getY()-p.getY()+R2D.get(i).getHeight()));
				R2D.remove(i+1);
				/*System.out.println();
				for (int j = 0; j < table.length; j++) {
					System.out.println("MinX: "+R2D.get(j).getMinX()+"    MaxX: "+R2D.get(j).getMaxX());
				}*/
			} else {
				System.out.println("Test out of Area");
			}
		}
	}
			
	public class MouseEvents extends MouseAdapter {
		public void MousePressed(MouseEvent event){
			//System.out.println("Test!");
			change(event.getPoint());			
		}		
	}
	
	private void convert(String[][] t) {
		for (int i = 0; i < table.length; i++) {
			/*Rectangle2D temp = new Rectangle2D();
			temp.*/
			Rectangle2D r = new Rectangle2D.Double(i*panel.getWidth()/table.length, Integer.parseInt(table[i][0]), 30, Integer.parseInt(table[i][1])-Integer.parseInt(table[i][0])); 
			R2D.add(i, r);
		}
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
		if (converted == false) {
			convert(table);
			converted = true;
		}		
		for (int i = 0; i <= table.length; i++) {
			/*startAngle += arcAngle;
			
			//arcAngle = (int)(Double.valueOf(table[i][1])/sum * 362);
			arcAngle = (int)((Double.valueOf(table[i][1])/sum) * legend.getWidth()/table.length);
			
			g.setColor(colors[i]);
			
			//g.fillArc((int)diagram.getX(), (int)diagram.getY(), (int)diagram.getWidth(), (int)diagram.getHeight(), startAngle, arcAngle);
			g.drawLine(startAngle, 10, (int)diagram.getX(), (int)diagram.getY());*/
			g.setColor(colors[i]);
			//g.drawLine(i*50, Integer.parseInt(table[i][0]), (i+1)*50, Integer.parseInt(table[i][1]));
			//g.drawLine(Integer.parseInt(table[i][0]), i*50, Integer.parseInt(table[i][1]), (i+1)*50);
			//g.fillRect(i*panel.getWidth()/table.length, Integer.parseInt(table[i][0]), 30, Integer.parseInt(table[i][1]));
			
			//g.fillRect(xLeft,yTop,width,Height)
			//g.fillRect(10+110*i,100+110*i,150+160*0,300+160*i);
			System.out.println("Test000!");
			g.fillRect((int)R2D.get(i).getX(),(int)R2D.get(i).getY(),(int)R2D.get(i).getWidth(),(int)R2D.get(i).getHeight());
		}
		

		
		
	}
	
}
