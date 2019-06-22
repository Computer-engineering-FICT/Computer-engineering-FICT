import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class SwingForm {

    JTextArea infoArea;
    JButton doIt;
    JTextField aField;
    JTextField bField;
    JTextField deltaField;

    SwingForm(){

        JFrame frame= new JFrame("Лаба 3");
        frame.setLayout(new FlowLayout());
        frame.setSize(400,335);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JLabel aLabel= new JLabel("Укажите сторону А");
        JLabel bLabel= new JLabel("Укажите сторону B");
        JLabel deltaLabel= new JLabel("Укажите точность");
        infoArea= new JTextArea();
        doIt= new JButton("Агонь !!!");
        aField= new JTextField("1",6);
        bField= new JTextField("1",6);
        deltaField= new JTextField("0.01",6);

        doIt.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                double a= Double.parseDouble(aField.getText());
                double b= Double.parseDouble(bField.getText());
                double delta= Double.parseDouble(deltaField.getText());
                String answer= "";

                infoArea.replaceRange(answer,0,infoArea.getText().length());

                try{ answer= Main.doAllmyWork(a, b, delta);
                }catch (Exception ex){
                    actionPerformed(e);
                }

                infoArea.append(answer);
            }
        });

        frame.add(aLabel);
        frame.add(aField);
        frame.add(bLabel);
        frame.add(bField);
        frame.add(deltaLabel);
        frame.add(deltaField);
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
