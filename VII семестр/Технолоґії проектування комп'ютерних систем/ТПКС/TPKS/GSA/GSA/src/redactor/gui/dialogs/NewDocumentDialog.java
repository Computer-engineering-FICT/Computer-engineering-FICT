package redactor.gui.dialogs;

import redactor.Mediator;
import redactor.Message;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Builds NewFile dialog.
 */

public class NewDocumentDialog extends JDialog {
    private JTextField width, heigth;
    private Mediator mediator;
    private JFrame owner;
    public JPanel mypanel;

    public int getWidthValue() {
    	return Integer.valueOf(width.getText());
    }
    public int getHeightValue() {
    	return Integer.valueOf(heigth.getText());
    }
	public void update() {
    	int x = owner.getX() + owner.getWidth() / 2 - 75;
        int y = owner.getY() + owner.getHeight() / 2 - 70;
        setLocation(x, y);
        setSize(150, 140);
        width.setText("1200");
        heigth.setText("700");
    }

    /**
     * Constructor builds and shows NewFile dialog
     * @param owner link to parental frame
     */
    public NewDocumentDialog(final JFrame owner, final Mediator mediator) {
        super(owner, "New Document", false);
        this.mediator = mediator;
        this.owner = owner;
        mypanel = new JPanel();
        mypanel.setLayout(new GridLayout(2, 2));
        width = new JTextField("", 10);
        heigth = new JTextField("", 10);
        mypanel.add(new JLabel("Width :", JLabel.CENTER));
        mypanel.add(width);
        mypanel.add(new JLabel("Heigth :", JLabel.CENTER));
        mypanel.add(heigth);
        add(mypanel, BorderLayout.CENTER);
        JPanel buttonPanel = new JPanel(new GridLayout(2, 1));
        JButton okButton = new JButton("Ok");
        okButton.addActionListener(new ActionListener() {
            public void actionPerformed(final ActionEvent event) {
            	Message message = new Message(Message.newDocument);
            	mediator.update(message);
            }
        });
        buttonPanel.add(okButton);
        JButton cancelButton = new JButton("Cancel");
        cancelButton.addActionListener(new ActionListener() {
            public void actionPerformed(final ActionEvent event) {
                setVisible(false);
            }
        });
        buttonPanel.add(cancelButton);
        add(buttonPanel, BorderLayout.SOUTH);
	    getRootPane().setDefaultButton(okButton);
        update();
    }

}
