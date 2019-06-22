package face;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

class WaysAndLoopsFrame extends JDialog {

    private JTextArea waysArea;
    private JTextArea loopsArea;
    private JButton closeButton;

    public WaysAndLoopsFrame(MainFrame frame, Rectangle bounds, ArrayList<String> ways, ArrayList<String> loops) {
        super(frame);
        setBounds(bounds);
        setResizable(false);
        setModal(true);
        setTitle("Ways And Loops");
        setLayout(new BorderLayout());
        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new GridLayout(2, 1));
        waysArea = new JTextArea();
        waysArea.setEditable(false);
        StringBuilder builder = new StringBuilder();
        if (!ways.isEmpty()) {
            for (int i = 0; i < (ways.size() - 1); i++) {
                builder.append(ways.get(i));
                builder.append("\n");
            }
            builder.append(ways.get(ways.size() - 1));
        }
        waysArea.setText(builder.toString());
        builder = new StringBuilder();
        loopsArea = new JTextArea();
        loopsArea.setEditable(false);
        if (!loops.isEmpty()) {
            for (int i = 0; i < (loops.size() - 1); i++) {
                builder.append(loops.get(i));
                builder.append("\n");
            }
            builder.append(loops.get(loops.size() - 1));
        }
        loopsArea.setText(builder.toString());
        mainPanel.add(new JScrollPane(waysArea));
        mainPanel.add(new JScrollPane(loopsArea));
        closeButton = new JButton(new AbstractAction () {
            public void actionPerformed(ActionEvent e) {
                setVisible(false);
            }
        });
        closeButton.setText("Close");
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(closeButton);
        add(buttonPanel, BorderLayout.SOUTH);
        add(mainPanel);
    }

}
