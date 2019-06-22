package edu.editor.algorithm.view.panel;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
//import java.util.ArrayList;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JPanel;
import javax.swing.JScrollPane;

import edu.editor.algorithm.controller.MouseListenerController;
import edu.editor.algorithm.controller.listener.mouse.ConnectionMouseListener;
import edu.editor.algorithm.controller.listener.mouse.TextMouseListener;
import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.block.AbstractBlock;
import edu.editor.algorithm.model.component.block.Connection;

public class AlgorithmPanel extends JPanel implements Observer {
	
	private static final long serialVersionUID = 5914468563663873059L;
	
	private AlgorithmModel algorithmModel;
	private int x1 = 0;
	private int y1 = 0;
	private int x2 = 0;
	private int y2 = 0;
	private int place = 0;
	private AbstractBlock current = null;
	private int point = -1;
	
	private MouseListenerController mlc;
	
	public static int widthCell = 15;
	public static int heightCell = 15;
	
	private boolean connectionMod = false;
	private int[] connArrayX = null;
	private int[] connArrayY = null;
	
	private JScrollPane jsp;
	
	private Connection currentConn = null;
	private int pointConn = 0;
	
	public AlgorithmPanel(AlgorithmModel model) {
		algorithmModel = model;
		mlc = new MouseListenerController(this, algorithmModel);
		setBackground(Color.white);
		setDoubleBuffered(true);
		setPreferredSize(new Dimension(600, 600));
	}
	
	public AlgorithmModel getModel() {
		return algorithmModel;
	}
	
	public void setModel(AlgorithmModel model) {
		if (algorithmModel != null) {
			algorithmModel.deleteObserver(this);
		}
		algorithmModel = model;
		if (algorithmModel != null) {
			algorithmModel.addObserver(this);
			repaint();
		}
	}

	public final int getX1() {
		return x1;
	}

	public final void setX1(int x1) {
		this.x1 = x1;
	}

	public final int getY1() {
		return y1;
	}

	public final void setY1(int y1) {
		this.y1 = y1;
	}

	public final int getX2() {
		return x2;
	}

	public final void setX2(int x2) {
		this.x2 = x2;
	}

	public final int getY2() {
		return y2;
	}

	public final void setY2(int y2) {
		this.y2 = y2;
	}

	public final AbstractBlock getCurrent() {
		return current;
	}

	public final void setCurrent(AbstractBlock current) {
		this.current = current;
	}
	
	public final int getPoint() {
		return point;
	}

	public final void setPoint(int point) {
		this.point = point;
	}
	
	public final int getPlace() {
		return place;
	}

	public final void setPlace(int place) {
		this.place = place;
	}

	@Override
	public synchronized void addMouseListener(MouseListener l) {
		if (getMouseListeners() != null && getMouseListeners().length > 0) {
			if (getMouseListeners()[0] instanceof TextMouseListener) {
				TextMouseListener tml = (TextMouseListener)getMouseListeners()[0];   
				if (tml.getJTextField() != null) {
					remove(tml.getJTextField());
					repaint();
				} 
			} else {
				if (getMouseListeners()[0] instanceof ConnectionMouseListener) {
					setConnectionMod(false);
				}
			}
			removeMouseListener(getMouseListeners()[0]);
		}
		super.addMouseListener(mlc.getListener(l));
	}
	
	@Override
	public synchronized void addMouseMotionListener(MouseMotionListener l) {
		if (getMouseMotionListeners() != null && getMouseMotionListeners().length > 0) {
			removeMouseMotionListener(getMouseMotionListeners()[0]);
		}
		super.addMouseMotionListener(l);
	}

	@Override
	public void update(Observable o, Object arg) {
		repaint();
	}
	
