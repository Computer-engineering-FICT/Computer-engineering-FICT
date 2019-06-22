package edu.editor.algorithm.controller.listener.mouse;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.block.BeginActivity;
import edu.editor.algorithm.model.component.block.End;
import edu.editor.algorithm.model.component.block.EndActivity;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.Serializable;

/**
 * Created by dtv on 07.01.2015.
 */
public class EndActivityMouseListener extends BlockMouseListener implements Serializable {

    public EndActivityMouseListener(AlgorithmPanel panel) {
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
                        model.addComponent(new EndActivity(e.getX(), e.getY()));
                    } else {
                        model.setSelected(e.getX(), e.getY());
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
