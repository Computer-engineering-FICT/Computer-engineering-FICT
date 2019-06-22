package sample;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.Box;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class Gauss extends JFrame {
    private JTextArea result = new
            JTextArea(3, 5);
    private JTextField a11 = new
            JTextField(4);
    private JTextField a12 = new
            JTextField(4);
    private JTextField a13 = new
            JTextField(4);
    private JTextField a21 = new
            JTextField(4);
    private JTextField a22 = new
            JTextField(4);
    private JTextField a23 = new
            JTextField(4);
    private JTextField a31 = new
            JTextField(4);
    private JTextField a32 = new
            JTextField(4);
    private JTextField a33 = new
            JTextField(4);
    private JTextField b1 = new
            JTextField(4);
    private JTextField b2 = new
            JTextField(4);
    private JTextField b3 = new
            JTextField(4);

    public Gauss() {
        super("Gauss method");
        createGUI();
    }

    public void createGUI() {
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JPanel panel = new JPanel();
        Box bigBox = Box.createVerticalBox();
        Box butBox = Box.createHorizontalBox();
        Box box1 = Box.createHorizontalBox();
        Box box2 = Box.createHorizontalBox();
        Box box3 = Box.createHorizontalBox();

        JLabel label11 = new JLabel("x1 + ");
        JLabel label12 = new JLabel("x2 + ");
        JLabel label13 = new JLabel("x3 = ");
        JLabel label21 = new JLabel("x1 + ");
        JLabel label22 = new JLabel("x2 + ");
        JLabel label23 = new JLabel("x3 = ");
        JLabel label31 = new JLabel("x1 + ");
        JLabel label32 = new JLabel("x2 + ");
        JLabel label33 = new JLabel("x3 = ");

        JButton go = new JButton("Розв'язати");
        JButton clean = new JButton("Очистити");
        JLabel title = new JLabel("Розв'язок СЛАР");

        title.setAlignmentX(JComponent.CENTER_ALIGNMENT);
        go.setAlignmentX(JComponent.RIGHT_ALIGNMENT);
        box1.setAlignmentX(JComponent.CENTER_ALIGNMENT);
        box2.setAlignmentX(JComponent.CENTER_ALIGNMENT);
        box3.setAlignmentX(JComponent.CENTER_ALIGNMENT);

        box1.add(a11);
        box1.add(label11);
        box1.add(a12);
        box1.add(label12);
        box1.add(a13);
        box1.add(label13);
        box1.add(b1);
        box2.add(a21);
        box2.add(label21);
        box2.add(a22);
        box2.add(label22);
        box2.add(a23);
        box2.add(label23);
        box2.add(b2);
        box3.add(a31);
        box3.add(label31);
        box3.add(a32);
        box3.add(label32);
        box3.add(a33);
        box3.add(label33);
        box3.add(b3);
        butBox.add(go);
        butBox.add(clean);
        bigBox.add(title);
        bigBox.add(Box.createVerticalStrut(20));
        bigBox.add(box1);
        bigBox.add(box2);
        bigBox.add(box3);
        bigBox.add(Box.createVerticalStrut(20));
        bigBox.add(butBox);
        bigBox.add(Box.createVerticalStrut(20));
        bigBox.add(result);
        panel.add(bigBox);
        ActionListener actionButton1 =
                new Button1Action();
        go.addActionListener(actionButton1);
        ActionListener actionButton2 =
                new Button2Action();
        clean.addActionListener(actionButton2);
        JFrame frame = new JFrame("");
        frame.add(panel);
        getContentPane().add(panel);
        setPreferredSize(new
                Dimension(400, 250));
    }

    public class Button1Action implements
            ActionListener {
        public void
        actionPerformed(ActionEvent e) {
            result.setText("");
            double A[][] = {
                    {
                            Double.parseDouble(a11.getText()),
                            Double.parseDouble(a12.getText()),
                            Double.parseDouble(a13.getText()),
                            Double.parseDouble(b1.getText())},
                    {
                            Double.parseDouble(a21.getText()),
                            Double.parseDouble(a22.getText()),
                            Double.parseDouble(a23.getText()),
                            Double.parseDouble(b2.getText())},
                    {
                            Double.parseDouble(a31.getText()),
                            Double.parseDouble(a32.getText()),
                            Double.parseDouble(a33.getText()),
                            Double.parseDouble(b3.getText())}};
            double x[] = new double[A.length];
            x = solution(A);
            for (int i = 0; i < x.length; i++)
            {
                //double tmp = x[i];
                int tmp = (int)Math.ceil(x[i]);
                result.append("x" + (i + 1) + " = " + tmp + "\n");
            }
        }
    }

    public class Button2Action implements
            ActionListener {
        public void
        actionPerformed(ActionEvent e) {
            result.setText("");
            a11.setText("");
            a12.setText("");
            a13.setText("");
            a21.setText("");
            a22.setText("");
            a23.setText("");
            a31.setText("");
            a32.setText("");
            a33.setText("");
            b1.setText("");
            b2.setText("");
            b3.setText("");
        }
    }

    public double[] solution(double[][] A) {
        double x[] = new
                double[A.length];
        double m;
        for (int k = 1; k < A.length; k++) {
            for (int j = k; j < A.length; j++) {
                m = A[j][k - 1] / A[k - 1][k - 1];
                for (int i = 0; i <= A.length; i++) {
                    A[j][i] = A[j][i] - m * A[k - 1][i];
                }
            }
        }
        for (int i = A.length - 1; i >= 0; i--) {
            for (int j = i + 1; j < A.length; j++)
                x[i] += A[i][j] * x[j];
            x[i] = (A[i][A.length] - x[i]) / A[i][i];
        }
        return x;
    }

    public static void main(String[] args) {
        javax.swing.SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                Gauss frame =
                        new Gauss();
                frame.pack();
                frame.setLocationRelativeTo(null);
                frame.setVisible(true);
            }
        });
    }
}