package os.lab3;

import javax.swing.*;

public class ProgramStart {

    public static void main(String[] args) {
        if (System.getProperty("os.name").contains("Windows")) {
            try {
                UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
            } catch (ClassNotFoundException e) {
            } catch (InstantiationException e) {
            } catch (IllegalAccessException e) {
            } catch (UnsupportedLookAndFeelException e) {}
        }
        MainFrame frame = new MainFrame();
        frame.setVisible(true);
    }

}
