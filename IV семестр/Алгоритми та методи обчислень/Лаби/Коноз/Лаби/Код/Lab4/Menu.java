package Lab4;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.JButton;

import org.jfree.graphics2d.svg.ImageElement;


public class Menu extends JFrame {

	private JPanel contentPane;
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;
	private JLabel lblNewLabel_2;

	
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Menu frame = new Menu();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	
	public Menu() {
		setTitle("Розв'язання нелінійних рівнянь.");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel label = new JLabel("Введіть нижню межу діапазону:");
		label.setBounds(10, 11, 183, 14);
		contentPane.add(label);
		
		textField = new JTextField();
		textField.setBounds(205, 8, 86, 20);
		contentPane.add(textField);
		textField.setColumns(10);
		
		JLabel label_1 = new JLabel("Введіть верхню межу діапазону:");
		label_1.setBounds(10, 36, 183, 14);
		contentPane.add(label_1);
		
		textField_1 = new JTextField();
		textField_1.setBounds(205, 33, 86, 20);
		contentPane.add(textField_1);
		textField_1.setColumns(10);
		
		JLabel lblNewLabel = new JLabel("Задайте точність обчислення:");
		lblNewLabel.setBounds(10, 61, 183, 14);
		contentPane.add(lblNewLabel);
		
		textField_2 = new JTextField();
		textField_2.setBounds(205, 58, 86, 20);
		contentPane.add(textField_2);
		textField_2.setColumns(10);
		
		JButton button = new JButton("Знайти корінь");
		button.setBounds(301, 7, 123, 23);
		contentPane.add(button);
		
		JButton button_1 = new JButton("Алгоритм");
		button_1.setBounds(301, 36, 123, 23);
		contentPane.add(button_1);
		
		JLabel lblNewLabel_1 = new JLabel("<html>Корінь шукається на заданому діапазоні.");
		lblNewLabel_1.setBounds(10, 94, 414, 58);
		contentPane.add(lblNewLabel_1);
		
		lblNewLabel_2 = new JLabel("");
		lblNewLabel_2.setBounds(10, 151, 414, 100);
		contentPane.add(lblNewLabel_2);
		
		button_1.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) { 
				new Algoritm();
			}
		} );
		button.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				Lab4 ob = new Lab4();
				try{
					double a = Double.parseDouble(textField.getText());
					double b = Double.parseDouble(textField_1.getText());
					double eps = Double.parseDouble(textField_2.getText());
					if(ob.function(a)*ob.function(b) < 0)
						lblNewLabel_2.setText("x = " + ob.solveFunktion(a, b, eps));
					else
						lblNewLabel_2.setText("<html>На даному інтервалі корені відсутні або їх неможливо визначити." +
								"<br> Спробуйте інший інтервал.");
				}catch(Exception e){
					lblNewLabel_2.setText("Заповніть всі поля або перевірте коректність даних.");
				}
				
			}
		});
	}
}
