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
        setSize(250,245);
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

        JLabel inputLabel1 = new JLabel("Довжина слів які треба замінити:");
        JTextField input1 = new JTextField(20);
        add(inputLabel1, BorderLayout.CENTER);
        add(input1, BorderLayout.CENTER);

        JLabel inputLabel2 = new JLabel("Слово на яке треба поміняти");
        JTextField input2 = new JTextField(20);
        add(inputLabel2, BorderLayout.CENTER);
        add(input2, BorderLayout.CENTER);

        JLabel outputLabel3 = new JLabel("Вивід");
        JTextField output3 = new JTextField(20);
        add(outputLabel3, BorderLayout.CENTER);
        add(output3, BorderLayout.CENTER);


        JButton button = new JButton("Go"); //для виконання RegisterFunction
        button.addActionListener(new ActionListener()
        {
            @Override
            public void actionPerformed(ActionEvent e)
            {
                String row1 = input.getText();
                String row2 = input1.getText();
                String row3 = input2.getText();
                output3.setText(Lab3.changeWords(row1,row2,row3));
            }
        });
        add(button, BorderLayout.SOUTH);
    }
}
