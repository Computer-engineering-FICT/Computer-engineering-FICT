package com.gui;

import java.awt.Color;
import java.awt.Component;
import java.awt.Cursor;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Point;
import java.awt.Polygon;
import java.awt.event.MouseEvent;
import java.util.ArrayList;

/**
 * Клас відображувача секторної діаграми.
 *
 * @author Куцовол Віктор
 */
public class SectorDiagramDrawer implements DiagramDrawer {

    /**
     * Список кольорів секторів.
     */
    private ArrayList<Color> colors = new ArrayList<Color>();

    /**
     * Радіус діаграми.
     */
    private double r;

    /**
     * Величина, на яку збільшується радіус сектора при його виділенні.
     */
    private double h;

    /**
     * Таблиця значень.
     */
    private Object[][] table;

    /**
     * Частини секторів.
     */
    private Polygon[][] polygons;

    /**
     * Поточний сектор.
     */
    private int currentSector;

    /**
     * Крок малювання.
     */
    private double step;

    /**
     * Координата x центра діаграми.
     */
    private double cX;

    /**
     * Координата y центра діаграми.
     */
    private double cY;

    /**
     * Коефіцієнт а еліпса.
     */
    private double a;

    /**
     * Коефіцієнт b еліпса.
     */
    private double b;

    /**
     * Старе значення координати Y.
     */
    private int oldY;

    /**
     * Повертає таблицю значень.
     *
     * @return таблиця значень.
     */
    public final Object[][] getTable() {
        return table;
    }

    /**
     * Встановлює таблицю значень.
     *
     * @param t
     *            таблиця значень
     */
    public final void setTable(final Object[][] t) {
        table = t;
        colors.clear();
        createColors();
    }

    /**
     * Встановлює таблицю значень та список кольорів секторів.
     *
     * @param t
     *            таблиця значень
     * @param newColors
     *            список кольорів секторів
     */
    public final void setTable(final Object[][] t,
            final ArrayList<Color> newColors) {
        table = t;
        colors = newColors;
    }

    /**
     * Повертає крок малювання.
     *
     * @return крок малювання
     */
    public final double getStep() {
        return step;
    }

    /**
     * Встановлює крок малювання.
     *
     * @param s
     *            крок малювання
     */
    public final void setStep(final double s) {
        step = s;
    }

    /**
     * Повертає коефіцієнт а еліпса.
     *
     * @return коефіцієнт а еліпса
     */
    public final double getA() {
        return a;
    }

    /**
     * Встановлює коефіцієнт а еліпса.
     *
     * @param newA
     *            коефіцієнт а еліпса
     */
    public final void setA(final double newA) {
        a = newA;
    }

    /**
     * Повертає коефіцієнт b еліпса.
     *
     * @return коефіцієнт b еліпса
     */
    public final double getB() {
        return b;
    }

    /**
     * Встановлює коефіцієнт b еліпса.
     *
     * @param newB
     *            коефіцієнт b еліпса
     */
    public final void setB(final double newB) {
        b = newB;
    }

    /**
     * Встановлює колір сектору за його індексом.
     *
     * @param index
     *            індекс сектору
     * @param color
     *            колір сектору
     */
    public final void setColor(final int index, final Color color) {
        colors.set(index, color);
    }

    /**
     * Повертає колір сектору за його індексом.
     *
     * @param index
     *            індекс сектору
     * @return колір сектору
     */
    public final Color getColor(final int index) {
        return colors.get(index);
    }

    /**
     * Додає колір сектору.
     *
     * @param index
     *            індекс сектру
     */
    public final void addColor(final int index) {
        Color[] colorsName = {Color.BLUE, Color.MAGENTA, Color.ORANGE,
                Color.PINK, Color.YELLOW, Color.GREEN, Color.RED, Color.CYAN};
        colors.add(index, colorsName[index % (colorsName.length - 1)]);
    }

    /**
     * Видаляє колір сектору.
     *
     * @param index
     *            індекс сектру
     */
    public final void removeColor(final int index) {
        colors.remove(index);
    }

    /**
     * Повертає полігон сектора.
     *
     * @param begin
     *            початок сектора
     * @param end
     *            кінець сектора
     * @param disp
     *            зміщення
     * @return полігон частини сектора
     */
    private Polygon getSector(final double begin, final double end,
            final double disp) {
        Polygon sector = new Polygon();
        for (int i = (int) Math.round((end - begin) / step); i >= 0; i--) {
            sector.addPoint((int) Math.round(cX + Math.cos(begin + i * step)
                    * a * (r + disp)), (int) Math.round(cY
                    + Math.sin(begin + i * step) * b * (r + disp)));
        }
        for (int i = 0; i <= Math.round((end - begin) / step); i++) {
            sector.addPoint((int) Math.round(cX), (int) Math.round(cY));
        }
        return sector;
    }

    /**
     * Конструктор.
     *
     * @param t
     *            таблиця значень
     */
    public SectorDiagramDrawer(final Object[][] t) {
        final double fH = 10;
        final double fStep = 0.005;
        final double fA = 1;
        final double fB = 1;
        h = fH;
        step = fStep;
        a = fA;
        b = fB;
        table = t;
        currentSector = -1;
        createColors();
    }

