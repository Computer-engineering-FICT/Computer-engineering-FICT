package edu.editor.algorithm.controller.listener.mouse;

import java.awt.event.MouseEvent;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.block.InterfaceBlock;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

public class InterfaceMouseListener extends ClassMouseListener {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4628287972920619621L;

	public InterfaceMouseListener(AlgorithmPanel panel) {
		super(panel);
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
					if (!model.contains(e.getX(), e.getY())) {
						model.addComponent(new InterfaceBlock(e.getX(), e.getY()));
					} else {
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

}
