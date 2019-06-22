package edu.editor.algorithm.controller.listener.mouse;

import java.awt.Cursor;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.Serializable;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.AbstractComponent;
import edu.editor.algorithm.model.component.block.AbstractBlock;
import edu.editor.algorithm.model.component.block.Begin;
import edu.editor.algorithm.model.component.block.ClassBlock;
import edu.editor.algorithm.model.component.block.Condition;
import edu.editor.algorithm.model.component.block.Connection;
import edu.editor.algorithm.model.component.block.Connector;
import edu.editor.algorithm.model.component.block.End;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

public class ConnectionMouseListener implements MouseListener, Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5973460166428596176L;
	private AlgorithmPanel panel;
	
	public ConnectionMouseListener(AlgorithmPanel panel) {
		this.panel = panel;
	}
	
	@Override
	public void mouseClicked(MouseEvent e) {
		AlgorithmModel model = panel.getModel();
		switch (e.getButton()) {
		case MouseEvent.BUTTON1:
			
			break;
		case MouseEvent.BUTTON2:
			
			break;
		case MouseEvent.BUTTON3:
			AbstractComponent component = model.getSelected(e.getX() / AlgorithmPanel.widthCell * AlgorithmPanel.widthCell, 
															e.getY() / AlgorithmPanel.heightCell * AlgorithmPanel.heightCell);
			if (!panel.isConnectionMod()) {
				panel.setConnectionMod(true);
				if (component != null) {
					if (component instanceof AbstractBlock && !(component instanceof End)) {
						panel.setCurrent((AbstractBlock)component);
						AbstractBlock abstractBlock = (AbstractBlock) component;
						int x,y = 0;
						if (abstractBlock instanceof Condition) {
							y = abstractBlock.getCenterY();
							if (abstractBlock.getCenterX()>e.getX()) {
								panel.setPlace(-1);
								x = abstractBlock.getPoint1X();
							} else {
								panel.setPlace(1);
								x = abstractBlock.getPoint2X();
							}
						} else {
							x = abstractBlock.getCenterX();
							y = abstractBlock.getPoint2Y();
						}
						int[] connArrayX = {x, x};
						panel.setConnArrayX(connArrayX);
						int[] connArrayY = {y, y};
						panel.setConnArrayY(connArrayY);
					}
					panel.setX1(e.getX());
					panel.setY1(e.getY());
					panel.setX2(e.getX());
					panel.setY2(e.getY());
				}
			} else {
				if (component == null) {
					int[] connArrayX = new int[panel.getConnArrayX().length + 1];
					for (int i = 0; i < connArrayX.length - 1; i++) {
						connArrayX[i] = panel.getConnArrayX()[i];
					}
					
					int[] connArrayY = new int[panel.getConnArrayY().length + 1];
					for (int i = 0; i < connArrayY.length - 1; i++) {
						connArrayY[i] = panel.getConnArrayY()[i];
					}
					int x1, y1, x2, y2;
					x2 = e.getX();
					y2 = e.getY();
					x1 = panel.getConnArrayX()[panel.getConnArrayX().length - 2];
					y1 = panel.getConnArrayY()[panel.getConnArrayY().length - 2];
					
					double k = (y1 - y2) / (double) (x1 - x2);
					if (k < 1 && k > -1) {
						y2 = y1;
					} else {
						x2 = x1;
					}
					connArrayX[connArrayX.length - 1] = x2 / AlgorithmPanel.widthCell * AlgorithmPanel.widthCell;
					connArrayY[connArrayY.length - 1] = y2 / AlgorithmPanel.heightCell * AlgorithmPanel.heightCell;
					if (x2 - connArrayX[connArrayX.length - 1] >= AlgorithmPanel.widthCell / 2) {
						connArrayX[connArrayX.length - 1] += AlgorithmPanel.widthCell / 2;
					}
					if (y2 - connArrayY[connArrayY.length - 1] >= AlgorithmPanel.heightCell / 2) {
						connArrayY[connArrayY.length - 1] += AlgorithmPanel.heightCell / 2;
					}
					panel.setConnArrayX(connArrayX);
					panel.setConnArrayY(connArrayY);
				} else {
					if (component instanceof AbstractBlock && !(component instanceof Begin)) {
						if (panel.getCurrent() != null && !panel.getCurrent().equals(component)) {
							boolean start=false,end=false;
							Connection line = new Connection(panel.getCurrent(), (AbstractBlock)component);
							if (line.getStartBlock() instanceof Condition) {
								if (panel.getPlace() == -1) {
									if (line.getStartBlock().getOutputConnection() == null) {
										line.getStartBlock().setOutputConnection(line);
										start = true;
									}
								} else {
									if (((Condition)line.getStartBlock()).getSecondOutputConnection() == null) {
										((Condition)line.getStartBlock()).setSecondOutputConnection(line);
										start = true;
									}
								}
							} else {
								if (line.getStartBlock().getOutputConnection() == null) {
									line.getStartBlock().setOutputConnection(line);
									start = true;
								}
							}
							
							if (start && component instanceof Connector) {
								if (line.getEndBlock().getCenterX()>e.getX()) {
									if (line.getEndBlock().getInputConnection() == null) {
										line.getEndBlock().setInputConnection(line);
										end = true;
									}
								} else {
									if (((Connector)line.getEndBlock()).getSecondInputConnection() == null) {
										((Connector)line.getEndBlock()).setSecondInputConnection(line);
										end = true;
									}
								}
							} else {
								if (line.getEndBlock().getInputConnection() == null) {
									line.getEndBlock().setInputConnection(line);
									end = true;
								}
							}
							
							if (start && end) {
								int[] connArrayX = new int[panel.getConnArrayX().length - 2];
								for (int i = 0; i < connArrayX.length; i++) {
									connArrayX[i] = panel.getConnArrayX()[i + 1];
								}
								
								int[] connArrayY = new int[panel.getConnArrayY().length - 2];
								for (int i = 0; i < connArrayY.length; i++) {
									connArrayY[i] = panel.getConnArrayY()[i + 1];
								}
								line.setConnArrayX(connArrayX);
								line.setConnArrayY(connArrayY);
								model.addComponent(line);
								panel.setCurrentConn(line);
							} else {
								System.out.println("AHTUNG! :) (No Start or End)");
							}
						}
					}
					panel.setPlace(0);
					panel.setCurrent(null);
					panel.setConnectionMod(false);
					/*panel.connectionX = null;
					panel.connectionY = null;*/
				}
			}
			break;
		}
		panel.repaint();
	}
	
	@Override
	public void mouseEntered(MouseEvent e) {}

	@Override
	public void mouseExited(MouseEvent e) {}

	@Override
	public void mousePressed(MouseEvent e) {
//		System.out.println("Pressed " + e.getClickCount());
		
		AlgorithmModel model = panel.getModel();
		AbstractComponent component = model.getSelected(e.getX(), e.getY());
		switch (e.getButton()) {
		case MouseEvent.BUTTON1:
			if (component != null) {
				if (component instanceof AbstractBlock && !(component instanceof End)) {
					panel.setCurrent((AbstractBlock)component);
					if (panel.getCurrent().getCenterX()>e.getX()) {
						panel.setPlace(-1);
					} else {
						panel.setPlace(1);
					}
				}
			}
			panel.setX1(e.getX());
			panel.setY1(e.getY());
			panel.setX2(e.getX());
			panel.setY2(e.getY());
			break;
		case MouseEvent.BUTTON2:
			break;
		case MouseEvent.BUTTON3:
			break;
		}
		panel.repaint();
	}

	@Override
	public void mouseReleased(MouseEvent e) {
//		System.out.println("Released " + e.getClickCount());
		if (e.getButton() == MouseEvent.BUTTON1) {
			AlgorithmModel model = panel.getModel();
			AbstractComponent selectedComponent = model.getSelected(e.getX(), e.getY());
			if (panel.getCurrent() != null && e.getClickCount() == 1) {
				if (selectedComponent instanceof AbstractBlock && !(selectedComponent instanceof Begin)) {
					if (!panel.getCurrent().equals(selectedComponent)) {
						boolean start=false,end=false;
						Connection line = new Connection(panel.getCurrent(), (AbstractBlock)selectedComponent);
						if (line.getStartBlock() instanceof Condition) {
							if (panel.getPlace() == -1) {
								if (line.getStartBlock().getOutputConnection() == null) {
									line.getStartBlock().setOutputConnection(line);
									start = true;
								}
							} else {
								if (((Condition)line.getStartBlock()).getSecondOutputConnection() == null) {
									((Condition)line.getStartBlock()).setSecondOutputConnection(line);
									start = true;
								}
							}
						} else {
							if (line.getStartBlock().getOutputConnection() == null) {
								line.getStartBlock().setOutputConnection(line);
								start = true;
							}
						}
						
						if (start) {
							if (selectedComponent instanceof Connector) {
								if (line.getEndBlock().getCenterX()>e.getX()) {
									if (line.getEndBlock().getInputConnection() == null) {
										line.getEndBlock().setInputConnection(line);
										end = true;
									}
								} else {
									if (((Connector)line.getEndBlock()).getSecondInputConnection() == null) {
										((Connector)line.getEndBlock()).setSecondInputConnection(line);
										end = true;
									}
								}
							} else {
								if (selectedComponent instanceof ClassBlock) {
									line.getEndBlock().addInputConnection(line);
									end = true;
								} else {
									if (line.getEndBlock().getInputConnection() == null) {
										line.getEndBlock().setInputConnection(line);
										end = true;
									}
								}
							}							
						} 
						if (start && end) {
							model.addComponent(line);
						} else {
							if (line.getStartBlock().getOutputConnection() != null && 
									line.getStartBlock().getOutputConnection().equals(line)) {
								line.getStartBlock().setOutputConnection(null);
							} else {
								if (line.getStartBlock() instanceof Condition) {
									((Condition)line.getStartBlock()).setSecondOutputConnection(null);
								}
							}
							if (line.getEndBlock().getInputConnection() != null &&
									line.getEndBlock().getInputConnection().equals(line)) {
								line.getEndBlock().setInputConnection(null);
							} else {
								if (line.getEndBlock() instanceof Connector) {
									((Connector)line.getEndBlock()).setSecondInputConnection(null);
								}
							}
						}
					}
				}
				panel.setCurrent(null);
				panel.setPoint(0);
				panel.setCursor(Cursor.getDefaultCursor());
			}
		}
	}
}
