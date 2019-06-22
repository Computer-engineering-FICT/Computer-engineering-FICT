package kursach;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.AbstractAction;
import java.awt.event.ActionEvent;
import javax.swing.BoxLayout;
import javax.swing.border.EmptyBorder;
import javax.swing.Box;

public class EmptyDialog extends JDialog {
    protected JButton ok;
    protected JButton cancel;

    public EmptyDialog(JFrame owner) {
        super(owner);
        getContentPane().setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));
        getContentPane().add(initControlsPanel());
        getContentPane().add(initButtonsPanel());
    }

    protected JPanel initControlsPanel() {
        return new JPanel();
    }

    private JPanel initButtonsPanel() {
        JPanel panel = new JPanel();
        panel.setLayout(new BoxLayout(panel, BoxLayout.X_AXIS));
        panel.setAlignmentX(LEFT_ALIGNMENT);
        panel.setBorder(new EmptyBorder(5,5,5,5));
        panel.add(Box.createHorizontalGlue());
        ok = new JButton(new ApproveAction());
        cancel = new JButton(new CancelAction());
        panel.add(ok);
        panel.add(Box.createHorizontalStrut(3));
        panel.add(cancel);
        return panel;
    }

    protected void approve() {

    }

    protected void cancel() {

    }

    class ApproveAction extends AbstractAction {
        public ApproveAction() {
            putValue(NAME, "OK");
        }

        public void actionPerformed(ActionEvent e) {
            approve();
        }
    }
    class CancelAction extends AbstractAction {
        public CancelAction() {
            putValue(NAME, "Cancel");
        }

        public void actionPerformed(ActionEvent e) {
            cancel();
        }
    }
}
