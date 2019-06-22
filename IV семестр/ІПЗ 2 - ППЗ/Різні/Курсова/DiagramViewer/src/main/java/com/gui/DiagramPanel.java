package com.gui;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionListener;
import java.util.Observable;
import java.util.Observer;

import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.JColorChooser;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;

/**
 * Клас панелі діаграми.
 *
 * @author Куцовол Віктор
 */

public class DiagramPanel extends JPanel implements Observer {
    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = 4025340017415526188L;
    /**
     * Модель діаграми.
     */
    private DiagramModel model;

    /**
     * Контекстне меню.
     */
    private JPopupMenu jpu;

    /**
     * Конструктор.
     *
     * @param fr
     *            посилання на фрейм
     */
    public DiagramPanel(final MainFrame fr) {
        setBackground(Color.WHITE);
        setModel(fr.getCurrentModel());
        addMouseMotionListener(new MouseMotionHandler());
        jpu = new JPopupMenu();
        jpu.add(new JMenuItem(new ChangeColor()));
        jpu.add(new JMenuItem(fr.getAddNewRowBeforeAction()));
        jpu.add(new JMenuItem(fr.getAddNewRowAfterAction()));
        jpu.add(new JMenuItem(fr.getRemoveRowAction()));
        addMouseListener(new MouseAdapter() {
            public void mousePressed(final MouseEvent e) {
                if (model != null && model.getDiagramDrawer() != null
                        && model.getDiagramDrawer().getCurrentSector() != -1) {
                    if (e.isPopupTrigger()) {
                        jpu.show(e.getComponent(), e.getX(), e.getY());
                    }
                }
                repaint();
            }

            public void mouseReleased(final MouseEvent e) {
                if (model != null && model.getDiagramDrawer() != null
                        && model.getDiagramDrawer().getCurrentSector() != -1) {
                    if (e.isPopupTrigger()) {
                        jpu.show(e.getComponent(), e.getX(), e.getY());
                    }
                }
                repaint();
            }
        });
    }

    /**
     * Встановлює модель діаграми.
     *
     * @param m
     *            модель діаграми
     */
    public final void setModel(final DiagramModel m) {
        model = m;
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
        repaint();
    }

    /**
     * Виконується при відображенні.
     *
     * @param g
     *            графічний контекст
     */
    protected final void paintComponent(final Graphics g) {
        g.setClip(g.getClipBounds().x, g.getClipBounds().y, getWidth()
                - getInsets().left - getInsets().right, getHeight()
                - getInsets().top - getInsets().bottom);
        super.paintComponent(g);
        if (model != null && model.getDiagramDrawer() != null) {
            model.getDiagramDrawer().draw(g);
        }
    }

    /**
     * Клас оброблювача подій миші.
     *
     * @author Куцовол Віктор
     */
    private class MouseMotionHandler implements MouseMotionListener {

        /**
         * Виконується при одночасному натисканні та русі миші.
         *
         * @param e
         *            подія миші
         */
        public void mouseDragged(final MouseEvent e) {
            if (model != null && model.getDiagramDrawer() != null) {
                model.getDiagramDrawer().mouseDragged(e);
                model.doChange("");
            }
        }

        /**
         * Виконується при русі миші.
         *
         * @param e
         *            подія миші
         */
        public void mouseMoved(final MouseEvent e) {
            if (model != null && model.getDiagramDrawer() != null) {
                model.getDiagramDrawer().mouseMoved(e);
                repaint();
            }
        }
    }

    /**
     * Клас, що виконує закриття файлу.
     *
     * @author Куцовол Віктор
     */
    @SuppressWarnings("serial")
    private class ChangeColor extends AbstractAction {

        /**
         * Конструктор.
         */
        public ChangeColor() {
            putValue(Action.NAME, "Змінити колір...");
        }

        /**
         * Виконується при виникненні події.
         *
         * @param e
         *            подія
         */
        public final void actionPerformed(final ActionEvent e) {
            int index = model.getDiagramDrawer().getCurrentSector();
            if (index != -1) {
                Color color = model.getDiagramDrawer().getColor(index);
                color = JColorChooser.showDialog(null,
                        "Вибір кольору сектора: \""
                                + model.getTable()[0][index] + "\"", color);
                if (color != null) {
                    model.getDiagramDrawer().setColor(index, color);
                }
            }
            repaint();
        }
    }

}
