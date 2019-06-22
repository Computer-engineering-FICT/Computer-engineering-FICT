package com.gui;

import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

/**
 * Клас меню.
 * @author Куцовол Віктор
 */

public class DiagramViewerMenu extends JMenuBar {

    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = 758708546654543876L;

    /**
     * Конструктор.
     *
     * @param frame
     *            посилання на головне вікно програми
     */
    public DiagramViewerMenu(final MainFrame frame) {
        JMenu fileMenu = new JMenu("Файл");
        JMenuItem newFileItem = new JMenuItem(frame.getNewFileAction());
        JMenuItem openInCurrentTabItem = new JMenuItem(frame
                .getOpenInCurrentTabAction());
        JMenuItem openInNewTabItem = new JMenuItem(frame
                .getOpenInNewTabAction());
        JMenuItem closeItem = new JMenuItem(frame.getCloseAction());
        JMenuItem closeAllItem = new JMenuItem(frame.getCloseAllAction());
        JMenuItem saveItem = new JMenuItem(frame.getSaveAction());
        JMenuItem saveAsItem = new JMenuItem(frame.getSaveAsAction());
        JMenuItem exitItem = new JMenuItem(frame.getExitAction());
        fileMenu.add(newFileItem);
        fileMenu.add(openInCurrentTabItem);
        fileMenu.add(openInNewTabItem);
        fileMenu.addSeparator();
        fileMenu.add(closeItem);
        fileMenu.add(closeAllItem);
        fileMenu.addSeparator();
        fileMenu.add(saveItem);
        fileMenu.add(saveAsItem);
        fileMenu.addSeparator();
        fileMenu.add(exitItem);
        add(fileMenu);
        JMenu tableMenu = new JMenu("Таблиця");
        JMenuItem addNewRowBeforeItem = new JMenuItem(frame
                .getAddNewRowBeforeAction());
        JMenuItem addNewRowAfterItem = new JMenuItem(frame
                .getAddNewRowAfterAction());
        JMenuItem removeRowItem = new JMenuItem(frame
                .getRemoveRowAction());
        tableMenu.add(addNewRowBeforeItem);
        tableMenu.add(addNewRowAfterItem);
        tableMenu.add(removeRowItem);
        add(tableMenu);
        JMenu diagramMenu = new JMenu("Діаграма");
        JMenuItem saveDiagramAsImageItem = new JMenuItem(frame
                .getSaveDiagramAsImageAction());
        diagramMenu.add(saveDiagramAsImageItem);
        add(diagramMenu);
        JMenu settingsMenu = new JMenu("Налаштування");
        JMenuItem changeLookAndFeelItem = new JMenuItem(frame
                .getChangeLookAndFeelAction());
        settingsMenu.add(changeLookAndFeelItem);
        JMenuItem changeDelimiterItem =
        	  new JMenuItem(frame.getChangeDelimiterAction());
        	  settingsMenu.add(changeDelimiterItem);
        add(settingsMenu);
    }

}
