package edu.editor.algorithm.controller.listener;

import java.awt.Cursor;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionListener;
import java.util.ArrayList;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.AbstractComponent;
import edu.editor.algorithm.model.component.block.AbstractBlock;
import edu.editor.algorithm.model.component.block.Connection;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

public class BlockMouseMotionListener implements MouseMotionListener {
	private AlgorithmPanel panel;
	private int deltaX = 0;
	private int deltaY = 0;
	
	public BlockMouseMotionListener(AlgorithmPanel panel) {
		this.panel = panel;
	}
	
	private void change1X(ArrayList<AbstractBlock> alab) {
		if (deltaX >= AlgorithmPanel.widthCell) {
			for (int i = 0; i < alab.size(); i++) {
				alab.get(i).setPoint1X(alab.get(i).getPoint1X() + AlgorithmPanel.widthCell);
			}
			deltaX -= AlgorithmPanel.widthCell;
		} else {
			if (deltaX <= - AlgorithmPanel.widthCell) {
				for (int i = 0; i < alab.size(); i++) {
					alab.get(i).setPoint1X(alab.get(i).getPoint1X() - AlgorithmPanel.widthCell);
				}
				deltaX += AlgorithmPanel.widthCell;
			}
		}
	}
	
	private void change1Y(ArrayList<AbstractBlock> alab) {
		if (deltaY >= AlgorithmPanel.heightCell) {
			for (int i = 0; i < alab.size(); i++) {
				alab.get(i).setPoint1Y(alab.get(i).getPoint1Y() + AlgorithmPanel.heightCell);
			}
			deltaY -= AlgorithmPanel.heightCell;
		} else {
			if (deltaY <= - AlgorithmPanel.heightCell) {
				for (int i = 0; i < alab.size(); i++) {
					alab.get(i).setPoint1Y(alab.get(i).getPoint1Y() - AlgorithmPanel.heightCell);
				}
				deltaY += AlgorithmPanel.heightCell;
			}
		}
	}
	
	private void change2X(ArrayList<AbstractBlock> alab) {
		if (deltaX >= AlgorithmPanel.widthCell) {
			for (int i = 0; i < alab.size(); i++) {
				alab.get(i).setPoint2X(alab.get(i).getPoint2X() + AlgorithmPanel.widthCell);
			}
			deltaX -= AlgorithmPanel.widthCell;
		} else {
			if (deltaX <= - AlgorithmPanel.widthCell) {
				for (int i = 0; i < alab.size(); i++) {
					alab.get(i).setPoint2X(alab.get(i).getPoint2X() - AlgorithmPanel.widthCell);
				}
				deltaX += AlgorithmPanel.widthCell;
			}
		}
	}
	
	private void change2Y(ArrayList<AbstractBlock> alab) {
		if (deltaY >= AlgorithmPanel.heightCell) {
			for (int i = 0; i < alab.size(); i++) {
				alab.get(i).setPoint2Y(alab.get(i).getPoint2Y() + AlgorithmPanel.heightCell);
			}
			deltaY -= AlgorithmPanel.heightCell;
		} else {
			if (deltaY <= - AlgorithmPanel.heightCell) {
				for (int i = 0; i < alab.size(); i++) {
					alab.get(i).setPoint2Y(alab.get(i).getPoint2Y() - AlgorithmPanel.heightCell);
				}
				deltaY += AlgorithmPanel.heightCell;
			}
		}
	}
	
	private ArrayList<AbstractBlock> getSelectedBlocks (ArrayList<AbstractComponent> components){
		ArrayList<AbstractBlock> alab = new ArrayList<AbstractBlock>();
		for (int i = 0; i < components.size(); i++) {
			if (components.get(i).isSelected()){
				if (components.get(i) instanceof AbstractBlock) {
					alab.add((AbstractBlock)components.get(i));
				} 
			}
		}
		return alab;
	}
	
