package edu.editor.algorithm.controller.listener.mouse;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.block.ClassBlock;
//import edu.editor.algorithm.model.component.block.Operator;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

import java.awt.event.MouseEvent;

public class ClassMouseListener extends BlockMouseListener {
	/**
	 *
	 */
	private static final long serialVersionUID = -4666350146086219847L;

	public ClassMouseListener(AlgorithmPanel panel) {
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
						model.addComponent(new ClassBlock(e.getX(), e.getY()));
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
