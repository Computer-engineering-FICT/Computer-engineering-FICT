import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class SwingForm {

    JTextArea infoArea;
    JButton doIt;
    JTextField PField;
    JTextField c1Field;
    JTextField c2Field;
    //----
    JTextField m0Field;
    JTextField s0Field;
    JTextField m1Field;
    JTextField s1Field;
    //----
    SwingForm(){

        JFrame frame= new JFrame("Лаба 3");
        frame.setLayout(new FlowLayout());
        frame.setSize(520,100);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JLabel PLabel= new JLabel("P : ");
        JLabel c1Label= new JLabel("C1 : ");
        JLabel c2Label= new JLabel("C2 : ");
        //----
        JLabel m0Label= new JLabel("M0 : ");
        JLabel s0Label= new JLabel("S0 : ");
        JLabel m1Label= new JLabel("M1 : ");
        JLabel s1Label= new JLabel("S1 : ");
        //----
        infoArea= new JTextArea("Here will be all the probability's !");
        doIt= new JButton("Агонь !!!");

        PField = new JTextField("0.5",3);
        c1Field = new JTextField("1",3);
        c2Field = new JTextField("1",3);
        //----
        m0Field = new JTextField("0",3);
        s0Field = new JTextField("10",3);
        m1Field = new JTextField("6",3);
        s1Field = new JTextField("2",3);
        //----
        doIt.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                double P= Double.parseDouble(PField.getText());
                double c1= Double.parseDouble(c1Field.getText());
                double c2= Double.parseDouble(c2Field.getText());

                double m0= Double.parseDouble(m0Field.getText());
                double s0= Double.parseDouble(s0Field.getText());
                double m1= Double.parseDouble(m1Field.getText());
                double s1= Double.parseDouble(s1Field.getText());

                infoArea.setText(TestFunction.main(P, c1, c2, m0, s0, m1, s1));
            }
        });

        frame.add(PLabel);
        frame.add(PField);
        frame.add(c1Label);
        frame.add(c1Field);
        frame.add(c2Label);
        frame.add(c2Field);
        //----
        frame.add(m0Label);
        frame.add(m0Field);
        frame.add(s0Label);
        frame.add(s0Field);
        frame.add(m1Label);
        frame.add(m1Field);
        frame.add(s1Label);
        frame.add(s1Field);
        //----
        frame.add(doIt);
        frame.add(infoArea);

        frame.setVisible(true);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new SwingForm();
            }
        });
    }
}