    /**
     * Генерує список кольорів секторів.
     */
    private void createColors() {
        Color[] colorsName = {Color.BLUE, Color.MAGENTA, Color.ORANGE,
                Color.PINK, Color.YELLOW, Color.GREEN, Color.RED, Color.CYAN};
        for (int i = colors.size(); i < table[0].length; i++) {
            colors.add(colorsName[i % (colorsName.length - 1)]);
        }
    }

    /**
     * Малює діаграму використовуючи даний графічний контекст.
     *
     * @param g
     *            графічний контекст
     */
    public final void draw(final Graphics g) {
        final double size = 0.9;
        final int shiftX = 5;
        final int shiftY = 3;
        final int percent = 100;
        final int polygonCount = 1;

        cX = g.getClipBounds().getCenterX();
        cY = g.getClipBounds().getCenterY();
        if (cX < cY) {
            r = size * cX;
        } else {
            r = size * cY;
        }

        int x, y;
        FontMetrics fm = g.getFontMetrics();
        double s = 0;
        double disp;
        String label;
        double angle = 2 * Math.PI;
        double offset;
        Color color;
        polygons = new Polygon[polygonCount][table[1].length];

        for (int i = 0; i < table[1].length; i++) {
            s += Double.valueOf((String) table[1][i]);
        }

        for (int i = 0; i < table[1].length; i++) {
            if (s == 0) {
                offset = 2 * Math.PI / table[1].length;
            } else {
                offset = 2 * Math.PI * Double.valueOf((String) table[1][i]) / s;
            }

            if (i == currentSector) {
                disp = h;
            } else {
                disp = 0;
            }
            polygons[0][i] = getSector(angle - offset, angle, disp);
            angle -= offset;
        }

        /**
         * Малювання секторів
         */
        for (int i = 0; i < polygons[0].length; i++) {
            color = colors.get(i);
            g.setColor(color);
            g.fillPolygon(polygons[polygonCount - 1][i]);
            if (currentSector == i) {
                g.setColor(Color.BLACK);
            } else {
                g.setColor(color.darker().darker());
            }
            g.drawPolygon(polygons[polygonCount - 1][i]);
        }

        /**
         * Підпис секторів
         */
        for (int i = 0; i < table[1].length; i++) {
            label = table[0][i]
                    + " "
                    + Math.round(Double.valueOf((String) table[1][i]) / s
                            * percent) + "%";
            x = (int) (polygons[polygonCount - 1][i].getBounds().getCenterX()
                    - fm.stringWidth(label) / 2);
            y = (int) polygons[polygonCount - 1][i].getBounds().getCenterY();
            g.setColor(Color.WHITE);
            g.fillRect(x - shiftX, y - fm.getHeight() + shiftY, fm
                    .stringWidth(label)
                    + shiftX, fm.getHeight() + shiftY);
            g.setColor(Color.GRAY);
            g.drawRect(x - shiftX, y - fm.getHeight() + shiftY, fm
                    .stringWidth(label)
                    + shiftX, fm.getHeight() + shiftY);
            g.setColor(Color.BLACK);
            g.drawString(label, x, y);
        }
    }

    /**
     * Повертає номер сектору, в який входить дана точка.
     *
     * @param p
     *            дана точка
     * @return номер сектору
     */
    private int find(final Point p) {
        for (int i = 0; i < polygons.length; i++) {
            for (int j = 0; j < polygons[i].length; j++) {
                if (polygons[i][j].contains(p)) {
                    return j;
                }
            }
        }
        return -1;
    }

    /**
     * Виконується при русі миші.
     *
     * @param event
     *            подія миші
     */
    public final void mouseMoved(final MouseEvent event) {
        Component comp = (Component) event.getSource();
        if (find(event.getPoint()) != -1) {
            comp.setCursor(new Cursor(Cursor.HAND_CURSOR));
        } else {
            comp.setCursor(Cursor.getDefaultCursor());
        }
        currentSector = find(event.getPoint());
        oldY = event.getY();
    }

    /**
     * Виконується при одночасному натисканні та русі миші.
     *
     * @param event
     *            подія миші
     */
    public final void mouseDragged(final MouseEvent event) {
        final int percent = 200;
        double s = 0;
        Component comp = (Component) event.getSource();
        if (currentSector != -1) {
            comp.setCursor(new Cursor(Cursor.N_RESIZE_CURSOR));
            if (event.getY() - oldY != 0) {
                for (int i = 0; i < table[1].length; i++) {
                    s += Double.valueOf((String) table[1][i]);
                }
            }
            if (s == 0 && event.getY() - oldY != 0) {
                s = 1;
            } else {
                s = s / percent;
            }
            if (event.getY() - oldY < 0) {
                s = -s;
            }
            if (Double.valueOf((String) table[1][currentSector]) + s >= 0) {
                table[1][currentSector] = String.valueOf(s
                        + Double.valueOf((String) table[1][currentSector]));
            }
            oldY = event.getY();
        }
    }

    /**
     * Повертає поточний сектор.
     *
     * @return the currentSector поточний сектор
     */
    public final int getCurrentSector() {
        return currentSector;
    }

}
