package com.gui;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JScrollPane;
import javax.swing.JSplitPane;

import com.main.Main;

/**
 * Клас, що виконує відкриття файлу.
 *
 * @author Куцовол Віктор
 */
public class OpenAction extends AbstractAction {

    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = 484153554180610766L;

    /**
     * Посилання на фрейм.
     */
    private MainFrame frame;

    /**
     * Ознака відкриття у новій вкладці.
     */
    private boolean newTab;

    /**
     * Діалог вибору файлу.
     */
    private JFileChooser jfc;

    /**
     * Конструктор.
     *
     * @param fr
     *            посилання на фрейм
     * @param name
     *            назва дії
     * @param inNewTab
     *            ознака відкриття у новій вкладці
     */
    public OpenAction(final MainFrame fr, final String name,
            final boolean inNewTab) {
        frame = fr;
        putValue(Action.NAME, name);
        putValue(Action.SHORT_DESCRIPTION, name);
        newTab = inNewTab;
        if (inNewTab) {
            setEnabled(false);
            putValue(SMALL_ICON, new ImageIcon(Main.class.
                    getResource("img/tab_new.png")));
        } else {
            putValue(SMALL_ICON, new ImageIcon(Main.class.
                    getResource("img/fileopen.png")));
        }
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
        int result = jfc.showOpenDialog(frame);
        if (result == JFileChooser.APPROVE_OPTION) {
            DiagramModel model = new DiagramModel(jfc.getSelectedFile());
            model.addObserver(frame.getDiagramPanel());
            model.addObserver(frame.getTablePanel());
            JSplitPane jsp = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, true,
                    new JScrollPane(frame.getTablePanel()), frame
                            .getDiagramPanel());
            if (newTab || frame.getJtp().getTabCount() == 0) {
                frame.getModels().add(model);
                frame.getJtp().addTab(jfc.getSelectedFile().getName(), jsp);
                frame.getJtp().setTabComponentAt(
                        frame.getJtp().getTabCount() - 1,
                        new ButtonTabComponent(frame));
                frame.getJtp().setSelectedIndex(
                        frame.getJtp().getTabCount() - 1);
            } else if (frame.getJtp().getTabCount() != 0) {
                frame.getModels().set(frame.getJtp().getSelectedIndex(), model);
                frame.setCurrentModel(frame.getModels().get(
                        frame.getJtp().getSelectedIndex()));
                frame.getDiagramPanel().setModel(frame.getCurrentModel());
                frame.getTablePanel().setModel(frame.getCurrentModel());
                frame.getJtp().setComponentAt(
                        frame.getJtp().getSelectedIndex(), jsp);
                frame.getJtp().setTitleAt(frame.getJtp().getSelectedIndex(),
                        jfc.getSelectedFile().getName());
                if (frame.getCurrentModel().getTable()[0].length == 1) {
                    frame.getRemoveRowAction().setEnabled(false);
                } else {
                    frame.getRemoveRowAction().setEnabled(true);
                }
            }
            frame.getOpenInNewTabAction().setEnabled(true);
            frame.getCloseAction().setEnabled(true);
            frame.getCloseAllAction().setEnabled(true);
            frame.getAddNewRowAfterAction().setEnabled(true);
            frame.getAddNewRowBeforeAction().setEnabled(true);
            frame.getSaveAction().setEnabled(true);
            frame.getSaveAsAction().setEnabled(true);
            frame.getSaveDiagramAsImageAction().setEnabled(true);
        }
    }

}
