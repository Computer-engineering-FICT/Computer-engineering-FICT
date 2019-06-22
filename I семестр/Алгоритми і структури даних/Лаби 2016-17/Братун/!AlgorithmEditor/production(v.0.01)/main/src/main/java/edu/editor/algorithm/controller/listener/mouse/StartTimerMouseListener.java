package edu.editor.algorithm.controller.listener.mouse;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.block.Operator;
import edu.editor.algorithm.model.component.block.StartTimerBlock;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

import javax.swing.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

public class StartTimerMouseListener extends BlockMouseListener {
    public StartTimerMouseListener(AlgorithmPanel panel)  {
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
                        if (!doesStartTimerBlockExist()) {
                            model.addComponent(new StartTimerBlock(e.getX(), e.getY()));
                        } else {
                            JOptionPane.showMessageDialog(null, "Start Timer block exists.", "Error operation",
                                    JOptionPane.ERROR_MESSAGE);
                        }
                    } else {
                        model.setSelected(e.getX(), e.getY());
                    }
                }
        }
        panel.repaint();
    }

    private boolean doesStartTimerBlockExist() {
        AlgorithmModel model = panel.getModel();
        for (int i = 0; i < model.getComponents().size(); i++) {
            if (model.getComponents().get(i) instanceof StartTimerBlock) {
                return true;
            }
        }
        return false;
    }
}
