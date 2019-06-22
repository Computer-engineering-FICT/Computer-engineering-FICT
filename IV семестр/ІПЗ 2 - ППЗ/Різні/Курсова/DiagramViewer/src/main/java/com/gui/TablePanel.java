package com.gui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Point;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.AbstractTableModel;

/**
 * @author Куцовол Віктор
 *
 */

public class TablePanel extends JPanel implements Observer {

    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = 3064626846380266571L;

    /**
     * Таблиця.
     */
    private JTable table;

    /**
     * Модель діаграми.
     */
    private DiagramModel model;

    /**
     * Заголовок таблиці.
     */
    private String[] headings;

    /**
     * Контекстне меню. Викликається при натисненні правою кнопки миші.
     */
    private JPopupMenu jpu;

    /**
     * Посилання на фрейм.
     */
    private MainFrame frame;

    /**
     * Конструктор.
     *
     * @param fr
     *            посилання на фрейм
     */
    public TablePanel(final MainFrame fr) {
        frame = fr;
        setModel(frame.getCurrentModel());
    }

    /**
     * Встановлює модель діаграми.
     *
     * @param m
     *            модель діаграми
     */
    @SuppressWarnings("serial")
    public final void setModel(final DiagramModel m) {
        model = m;
        setLayout(new BorderLayout());
        removeAll();
        if (model != null) {
            headings = new String[] {"Назва", "Значення"};

            AbstractTableModel tm = new AbstractTableModel() {
                public Object getValueAt(final int rowIndex,
                        final int columnIndex) {
                    return model.getTable()[columnIndex][rowIndex];
                }

                public void setValueAt(final Object aValue, final int rowIndex,
                        final int columnIndex) {
                    try {
                        if (columnIndex > 0) {
                            Double.valueOf((String) (aValue));
                        }
                        model.getTable()[columnIndex][rowIndex] = aValue;
                        fireTableDataChanged();
                    } catch (NumberFormatException e) {
                        System.out.println("Помилкові дані.");
                        JOptionPane.showOptionDialog(frame, "Помилкові дані",
                                "Помилка", JOptionPane.CLOSED_OPTION,
                                JOptionPane.ERROR_MESSAGE, null, null, null);
                    }
                }

                public int getRowCount() {
                    return model.getTable()[0].length;
                }

                public int getColumnCount() {
                    return model.getTable().length;
                }

                public String getColumnName(final int column) {
                    return headings[column];
                }

                public boolean isCellEditable(final int rowIndex,
                        final int columnIndex) {
                    return true;
                }
            };
            tm.addTableModelListener(new TableModelListener() {
                public void tableChanged(final TableModelEvent e) {
                    model.doChange("");
                }
            });
            jpu = new JPopupMenu();
            jpu.add(new JMenuItem(frame.getAddNewRowBeforeAction()));
            jpu.add(new JMenuItem(frame.getAddNewRowAfterAction()));
            jpu.add(new JMenuItem(frame.getRemoveRowAction()));
            table = new JTable(tm);
            table.addMouseListener(new MouseAdapter() {
                public void mousePressed(final MouseEvent e) {
                    if (e.getButton() == MouseEvent.BUTTON3) {
                        Point point = e.getPoint();
                        int column = table.columnAtPoint(point);
                        int row = table.rowAtPoint(point);
                        if (column != -1 && row != -1) {
                            table.setColumnSelectionInterval(column, column);
                            table.setRowSelectionInterval(row, row);
                        }
                    }
                    if (e.isPopupTrigger()) {
                        jpu.show(e.getComponent(), e.getX(), e.getY());
                    }
                }

                public void mouseReleased(final MouseEvent e) {
                    if (e.isPopupTrigger()) {
                        jpu.show(e.getComponent(), e.getX(), e.getY());
                    }
                }
            });

            table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
            table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
            JScrollPane jsp = new JScrollPane(table);
            add(jsp, BorderLayout.WEST);
            setPreferredSize(new Dimension(table.getPreferredSize().width,
                    getPreferredSize().height));
        }
        repaint();
    }

    /**
     * Виконується, коли змінюється об'єкт, за яким ведеться нагляд.
     *
     * @param o
     *            об'єкт, за яким ведеться нагляд
     * @param arg
     *            значення, яке пересилається від об'єкта, за яким ведеться
     *            нагляд
     */
    public final void update(final Observable o, final Object arg) {
        if (((String) arg) != "") {
            table.updateUI();
        } else {
            repaint();
        }
    }

    /**
     * Повертає таблицю.
     *
     * @return таблицю
     */
    public final JTable getTable() {
        return table;
    }

}