	@Override
	public void mouseDragged(MouseEvent e) {
//		System.out.println(e.getX() + " " + e.getY());
		AlgorithmModel model = panel.getModel();
		ArrayList<AbstractComponent> components = model.getComponents();
		if (panel.getCurrent() != null) {
			switch (panel.getPoint()) {
			case 1:
				panel.setCursor(Cursor.getPredefinedCursor(Cursor.NW_RESIZE_CURSOR));
				deltaX += e.getX() - panel.getX1();
				deltaY += e.getY() - panel.getY1();
				if (Math.abs(deltaX) >= AlgorithmPanel.widthCell ||
						Math.abs(deltaY) >= AlgorithmPanel.heightCell) {
					ArrayList<AbstractBlock> alab = getSelectedBlocks(components);
					change1X(alab);
					change1Y(alab);
				}
				break;
			case 2:
				panel.setCursor(Cursor.getPredefinedCursor(Cursor.N_RESIZE_CURSOR));
				deltaY += e.getY() - panel.getY1();
				if (Math.abs(deltaY) >= AlgorithmPanel.heightCell) {
					ArrayList<AbstractBlock> alab = getSelectedBlocks(components);
					change1Y(alab);
				}
				break;
			case 3:
				panel.setCursor(Cursor.getPredefinedCursor(Cursor.NE_RESIZE_CURSOR));
				deltaX += e.getX() - panel.getX1();
				deltaY += e.getY() - panel.getY1();
				if (Math.abs(deltaX) >= AlgorithmPanel.widthCell ||
						Math.abs(deltaY) >= AlgorithmPanel.heightCell) {
					ArrayList<AbstractBlock> alab = getSelectedBlocks(components);
					change2X(alab);
					change1Y(alab);
				}
				break;
			case 4:
				panel.setCursor(Cursor.getPredefinedCursor(Cursor.W_RESIZE_CURSOR));
				deltaX += e.getX() - panel.getX1();
				if (Math.abs(deltaX) >= AlgorithmPanel.widthCell) {
					ArrayList<AbstractBlock> alab = getSelectedBlocks(components);
					change1X(alab);
				}
				break;
			case 5:
				panel.setCursor(Cursor.getPredefinedCursor(Cursor.E_RESIZE_CURSOR));
				deltaX += e.getX() - panel.getX1();
				if (Math.abs(deltaX) >= AlgorithmPanel.widthCell) {
					ArrayList<AbstractBlock> alab = getSelectedBlocks(components);
					change2X(alab);
				}
				break;
			case 6:
				panel.setCursor(Cursor.getPredefinedCursor(Cursor.SW_RESIZE_CURSOR));
				deltaX += e.getX() - panel.getX1();
				deltaY += e.getY() - panel.getY1();
				if (Math.abs(deltaX) >= AlgorithmPanel.widthCell ||
						Math.abs(deltaY) >= AlgorithmPanel.heightCell) {
					ArrayList<AbstractBlock> alab = getSelectedBlocks(components);
					change1X(alab);
					change2Y(alab);
				}
				break;
			case 7:
				panel.setCursor(Cursor.getPredefinedCursor(Cursor.S_RESIZE_CURSOR));
				deltaY += e.getY() - panel.getY1();
				if (Math.abs(deltaX) >= AlgorithmPanel.widthCell ||
						Math.abs(deltaY) >= AlgorithmPanel.heightCell) {
					ArrayList<AbstractBlock> alab = getSelectedBlocks(components);
					change2Y(alab);
				}
				break;
			case 8:
				panel.setCursor(Cursor.getPredefinedCursor(Cursor.SE_RESIZE_CURSOR));
				deltaX += e.getX() - panel.getX1();
				deltaY += e.getY() - panel.getY1();
				if (Math.abs(deltaX) >= AlgorithmPanel.widthCell ||
						Math.abs(deltaY) >= AlgorithmPanel.heightCell) {
					ArrayList<AbstractBlock> alab = getSelectedBlocks(components);
					change2X(alab);
					change2Y(alab);
				}
				break;
			default:
				deltaX += e.getX() - panel.getX1();
				deltaY += e.getY() - panel.getY1();
				if (Math.abs(deltaX) >= AlgorithmPanel.widthCell ||
						Math.abs(deltaY) >= AlgorithmPanel.heightCell) {
					ArrayList<AbstractBlock> alab = new ArrayList<AbstractBlock>();
					ArrayList<Connection> alc = new ArrayList<Connection>();
					for (int i = 0; i < components.size(); i++) {
						if (components.get(i).isSelected()){
							if (components.get(i) instanceof AbstractBlock) {
								alab.add((AbstractBlock)components.get(i));
							} else {
								if (components.get(i) instanceof Connection) {
									alc.add((Connection)components.get(i));
								}
							}
						}
					}
					if (deltaX >= AlgorithmPanel.widthCell) {
						for (int i = 0; i < alab.size(); i++) {
							alab.get(i).moveByOffSet(AlgorithmPanel.widthCell, 0);
						}
						for (int i = 0; i < alc.size(); i++) {
							alc.get(i).moveByOffSet(AlgorithmPanel.widthCell, 0);
						}
						deltaX -= AlgorithmPanel.widthCell;
					} else {
						if (deltaX <= - AlgorithmPanel.widthCell) {
							for (int i = 0; i < alab.size(); i++) {
								alab.get(i).moveByOffSet(- AlgorithmPanel.widthCell, 0);
							}
							for (int i = 0; i < alc.size(); i++) {
								alc.get(i).moveByOffSet(- AlgorithmPanel.widthCell, 0);
							}
							deltaX += AlgorithmPanel.widthCell;
						}
					}
					if (deltaY >= AlgorithmPanel.heightCell) {
						for (int i = 0; i < alab.size(); i++) {
							alab.get(i).moveByOffSet(0, AlgorithmPanel.heightCell);
						}
						for (int i = 0; i < alc.size(); i++) {
							alc.get(i).moveByOffSet(0, AlgorithmPanel.heightCell);
						}
						deltaY -= AlgorithmPanel.heightCell;
					} else {
						if (deltaY <= - AlgorithmPanel.heightCell) {
							for (int i = 0; i < alab.size(); i++) {
								alab.get(i).moveByOffSet(0, - AlgorithmPanel.heightCell);
							}
							for (int i = 0; i < alc.size(); i++) {
								alc.get(i).moveByOffSet(0, - AlgorithmPanel.heightCell);
							}
							deltaY += AlgorithmPanel.heightCell;
						}
					}
				}
				break;
			}
			panel.setX1(e.getX());
			panel.setY1(e.getY());
			panel.setX2(e.getX());
			panel.setY2(e.getY());
		} else {
			if (panel.getCurrentConn() != null) {
				switch (panel.getPointConn()) {
				case -1:
					break;
				default:
					deltaX += e.getX() - panel.getX1();
					deltaY += e.getY() - panel.getY1();
					System.out.println(deltaX);
					if (Math.abs(deltaX) >= AlgorithmPanel.widthCell / 2 || 
							Math.abs(deltaY) >= AlgorithmPanel.heightCell / 2 ) {
						if (deltaX >= AlgorithmPanel.widthCell / 2) {
							panel.getCurrentConn().moveZigzagPointRight(panel.getPointConn());
							deltaX -= AlgorithmPanel.widthCell / 2;
						} else {
							if (deltaX <= - AlgorithmPanel.widthCell / 2) {
								panel.getCurrentConn().moveZigzagPointLeft(panel.getPointConn());
								deltaX += AlgorithmPanel.widthCell / 2;
							}
						}
						if (deltaY >= AlgorithmPanel.heightCell) {
							panel.getCurrentConn().moveZigzagPointDown(panel.getPointConn());
							deltaY -= AlgorithmPanel.heightCell / 2;
						} else {
							if (deltaY <= - AlgorithmPanel.heightCell) {
								panel.getCurrentConn().moveZigzagPointUp(panel.getPointConn());
								deltaY += AlgorithmPanel.heightCell / 2;
							}
						}
					}
				}
				panel.setX1(e.getX());
				panel.setY1(e.getY());
				panel.setX2(e.getX());
				panel.setY2(e.getY());
			} else {
				panel.setX2(e.getX());
				panel.setY2(e.getY());
				model.setSelected(panel.getX1(), panel.getY1(), panel.getX2(), panel.getY2());
			}
		}
		model.changedPanel(panel);
		panel.repaint();
	}

