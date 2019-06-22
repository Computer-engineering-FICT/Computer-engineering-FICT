package redactor.gui.dialogs;

import javax.swing.*;
import javax.swing.table.TableModel;

/**
 * Shows msa based on current gsa
 */
public class MsaDialog extends JDialog {

    public MsaDialog(final JFrame owner, final String[][] matrix) {
        super(owner, "MSA for algorithm", false);
        setSize(10 + 80*matrix.length, 64 + 20*matrix[0].length);
        setLocation(owner.getX() + (owner.getWidth() - getWidth())/2,
                owner.getY() + (owner.getHeight() - getHeight())/2);
        TableModel model = new MsaModel(matrix);
        JTable table = new JTable(model);
        Box panel = Box.createVerticalBox();
        setContentPane(panel);
        panel.add(new JScrollPane(table,
		        ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED,
		        ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED));
/*
        JButton closeButton = new JButton("Close");
        panel.add(closeButton);
        getRootPane().setDefaultButton(closeButton);
*/
        setModal(false);
    }

}
