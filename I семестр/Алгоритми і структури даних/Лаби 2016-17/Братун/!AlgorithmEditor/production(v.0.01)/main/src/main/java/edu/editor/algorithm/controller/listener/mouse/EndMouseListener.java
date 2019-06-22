package edu.editor.algorithm.controller.listener.mouse;

import java.awt.event.MouseEvent;

import javax.swing.JOptionPane;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.block.End;
import edu.editor.algorithm.model.component.block.EndMethod;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

public class EndMouseListener extends BlockMouseListener {
	/**
	 * 
	 */
	private static final long serialVersionUID = -478937959068575184L;

	public EndMouseListener(AlgorithmPanel panel) {
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
						if (!isEndBlock()) {
							model.addComponent(new End(e.getX(), e.getY()));
						} else {
							JOptionPane.showMessageDialog(null, "End block is exist.", "Error operation", JOptionPane.ERROR_MESSAGE);
						}
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

	private boolean isEndBlock() {
		AlgorithmModel model = panel.getModel();
		for (int i = 0; i < model.getComponents().size(); i++) {
			if (model.getComponents().get(i) instanceof End &&
					!(model.getComponents().get(i) instanceof EndMethod)) {
				return true;
			}
		}
		return false;
	}
}
