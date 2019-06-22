import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class SwingForm {

    JTextArea infoArea;
    JButton doIt;
    JTextField aField;
    JTextField deltaField;

    SwingForm(){

        JFrame frame= new JFrame("Лаба 3");
        frame.setLayout(new FlowLayout());
        frame.setSize(500,400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JLabel aLabel= new JLabel("Укажите сторону А");
        JLabel deltaLabel= new JLabel("Укажите точность");
        infoArea= new JTextArea();
        doIt= new JButton("Агонь !!!");
        aField= new JTextField("1",6);
        deltaField= new JTextField("0.0001",6);

        doIt.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                double a= Double.parseDouble(aField.getText());
                double delta= Double.parseDouble(deltaField.getText());
                String answer= "";

                infoArea.replaceRange(answer,0,infoArea.getText().length());

                try{
                    answer= Main.doAllmyWork(a, delta);
                }catch (Exception ex){
                    infoArea.append(ex.getMessage());
                    infoArea.append("Неверно заполнены поля !");
                }

                infoArea.append(answer);
            }
        });

        frame.add(aLabel);
        frame.add(aField);
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
