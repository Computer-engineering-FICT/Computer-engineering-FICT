package edu.editor.algorithm.controller.listener.key;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

public class AlgorithmKeyListener implements KeyListener {
	private AlgorithmModel model;
	private AlgorithmPanel panel;
	public AlgorithmKeyListener(AlgorithmModel model, AlgorithmPanel panel) {
		this.model = model;
		this.panel = panel;
	}
	@Override
	public void keyPressed(KeyEvent e) {
				switch (e.getKeyCode()) {
		case KeyEvent.VK_DELETE:
			System.out.println("!!!!!IN DELETE!!!!!!!");
			model.removeSelected();
			model.changedPanel(panel);
			break;
		case KeyEvent.VK_C:
			if (e.getModifiers() == KeyEvent.CTRL_MASK) {
				model.copySelected();
			}
			break;
		case KeyEvent.VK_V:
			if (e.getModifiers() == KeyEvent.CTRL_MASK) {
				model.pasteSelected();
			}
			break;
		case KeyEvent.VK_X:
			if (e.getModifiers() == KeyEvent.CTRL_MASK) {
				model.cutSelected();
			}
			break;
		case KeyEvent.VK_A:
			if (e.getModifiers() == KeyEvent.CTRL_MASK) {
				model.selectAll();
			}
			break;
		default:
			break;
		}		
	}

	@Override
	public void keyReleased(KeyEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void keyTyped(KeyEvent e) {
		// TODO Auto-generated method stub
		
	}

    public void setModel(AlgorithmModel model) {
        this.model = model;
    }

    public void setPanel(AlgorithmPanel panel) {
        this.panel = panel;
    }
}
