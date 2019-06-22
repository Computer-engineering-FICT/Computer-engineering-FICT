package com.gui;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.MouseEvent;
import java.util.ArrayList;

/**
 * Інтерфейс відображувача діаграм.
 *
 * @author Куцовол Віктор
 */
public interface DiagramDrawer {

    /**
     * Повертає таблицю значень.
     *
     * @return таблиця значень.
     */
    Object[][] getTable();

    /**
     * Встановлює таблицю значень.
     *
     * @param t
     *            таблиця значень
     */
    void setTable(final Object[][] t);

    /**
     * Встановлює таблицю значень і список кольорів секторів.
     *
     * @param t
     *            таблиця значень
     * @param newColors
     *            список кольорів секторів
     */
    void setTable(final Object[][] t, final ArrayList<Color> newColors);

    /**
     * Встановлює колір сектору за його індексом.
     *
     * @param index
     *            індекс сектору
     * @param color
     *            колір сектору
     */
    void setColor(final int index, final Color color);

    /**
     * Повертає колір сектору за його індексом.
     *
     * @param index
     *            індекс сектору
     * @return колір сектору
     */
    Color getColor(final int index);

    /**
     * Додає колір сектору.
     *
     * @param index
     *            індекс сектру
     */
    void addColor(final int index);

    /**
     * Видаляє колір сектору.
     *
     * @param index
     *            індекс сектру
     */
    void removeColor(final int index);

    /**
     * Малює діаграму використовуючи даний графічний контекст.
     *
     * @param g
     *            графічний контекст
     */
    void draw(final Graphics g);

    /**
     * Виконується при русі миші.
     *
     * @param event
     *            подія миші
     */
    void mouseMoved(MouseEvent event);

    /**
     * Виконується при одночасному натисканні та русі миші.
     *
     * @param event
     *            подія миші
     */
    void mouseDragged(MouseEvent event);

    /**
     * Повертає поточний сектор.
     *
     * @return the currentSector поточний сектор
     */
    int getCurrentSector();

}
