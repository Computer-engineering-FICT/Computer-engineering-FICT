package kpi.os.cours.forms;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;

import javax.swing.JPanel;

public class DiagramLine extends JPanel {
	private static final long serialVersionUID = -1906563162597516576L;
	private DiagramLineData lineDat;		
	private DiagramData diagDat;
	
	/**
	 * @param data		diagram data
	 * @param stepScale	count of real steps in one step on image
	 */
	public DiagramLine(DiagramLineData data, DiagramData diagDat) {
		this.lineDat = data;
		this.diagDat = diagDat;
	}
	
	@Override
	protected void paintComponent(Graphics g) {		
		super.paintComponent(g);		
		Graphics2D g2 = (Graphics2D) g;
		
		//Size of one step ( |--size--|--size--|... )
		int stepSize = (getWidth() - Diagram.START_POSITION) / diagDat.getStepCount();
		if (stepSize == 0) stepSize = 1;
		
		//Label of line
		Font myFont = new Font(null, Font.BOLD, 14);
		g2.setFont(myFont);
		g2.drawString(lineDat.getName(), Diagram.START_POSITION / 10, getHeight() / 2 + 5);
		
		//Main axis
		g2.setPaint(Color.BLACK);
		g2.setStroke(new BasicStroke(5.0f));
		g2.drawLine(Diagram.START_POSITION, this.getHeight() / 2, 
				this.getWidth(), this.getHeight() / 2);
		g2.setStroke(new BasicStroke(1));
		
		//Bar markers
		g2.setPaint(Color.GRAY);
		for (int i = 0; i < diagDat.getStepCount() / diagDat.getStepScale(); i++) {
			g2.drawLine(Diagram.START_POSITION + i * stepSize  * diagDat.getStepScale(), 0, 
						Diagram.START_POSITION + i * stepSize  * diagDat.getStepScale(), getHeight());
		}
		
		//Bars
		for (Interval in : lineDat.getIntervals()) {
			switch (in.getType()) {
			case PROCESSING:
				drawProcess(in, g2, stepSize);
				break;
			case SENDING:
				drawTransacion(in, g2, stepSize);
				break;
			case RECEIVING:
				drawTransacion(in, g2, stepSize);
				break;
			case MARKER:
				drawMarker(in, g2, stepSize);
				break;
			}
		}
	}
	
	private void drawProcess(Interval in, Graphics2D g2, int stSize) {
		int x = Diagram.START_POSITION + in.getBegin() * stSize;
		int yStep = getHeight() / 3; 
		int y =  yStep;
		
		int width = (in.getEnd() - in.getBegin()) * stSize; 
		int height = yStep;
		
		g2.setColor(Color.BLACK);
		g2.drawRect(x, y, width, height);
		
		g2.setColor(IntervalType.PROCESSING_COLOR);
		Rectangle2D rect = new Rectangle2D.Float(x+1, y+1, width-1, height-1);
		g2.fill(rect);
		
		Font myFont = new Font(null, Font.PLAIN, 12);
		g2.setFont(myFont);
		g2.setColor(Color.BLACK);
		g2.drawString(in.getLabel(), x + 2, getHeight() / 2 + 10);
		
		myFont = new Font(null, Font.BOLD, 12);
		g2.setFont(myFont);
		g2.drawString("P", x + 2, getHeight() / 2 - 2);
	}
	
	private void drawTransacion(Interval in, Graphics2D g2, int stSize) {
		int x = Diagram.START_POSITION + in.getBegin() * stSize;
		int yStep = getHeight() / 8; 
		
		int y = 0;
		
		if (in.getType() == IntervalType.SENDING) {
			y = 1 * yStep;
		} else { 
			y = 5 * yStep;
		}
		  
		
		int width = (in.getEnd() - in.getBegin()) * stSize; 
		int height = 2 * yStep;
		
		g2.setColor(Color.BLACK);
		g2.drawRect(x, y, width, height);
		
		String transLab = "";
		
		if (in.getType() == IntervalType.SENDING) {
			g2.setColor(IntervalType.SENDING_COLOR);
			transLab = "S";
		} else {
			g2.setColor(IntervalType.RECEIVING_COLOR);
			transLab = "R";
		}
						
		Rectangle2D rect = new Rectangle2D.Float(x + 1, y + 1, width - 1, height - 1);
		g2.fill(rect);			
		
		Font myFont = new Font(null, Font.PLAIN, 12);
		g2.setFont(myFont);
		g2.setColor(Color.BLACK);
		g2.drawString(in.getLabel(), x + 2, y + 25);
		
		myFont = new Font(null, Font.BOLD, 12);
		g2.setFont(myFont);
		g2.drawString(transLab, x + 2, y + 15);
	}
	
	private void drawMarker(Interval in, Graphics2D g2, int stSize) {
		int x = Diagram.START_POSITION + in.getBegin() * stSize;
		int y = 0;
		int width = stSize;
		int height = getHeight() / 10;
		
		g2.setColor(Color.BLACK);
		g2.drawRect(x, y, width, height);
		g2.setColor(IntervalType.MARKER_COLOR);
		Rectangle2D rect = new Rectangle2D.Float(x + 1, y + 1, width - 1, height - 1);
		g2.fill(rect);	
	}
}
