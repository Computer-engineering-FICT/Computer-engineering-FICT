package edu.editor.algorithm.controller.listener;

import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionListener;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

public class ConnectionMouseMotionListener implements MouseMotionListener {
	private AlgorithmPanel panel;
	private int x1, y1, x2, y2;
	
	
	public ConnectionMouseMotionListener(AlgorithmPanel panel, AlgorithmModel model) {
		this.panel = panel;
	}

	@Override
	public void mouseMoved(MouseEvent e) {
		if (panel.getCurrent() != null) {
			panel.setX1(e.getX());
			panel.setY1(e.getY());
			panel.setX2(e.getX());
			panel.setY2(e.getY());
		}
		if (panel.isConnectionMod()) {
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
			
			panel.getConnArrayX()[panel.getConnArrayX().length - 1] = x2 / AlgorithmPanel.widthCell * AlgorithmPanel.widthCell;
			panel.getConnArrayY()[panel.getConnArrayY().length - 1] = y2 / AlgorithmPanel.heightCell * AlgorithmPanel.heightCell;
			if (x2 - panel.getConnArrayX()[panel.getConnArrayX().length - 1] >= AlgorithmPanel.widthCell / 2) {
				panel.getConnArrayX()[panel.getConnArrayX().length - 1] += AlgorithmPanel.widthCell / 2;
			}
			if (y2 - panel.getConnArrayY()[panel.getConnArrayY().length - 1] >= AlgorithmPanel.heightCell / 2) {
				panel.getConnArrayY()[panel.getConnArrayY().length - 1] += AlgorithmPanel.heightCell / 2;
			}
		}
		panel.repaint();
	}

	@Override
	public void mouseDragged(MouseEvent e) {
		
	}
}
