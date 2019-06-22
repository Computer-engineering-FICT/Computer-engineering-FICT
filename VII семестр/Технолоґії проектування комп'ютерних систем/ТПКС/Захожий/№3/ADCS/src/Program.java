import face.MainFrame;

import javax.swing.*;
import java.awt.*;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 12.09.2010
 * Time: 1:56:55
 * To change this template use File | Settings | File Templates.
 */
public class Program {

    private static int MIN_WIDTH = 800;
    private static int MIN_HEIGHT = 600;

    private static Rectangle getDefaultBounds() {
        Toolkit kit = Toolkit.getDefaultToolkit();
        Dimension screenSize = kit.getScreenSize();
        int width = (int) (screenSize.getWidth() / 10 * 8);
        if (width < MIN_WIDTH) {
            width = MIN_WIDTH;
        }
        int height = (int) (screenSize.getHeight() / 10 * 8);
        if (height < MIN_HEIGHT) {
            height = MIN_HEIGHT;
        }
        return new Rectangle(((int) screenSize.getWidth() - width) / 2, ((int) screenSize.getHeight() - height) / 2,
                width, height);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                MainFrame frame = new MainFrame(getDefaultBounds());
                frame.setMinimumSize(new Dimension(MIN_WIDTH, MIN_HEIGHT));
                frame.setVisible(true);
            }
        });
    }

}
