package redactor.gui.dialogs;

import redactor.gui.graphicalElements.Entity;

import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.TableModel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;


class ErrorsTableModel implements TableModel {

	private List<Entity> allEntities;
	private List<Entity> errorsFound;

	private List<TableModelListener> listeners;

	ErrorsTableModel(List<Entity> allEntities) {
		this.allEntities = allEntities;
		listeners = new LinkedList<TableModelListener>();
		errorsFound = new ArrayList<Entity>(allEntities.size());
		refresh();
	}

	@Override
	public int getRowCount() {
		return errorsFound.size();
	}

	@Override
	public int getColumnCount() {
		return 2;
	}

	@Override
	public String getColumnName(int i) {
		return i == 0 ? "Vertex" : "Errors found";
	}

	@Override
	public Class<?> getColumnClass(int i) {
		return String.class;
	}

	@Override
	public boolean isCellEditable(int i, int i1) {
		return false;
	}

	@Override
	public Object getValueAt(int row, int column) {
		Entity entity = errorsFound.get(row);
		if (column == 0) {
			if ("Begin".equals(entity.getName()) || "End".equals(entity.getName()))
				return entity.getName();
			if ("OperationalVertex".equals(entity.getName()))
				return "P" + entity.getNumber();
			return "C" + entity.getNumber();
		}
		return entity.getErrors();
	}

	@Override
	public void setValueAt(Object o, int i, int i1) {
	}

	@Override
	public void addTableModelListener(TableModelListener tableModelListener) {
		listeners.add(tableModelListener);
	}

	@Override
	public void removeTableModelListener(TableModelListener tableModelListener) {
		listeners.remove(tableModelListener);
	}

	void refresh() {
		int errorsNumber = errorsFound.size();
		errorsFound.clear();
		for (Entity entity : allEntities) {
			if (entity.hasErrors()) {
				errorsFound.add(entity);
			}
		}
		Collections.sort(errorsFound, new EntityComparator());
		if (errorsNumber > 0) {
			TableModelEvent removedEvent = new TableModelEvent(this, 0, errorsNumber-1, TableModelEvent.ALL_COLUMNS, TableModelEvent.DELETE);
			for (TableModelListener listener : listeners) {
				listener.tableChanged(removedEvent);
			}
		}
		if (errorsFound.isEmpty())
			return;
		TableModelEvent addedEvent = new TableModelEvent(this, 0, errorsFound.size()-1, TableModelEvent.ALL_COLUMNS, TableModelEvent.INSERT);
		for (TableModelListener listener : listeners) {
			listener.tableChanged(addedEvent);
		}

	}
}
