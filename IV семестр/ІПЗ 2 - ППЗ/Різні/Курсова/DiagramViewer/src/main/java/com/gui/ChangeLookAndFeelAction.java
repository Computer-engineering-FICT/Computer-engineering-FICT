package com.gui;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.UIManager.LookAndFeelInfo;

import com.main.AppSettings;
import com.main.Main;

/**
 * Клас, що виконує зміну стилю вікна.
 *
 * @author Куцовол Віктор
 */

public class ChangeLookAndFeelAction extends AbstractAction {
    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = -4073474641566445543L;
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
    public ChangeLookAndFeelAction(final MainFrame fr, final String name) {
        frame = fr;
        putValue(Action.NAME, name);
        putValue(Action.SHORT_DESCRIPTION, name);
        putValue(SMALL_ICON, new ImageIcon(Main.class.
                getResource("img/configure.png")));
    }

    /**
     * Виконується при виникненні події.
     *
     * @param e
     *            подія
     */
    public final void actionPerformed(final ActionEvent e) {
        LookAndFeelInfo[] infos = UIManager.getInstalledLookAndFeels();
        String[] styleNames = new String[infos.length];
        String currentStyleName = "";
        for (int i = 0; i < styleNames.length; i++) {
            styleNames[i] = infos[i].getName();
            if (AppSettings.getInstance().get("LookAndFeel").equals(
                    infos[i].getClassName())) {
                currentStyleName = infos[i].getName();
            }
        }
        String styleName = (String) JOptionPane.showInputDialog(frame,
                "Виберіть стиль: ", "Налаштування стилю",
                JOptionPane.QUESTION_MESSAGE, null, styleNames,
                currentStyleName);
        if (styleName != null) {
            for (int i = 0; i < infos.length; i++) {
                if (styleName.equals(infos[i].getName())) {
                    try {
                        UIManager.setLookAndFeel(infos[1].getClassName());
                        SwingUtilities.updateComponentTreeUI(frame);
                        AppSettings.getInstance().put("LookAndFeel",
                                infos[i].getClassName());
                        AppSettings.getInstance().save();
                    } catch (Exception ex) {
                        System.out.println("Помилка встановлення стилю");
                        JOptionPane.showOptionDialog(frame,
                                "Помилка встановлення стилю", "Помилка",
                                JOptionPane.CLOSED_OPTION,
                                JOptionPane.ERROR_MESSAGE, null, null, null);
                    }
                    break;
                }
            }
        }
    }

}
