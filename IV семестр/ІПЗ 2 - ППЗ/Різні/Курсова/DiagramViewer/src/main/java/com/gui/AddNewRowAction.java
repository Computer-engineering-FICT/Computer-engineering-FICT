package com.gui;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.Action;

/**
 * Клас, що виконує додавання нового рядка.
 *
 * @author Куцовол Віктор
 */

public class AddNewRowAction extends AbstractAction {
    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = -4674346199290499316L;

    /**
     * Посилання на фрейм.
     */
    private MainFrame frame;

    /**
     * Ознака додавання після позиції рядка.
     */
    private boolean afterFlag;

    /**
     * Конструктор.
     *
     * @param fr
     *            посилання на фрейм
     * @param name
     *            назва дії
     * @param after
     *            ознака додавання після позиції рядка
     */
    public AddNewRowAction(final MainFrame fr, final String name,
            final boolean after) {
        frame = fr;
        putValue(Action.NAME, name);
        afterFlag = after;
        setEnabled(false);
    }

    /**
     * Виконується при виникненні події.
     *
     * @param e
     *            подія
     */
    public final void actionPerformed(final ActionEvent e) {
        DiagramModel model = frame.getCurrentModel();
        int index = frame.getTablePanel().getTable().getSelectedRow();
        if (index == -1) {
            index = model.getDiagramDrawer().getCurrentSector();
        }
        if (model != null && index != -1) {
            frame.getCurrentModel().addNewRow(index, afterFlag);
            model.doChange("add");
            if (model.getTable()[0].length == 1) {
                frame.getRemoveRowAction().setEnabled(false);
            } else {
                frame.getRemoveRowAction().setEnabled(true);
            }
        }
    }

}
