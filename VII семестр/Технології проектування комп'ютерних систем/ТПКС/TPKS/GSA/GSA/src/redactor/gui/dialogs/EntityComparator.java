package redactor.gui.dialogs;

import redactor.gui.graphicalElements.Entity;

import java.util.Comparator;

/**
 *
 */
class EntityComparator implements Comparator<Entity> {

	private static final String[] typesOrder = new String[] {
			"Begin", "OperationalVertex", "Condition", "End"
	};

	@Override
	public int compare(Entity first, Entity second) {
		if (first.getName().equals(second.getName()))
			return first.getNumber() - second.getNumber();
		int typeIndex1 =0;
		return getTypeOrder(first.getName()) - getTypeOrder(second.getName());
	}

	private int getTypeOrder(String type) {
		for (int i=0; i<typesOrder.length; i++) {
			if (typesOrder[i].equals(type)) {
				return i;
			}
		}
		return -1;
	}
}