	@Override
	protected void paintComponent(Graphics g) {
		super.paintComponent(g);
		
		Graphics2D g2d = (Graphics2D)g;
		g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		g2d.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		
		g2d.setColor(new Color(235,228,228));
		for (int i = 0; i <= getWidth()/widthCell; i++) {
			g2d.drawLine(i * widthCell, 0, i * widthCell, getHeight());
		}
		for (int i = 0; i <= getHeight()/heightCell; i++) {
			g2d.drawLine(0, i * heightCell, getWidth(), i * heightCell);
		}
		
		drawComponents(g2d);
	}
	
	public void drawComponents(Graphics2D g2d) {
		AbstractBlock b;
		for (int i = 0; i < algorithmModel.getComponents().size(); i++) {
			g2d.setColor(Color.black);
			algorithmModel.getComponents().get(i).draw(g2d);
			if (algorithmModel.getComponents().get(i).isSelected()) {
				if(algorithmModel.getComponents().get(i) instanceof AbstractBlock) {
					b = (AbstractBlock)algorithmModel.getComponents().get(i);
					g2d.setColor(Color.red);
					g2d.fillOval(b.getPoint1X()-4, b.getPoint1Y()-4, 8, 8);
					g2d.fillRect(b.getCenterX()-4, b.getPoint1Y()-4, 8, 8);
					g2d.fillOval(b.getPoint2X()-4, b.getPoint1Y()-4, 8, 8);
					g2d.fillRect(b.getPoint2X()-4, b.getCenterY()-4, 8, 8);
					g2d.fillOval(b.getPoint2X()-4, b.getPoint2Y()-4, 8, 8);
					g2d.fillRect(b.getCenterX()-4, b.getPoint2Y()-4, 8, 8);
					g2d.fillOval(b.getPoint1X()-4, b.getPoint2Y()-4, 8, 8);
					g2d.fillRect(b.getPoint1X()-4, b.getCenterY()-4, 8, 8);
					g2d.setColor(Color.black);
				} else {
					g2d.setColor(Color.red);
					algorithmModel.getComponents().get(i).draw(g2d);
					g2d.setColor(Color.black);
				}
			}
		}
		if (getX1()!=getX2() || getY1()!=getY2()) {
			g2d.setColor(Color.blue);
			g2d.drawRect(Math.min(getX1(), getX2()), Math.min(getY1(), getY2()), Math.abs(getX1()-getX2()), Math.abs(getY1()-getY2()));
			g2d.setColor(Color.black);
		}
		if (isConnectionMod()) {
			g2d.setColor(Color.BLUE);
			g2d.drawPolyline(connArrayX, connArrayY, connArrayX.length);
		}
	}
	
	@Override
	public Dimension getMinimumSize() {
		return getPreferredSize();
	}
	
	@Override
	public Dimension getMaximumSize() {
		return getPreferredSize();
	}
	
	public void addNotify() {
		super.addNotify();
		algorithmModel.addObserver(this);
	}
	
	public void removeNotify() {
		super.removeNotify();
		algorithmModel.deleteObserver(this);
	}

	public void setConnectionMod(boolean connectionMod) {
		this.connectionMod = connectionMod;
	}

	public boolean isConnectionMod() {
		return connectionMod;
	}

	public void setConnArrayX(int[] connArrayX) {
		this.connArrayX = connArrayX;
	}

	public int[] getConnArrayX() {
		return connArrayX;
	}

	public void setConnArrayY(int[] connArrayY) {
		this.connArrayY = connArrayY;
	}

	public int[] getConnArrayY() {
		return connArrayY;
	}

	public void setJsp(JScrollPane jsp) {
		this.jsp = jsp;
	}

	public JScrollPane getJsp() {
		return jsp;
	}

	public void setCurrentConn(Connection currentConn) {
		this.currentConn = currentConn;
	}

	public Connection getCurrentConn() {
		return currentConn;
	}

	public void setPointConn(int pointConn) {
		this.pointConn = pointConn;
	}

	public int getPointConn() {
		return pointConn;
	}
	
}
