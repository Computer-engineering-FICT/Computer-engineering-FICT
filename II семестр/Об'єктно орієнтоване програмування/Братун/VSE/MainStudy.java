import javax.swing.JFrame;

/**
 * Created by Андрей on 14.04.2017.
 */
public class MainStudy {
    public static void main(String args[]) {
        Study r = new Study("G-gurda");
            r.setVisible(true);
            r.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            r.setSize(300,200);
            r.setResizable(false);
            r.setLocationRelativeTo(null);


    }
}