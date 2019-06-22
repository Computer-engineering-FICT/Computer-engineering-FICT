package com.gui;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.Action;

/**
 * Клас, що виконує закриття програми.
 *
 * @author Куцовол Віктор
 */

public class ExitAction extends AbstractAction {

    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = -1027877877263188770L;
    /**
     * Посилання на фрейм.
     */
    private MainFrame frame;

    /**
     * Конструктор.
     *
     * @param fr
     *            посилання на фрейм
     * @param name
     *            назва дії
     */
    public ExitAction(final MainFrame fr, final String name) {
        frame = fr;
        putValue(Action.NAME, name);
    }

    /**
     * Виконується при виникненні події.
     *
     * @param e
     *            подія
     */
    public final void actionPerformed(final ActionEvent e) {
        frame.setVisible(false);
        System.exit(0);
    }

}
