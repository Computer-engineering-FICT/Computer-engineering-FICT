package com.gui;

import java.awt.event.ActionEvent;
import java.io.IOException;

import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.JOptionPane;

import com.main.AppSettings;

/**
 * Клас, що виконує зміну відокремлювача CSV файлу.
 *
 * @author Куцовол Віктор
 */

public class ChangeDelimiterAction extends AbstractAction {

    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = -7942099344060457173L;
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
    public ChangeDelimiterAction(final MainFrame fr, final String name) {
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
        String newDel = JOptionPane.showInputDialog(frame,
                "Введіть відокремлювач: ", AppSettings.getInstance().get(
                        "delimiter"));
        if (newDel != null) {
            AppSettings.getInstance().put("delimiter", newDel);
            try {
                AppSettings.getInstance().save();
            } catch (IOException e1) {
                System.out.println("Помилка встановлення відокремлювача");
                JOptionPane.showOptionDialog(frame,
                        "Помилка встановлення відокремлювача", "Помилка",
                        JOptionPane.CLOSED_OPTION, JOptionPane.ERROR_MESSAGE,
                        null, null, null);
            }
        }
    }

}
