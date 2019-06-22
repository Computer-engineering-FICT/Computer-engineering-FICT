package edu.editor.algorithm.controller.listener.mouse;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.Serializable;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.AbstractComponent;
import edu.editor.algorithm.model.component.block.AbstractBlock;
import edu.editor.algorithm.model.component.block.Connection;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

public class BlockMouseListener implements MouseListener, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7216328368166619425L;
	protected AlgorithmPanel panel;
	
	public BlockMouseListener(AlgorithmPanel panel/*, AlgorithmModel model*/) {
		this.panel = panel;
	}
	@Override
	public void mouseClicked(MouseEvent e) {
		AlgorithmModel model = panel.getModel();
		switch (e.getButton()) {
		case MouseEvent.BUTTON1:
			model.deselectAll();
			if (e.getClickCount() == 2) {
				
			} else {
				if (e.getClickCount() == 1) {
					if (model.contains(e.getX(), e.getY())) {
						model.setSelected(e.getX(), e.getY());
					}
				}
			}
			break;
		case MouseEvent.BUTTON2:
			
			break;
		case MouseEvent.BUTTON3:
			
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
		AlgorithmModel model = panel.getModel();
		AbstractComponent component = model.getSelected(e.getX(), e.getY());
		switch (e.getButton()) {
		case MouseEvent.BUTTON1:
			if (component != null) {
				if (!model.getSelected(e.getX(), e.getY()).isSelected()) {
					model.setSelected(e.getX(), e.getY());
				}
				if (component instanceof AbstractBlock) {
					panel.setCurrent((AbstractBlock)component);
					panel.setPoint(panel.getCurrent().getResizePoint(e.getX(), e.getY()));
				} else {
					if (component instanceof Connection) {
						panel.setCurrentConn((Connection)component);
						panel.setPointConn(panel.getCurrentConn().getZigzagPoint(e.getX(), e.getY()));
					}
				}
				panel.setX1(e.getX());
				panel.setY1(e.getY());
				panel.setX2(e.getX());
				panel.setY2(e.getY());
			} else {
				panel.setX1(e.getX());
				panel.setY1(e.getY());
				panel.setX2(e.getX());
				panel.setY2(e.getY());
			}
			break;
		case MouseEvent.BUTTON2:
			panel.setX1(e.getX());
			panel.setY1(e.getY());
			panel.setX2(e.getX());
			panel.setY2(e.getY());
			break;
		case MouseEvent.BUTTON3:
			panel.setX1(e.getX());
			panel.setY1(e.getY());
			panel.setX2(e.getX());
			panel.setY2(e.getY());
			break;
		}
		panel.repaint();
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		if (panel.getCurrent() != null) {
			panel.setCurrent(null);
			panel.setPoint(0);
		} else {
			panel.setX1(e.getX());
			panel.setY1(e.getY());
			panel.setX2(e.getX());
			panel.setY2(e.getY());
		}
		if (panel.getCurrentConn() != null) {
			panel.setCurrentConn(null);
			panel.setPoint(-1);
		}
		panel.repaint();
	}
}
