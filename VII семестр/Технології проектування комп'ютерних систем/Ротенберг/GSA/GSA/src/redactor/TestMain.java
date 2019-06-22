package redactor;

import redactor.gui.MainFrame;

import javax.swing.*;

/**
 * Runner of application.
 */
public class TestMain {

    public static final int gridScale = 10;
    public static final int drawScale = 10;

    public static void main(String args[]) {
        MainFrame frame = new MainFrame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