	@Override
	public void mouseMoved(MouseEvent e) {
//		System.out.println(e.getX() + " " + e.getY());
		deltaX = 0;
		deltaY = 0;
		AlgorithmModel model = panel.getModel();
		if (model.contains(e.getX(), e.getY())){
			if (model.getSelected(e.getX(),e.getY()) instanceof AbstractBlock) {
				switch (((AbstractBlock)model.getSelected(e.getX(),e.getY())).getResizePoint(e.getX(), e.getY())) {
				case 1:
					panel.setCursor(Cursor.getPredefinedCursor(Cursor.NW_RESIZE_CURSOR));
					break;
				case 2:
					panel.setCursor(Cursor.getPredefinedCursor(Cursor.N_RESIZE_CURSOR));
					break;
				case 3:
					panel.setCursor(Cursor.getPredefinedCursor(Cursor.NE_RESIZE_CURSOR));
					break;
				case 4:
					panel.setCursor(Cursor.getPredefinedCursor(Cursor.W_RESIZE_CURSOR));
					break;
				case 5:
					panel.setCursor(Cursor.getPredefinedCursor(Cursor.E_RESIZE_CURSOR));
					break;
				case 6:
					panel.setCursor(Cursor.getPredefinedCursor(Cursor.SW_RESIZE_CURSOR));
					break;
				case 7:
					panel.setCursor(Cursor.getPredefinedCursor(Cursor.S_RESIZE_CURSOR));
					break;
				case 8:
					panel.setCursor(Cursor.getPredefinedCursor(Cursor.SE_RESIZE_CURSOR));
					break;
				default:
					panel.setCursor(Cursor.getPredefinedCursor(Cursor.MOVE_CURSOR));
					break;
				}
			} else {
				if (model.getSelected(e.getX(),e.getY()) instanceof Connection) {
					if (((Connection) model.getSelected(e.getX(),e.getY())).getZigzagPoint(e.getX(), e.getY()) != -1) {
						panel.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
					}
				}
			}
		} else {
			panel.setCursor(Cursor.getDefaultCursor());
		}
	}
}
