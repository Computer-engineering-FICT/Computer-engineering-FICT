package com.main;

import javax.swing.JFrame;
import javax.swing.SwingUtilities;

import com.gui.MainFrame;

/**
 * Головний клас.
 *
 * @author Куцовол Віктор
 *
 */
public final class Main {

    /**
     * Конструктор.
     */
    private Main() {
        super();
    }

    /**
     * Виконується при запуску програми.
     *
     * @param args
     *            параметри з командного рядка
     */
    public static void main(final String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                MainFrame frame = new MainFrame();
                frame.setTitle("Diagram Drawer");
                frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                frame.setVisible(true);
            }
        });
    }

}
