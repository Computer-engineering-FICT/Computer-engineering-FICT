
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Lab3Frame extends JFrame
{
    public Lab3Frame(String title)
    {
        setTitle(title);
        setResizable(false);
        setSize(250,200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        add(new Lab3Panel(), BorderLayout.CENTER);
    }
}
class Lab3Panel extends JPanel
 {
     public Lab3Panel()
     {
         JLabel inputLabel = new JLabel("Початкова строка:");
         JTextField input = new JTextField(20);
         add(inputLabel, BorderLayout.CENTER);
         add(input, BorderLayout.CENTER);

         JLabel outputLabel1 = new JLabel("З урахуванням регістру:");
         JTextField output1 = new JTextField(20);
         add(outputLabel1, BorderLayout.CENTER);
         add(output1, BorderLayout.CENTER);

         JLabel outputLabel2 = new JLabel("Без урахування регістру:");
         JTextField output2 = new JTextField(20);
         add(outputLabel2, BorderLayout.CENTER);
         add(output2, BorderLayout.CENTER);


         JButton button = new JButton("Go"); //для виконання RegisterFunction
         button.addActionListener(new ActionListener()
         {
             @Override
             public void actionPerformed(ActionEvent e)
             {
                 String row = input.getText();
                 output1.setText(Lab3.RegisterFunction(row));
                 output2.setText(Lab3.noRegisterFunction(row));
             }
         });
         add(button, BorderLayout.SOUTH);
     }
 }

