import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

/**
 * Created by Андрей on 14.04.2017.
 */
public class Study extends JFrame {
    JButton b1, b2;
    JLabel l1, l2, l3, l4;
    JTextField t1, t2;
    int i, k;
    String a, b;
    eHandler handler = new eHandler();



    public Study(String s){
        super(s);
        setLayout(new FlowLayout());
        b1 = new JButton("Очистить");
        b2 = new JButton("Посчитать");
        l1 = new JLabel("Ввеедите первое число");
        l2 = new JLabel("Ввеедите второе число");
        l3 = new JLabel("");
        l4 = new JLabel("");
        t1 = new JTextField(10);
        t2 = new JTextField(10);
        add(b1);
        add(b2);
        add(l1);
        add(t1);
        add(l2);
        add(t2);
        add(l3);
        add(l4);
        b2.addActionListener(handler);
        b1.addActionListener(handler);

    }

    public class eHandler implements ActionListener{
        public void actionPerformed(ActionEvent e){
            if (e.getSource()==b2){
                i = Integer.parseInt(t1.getText());
                k = Integer.parseInt(t2.getText());
                i++;
                k++;
                a = "Ваше первое число теперь равно" + i;
                b = "Ваше второе число теперь равно" + k;
                l3.setText(a);
                l4.setText(b);
            }
            if (e.getSource()==b1){
                t1.setText(null);
                t2.setText(null);
                l3.setText(null);
                l4.setText(null);
            }
        }
    }
}
