package Scheme;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;

import java.util.ArrayList;

import javax.swing.JPanel;

import lab1_8.MainWindow;

import Scheme.Elements.Element;
import Scheme.Elements.InputVariable;
import Scheme.Elements.JKTrigger;
import Scheme.Elements.OutputVariable;

public class SchemePanel extends JPanel implements MouseListener, MouseMotionListener {
	
	private static final long serialVersionUID = -4763106806489158220L;

	private MainWindow Owner;
	
	private ArrayList<Element> SchemeElements;
	private ArrayList<Element> ActiveElements = new ArrayList<Element>();
	
	private Point2D PreviousDraggingPoint;
	private Point2D BeginSelectionPoint;
	private Rectangle2D SelectionRectangle;
	
	private boolean isSelecting;
	private boolean isDragging;
	
	public SchemePanel(MainWindow Owner) {
		this.Owner = Owner;
	}
	
	public void setElements(ArrayList<Element> SchemeElements) {
		this.SchemeElements = SchemeElements;
		
		this.setBackground(Color.WHITE);
		
		this.addMouseListener(this);
		this.addMouseMotionListener(this);
		
		initElementsPosition();
	}
	
	private void initElementsPosition() {
		
		int GridStep = 100;
		
		int i = 0;
		for (Element e : SchemeElements) {
			if (e.getClass().equals(InputVariable.class)
					|| e.getClass().equals(JKTrigger.class)) {
				e.setLocation(5*GridStep, GridStep+GridStep*(i++));
			}
		}
		
		i = 0;
		for (Element e : SchemeElements) {
			if (!e.getClass().equals(InputVariable.class)
					&& !e.getClass().equals(JKTrigger.class)
					&& !e.getClass().equals(OutputVariable.class)) {
				e.setLocation(9*GridStep+GridStep*(i/8), GridStep+GridStep*((i++) % 8));
			}
		}

		int j = 0;
		for (Element e : SchemeElements) {
			if (e.getClass().equals(OutputVariable.class)) {
				e.setLocation((12+i/8)*GridStep, GridStep+GridStep*(j++));
			}
		}
	}
	
	@Override
	public void paint(Graphics g) {
		Graphics2D g2 = (Graphics2D) g;
		super.paint(g2);
		
		g2.setFont(new Font(g2.getFont().getName(), Font.BOLD, g2.getFont().getSize()));
		
		for (int i = 0; i<SchemeElements.size(); i++) {
			if (ActiveElements.contains(SchemeElements.get(i))) {
				g2.setColor(Color.BLUE);
				SchemeElements.get(i).paint(g2);
				g2.setColor(Color.BLACK);
			}
			else {
				SchemeElements.get(i).paint(g2);
			}
		}
		
		if (SelectionRectangle!=null) {
			g2.draw(SelectionRectangle);
		}
		
		this.setPreferredSize(new Dimension(4000, 2000));
		this.setSize(this.getPreferredSize());
	}

	@Override
	public void mouseClicked(MouseEvent e) {
	
		if (e.getButton() == MouseEvent.BUTTON1 && e.getClickCount() == 1) {
			ActiveElements.clear();
			
			for (Element E : SchemeElements) {
				if (E.isContainsPoint(e.getPoint())) {
					ActiveElements.add(E);
					break;
				}
			}
			
			this.repaint();
			return;
		}
		
		if (e.getButton() == MouseEvent.BUTTON1 && e.getClickCount() == 2) {
			BufferedImage Image = new BufferedImage(
					(int) this.getPreferredSize().getWidth(),
					(int) this.getPreferredSize().getHeight(),
					BufferedImage.TYPE_INT_RGB);
			Graphics2D g2 = Image.createGraphics();
			this.paint(g2);
			Owner.saveImage(Image);
		}
	}

	@Override
	public void mouseEntered(MouseEvent e) {}

	@Override
	public void mouseExited(MouseEvent e) {}

	@Override
	public void mousePressed(MouseEvent e) {
		
		if (e.getButton() == MouseEvent.BUTTON1) {
			Element PressedElment = null;
			for (Element E : SchemeElements) {
				if (E.isContainsPoint(e.getPoint())) {
					PressedElment = E;
					break;
				}
			}
			
			if (PressedElment == null) {
				ActiveElements.clear();
				isSelecting = true;
			} else {
				if (!ActiveElements.contains(PressedElment)) {
					ActiveElements.clear();
					ActiveElements.add(PressedElment);
					this.repaint();
				}
				
				PreviousDraggingPoint = e.getPoint();
				isDragging = true;
			}
		}
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		PreviousDraggingPoint = null;
		BeginSelectionPoint = null;
		SelectionRectangle = null;
		
		isSelecting = false;
		isDragging = false;
		
		this.repaint();
	}

	@Override
	public void mouseDragged(MouseEvent e) {
		
		if (isSelecting) {
			if (BeginSelectionPoint==null) {
				BeginSelectionPoint = e.getPoint();
			} else {
				SelectionRectangle = new Rectangle2D.Double(
						Math.min(BeginSelectionPoint.getX(), e.getX()),
						Math.min(BeginSelectionPoint.getY(), e.getY()),
						Math.abs(e.getX()-BeginSelectionPoint.getX()),
						Math.abs(e.getY()-BeginSelectionPoint.getY()));
				ActiveElements.clear();
				for (Element E : SchemeElements) {
					if (SelectionRectangle.contains(E.getShapeFrame())) {
						ActiveElements.add(E);
					}
				}
				
				this.repaint();
				return;
			}
		}
		
		if (isDragging) {
			for (Element E : ActiveElements) {
				E.changeLocation(
						e.getX()-PreviousDraggingPoint.getX(),
						e.getY()-PreviousDraggingPoint.getY());
			}
			PreviousDraggingPoint.setLocation(
					e.getX(),
					e.getY());
			this.repaint();
		}
	}

	@Override
	public void mouseMoved(MouseEvent e) {}
}
