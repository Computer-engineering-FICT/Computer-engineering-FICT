import face.MainFrame;

import javax.swing.*;
import java.awt.*;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 26.12.10
 * Time: 16:33
 * To change this template use File | Settings | File Templates.
 */
public class Program {

    public static Rectangle getDefaultBounds() {
        Toolkit toolkit = Toolkit.getDefaultToolkit();
        Dimension screenSize = toolkit.getScreenSize();
        Rectangle bounds = new Rectangle((int) screenSize.getWidth() / 12, (int) screenSize.getHeight() / 12,
                (int) screenSize.getWidth() / 12 * 10, (int) screenSize.getHeight() / 12 * 10);
        return bounds;
    }

    public static void main(String[] args) {
        if (System.getProperty("os.name").toLowerCase().contains("windows")) {
            try {
                UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
            } catch (ClassNotFoundException e) {
            } catch (InstantiationException e) {
            } catch (IllegalAccessException e) {
            } catch (UnsupportedLookAndFeelException e) {
            }
        }
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                MainFrame frame = new MainFrame(Program.getDefaultBounds());
                frame.setVisible(true);
            }
        });
    }

}
