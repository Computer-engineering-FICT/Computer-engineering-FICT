package redactor.gui.dialogs;


import redactor.gui.graphicalElements.Entity;

import javax.swing.*;
import javax.swing.table.TableModel;
import java.util.List;


public class ErrorsDialog extends JDialog {

	public ErrorsDialog(final JFrame owner, List<Entity> allEntities) {
		super(owner, "Errors found", false);

		setSize(490, 360);
		setLocation(owner.getX() + (owner.getWidth() - getWidth())/2,
				owner.getY() + (owner.getHeight() - getHeight())/2);
		TableModel model = new ErrorsTableModel(allEntities);
		JTable table = new JTable(model);
		Box panel = Box.createVerticalBox();
		setContentPane(panel);
		panel.add(new JScrollPane(table,
				ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED,
				ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED));
	}
}
