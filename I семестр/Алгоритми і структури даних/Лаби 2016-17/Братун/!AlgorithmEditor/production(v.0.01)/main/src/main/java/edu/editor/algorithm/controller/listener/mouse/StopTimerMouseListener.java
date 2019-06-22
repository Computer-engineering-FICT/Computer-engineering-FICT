package edu.editor.algorithm.controller.listener.mouse;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.block.StopTimerBlock;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

import javax.swing.*;
import java.awt.event.MouseEvent;

public class StopTimerMouseListener extends BlockMouseListener {
    public StopTimerMouseListener(AlgorithmPanel panel) {
        super(panel);
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        AlgorithmModel model = panel.getModel();
        switch (e.getButton()) {
            case MouseEvent.BUTTON1:
                model.deselectAll();
                if (e.getClickCount() == 1) {
                    if (!model.contains(e.getX(), e.getY())) {
                        if (!doesStopTimerBlockExist()) {
                            model.addComponent(new StopTimerBlock(e.getX(), e.getY()));
                        } else {
                            JOptionPane.showMessageDialog(null, "Stop Timer block exists.", "Error operation",
                                    JOptionPane.ERROR_MESSAGE);
                        }
                    } else {
                        model.setSelected(e.getX(), e.getY());
                    }
                }
                break;
        }
        panel.repaint();
    }

    private boolean doesStopTimerBlockExist() {
        AlgorithmModel model = panel.getModel();
        for (int i = 0; i < model.getComponents().size(); i++) {
            if (model.getComponents().get(i) instanceof StopTimerBlock) {
                return true;
            }
        }
        return false;
    }
}
