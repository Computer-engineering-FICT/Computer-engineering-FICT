package com.gui;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;

import com.main.Main;

/**
 * Клас, що виконує зберігання файлу.
 *
 * @author Куцовол Віктор
 */

public class SaveAction extends AbstractAction {

    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = -7405214080191726687L;

    /**
     * Посилання на фрейм.
     */
    private MainFrame frame;

    /**
     * Флаг збереження файлу під іншим іменем.
     */
    private boolean saveAsFlag;

    /**
     * Діалог збереження файлу.
     */
    private JFileChooser jfc;

    /**
     * Конструктор.
     *
     * @param fr
     *            посилання на фрейм
     * @param name
     *            назва дії
     * @param saveAs
     *            флаг збереження файлу під іншим іменем.
     */
    public SaveAction(final MainFrame fr, final String name,
            final boolean saveAs) {
        frame = fr;
        putValue(Action.NAME, name);
        putValue(Action.SHORT_DESCRIPTION, name);
        if (saveAs) {
            putValue(SMALL_ICON, new ImageIcon(Main.class.
                    getResource("img/filesaveas.png")));
        } else {
            putValue(SMALL_ICON, new ImageIcon(Main.class.
                    getResource("img/filesave.png")));
        }
        setEnabled(false);
        saveAsFlag = saveAs;
        jfc = new JFileChooser();
        jfc.setFileFilter(new CSVFileFilter());
    }

    /**
     * Виконується при виникненні події.
     *
     * @param e
     *            подія
     */
    public final void actionPerformed(final ActionEvent e) {
        DiagramModel model = frame.getCurrentModel();
        if (model != null) {
            if (saveAsFlag) {
                int result = jfc.showSaveDialog(frame);
                if (result == JFileChooser.APPROVE_OPTION) {
                    model.save(jfc.getSelectedFile());
                    frame.getJtp().setTitleAt(
                            frame.getJtp().getSelectedIndex(),
                            jfc.getSelectedFile().getName());
                }
            } else {
                model.save(model.getFile());
            }
        }
    }

}
