import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;

import java.awt.Font;

import javax.swing.JTextField;
import javax.swing.JButton;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.io.FileNotFoundException;


public class Cyclic extends JFrame {

	private JPanel contentPane;
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Cyclic frame = new Cyclic();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Cyclic() {
		setTitle("\u0426\u0438\u043A\u043B\u0456\u0447\u043D\u0438\u0439 \u0430\u043B\u0433\u043E\u0440\u0438\u0442\u043C");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 539, 247);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel label = new JLabel("\u0426\u0435\u0439 \u0430\u043B\u0433\u043E\u0440\u0438\u0442\u043C \u0432\u0438\u0440\u0430\u0445\u043E\u0432\u0443\u0454 \u0437\u043D\u0430\u0447\u0435\u043D\u043D\u044F \u0444\u0443\u043D\u043A\u0446\u0456\u0457 J=1/n1+1/n2+...+1/n25");
		label.setFont(new Font("Times New Roman", Font.BOLD, 14));
		label.setBounds(28, 11, 414, 17);
		contentPane.add(label);
		
		JLabel lblN = new JLabel("n1 = ");
		lblN.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblN.setBounds(38, 39, 39, 22);
		contentPane.add(lblN);
		
		textField = new JTextField();
		textField.setBounds(131, 39, 126, 22);
		contentPane.add(textField);
		textField.setColumns(10);
		
		JLabel lblN_1 = new JLabel("\u041A\u0440\u043E\u043A \u0434\u043B\u044F n");
		lblN_1.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblN_1.setBounds(32, 72, 92, 22);
		contentPane.add(lblN_1);
		
		textField_1 = new JTextField();
		textField_1.setColumns(10);
		textField_1.setBounds(131, 74, 126, 22);
		contentPane.add(textField_1);
		
		JLabel lblNewLabel = new JLabel("J =");
		lblNewLabel.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblNewLabel.setBounds(160, 106, 24, 22);
		contentPane.add(lblNewLabel);
		
		textField_2 = new JTextField();
		textField_2.setColumns(10);
		textField_2.setBounds(194, 107, 126, 22);
		contentPane.add(textField_2);
		
		JButton btnNewButton = new JButton("\u041F\u043E\u0440\u0430\u0445\u0443\u0432\u0430\u0442\u0438");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				double n1, n, step,J=0;
				int m=25;
				try {
					n1=Double.parseDouble(textField.getText());
					step=Double.parseDouble(textField_1.getText());
					n=n1;
					for (int i = 0; i < m; i++) {
						J+=1/n;	
						n+=step;					
					}
					textField_2.setText(""+J);
				} catch (Exception e2) {
					JOptionPane.showMessageDialog(null, "Перевірте правильність вводу даних");
				}
				
			}
		});
		btnNewButton.setFont(new Font("Times New Roman", Font.BOLD, 20));
		btnNewButton.setBounds(267, 41, 160, 53);
		contentPane.add(btnNewButton);
		
		JButton button = new JButton("\u0417\u0430\u043A\u0440\u0438\u0442\u0438 \u0432\u0456\u043A\u043D\u043E");
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
		button.setBounds(379, 163, 118, 23);
		contentPane.add(button);
		
		JButton btnNewButton_1 = new JButton("\u0417\u0430\u043F\u0438\u0441\u0430\u0442\u0438");
		btnNewButton_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {			
					String n1="", step="";
					n1=textField.getText();
					step=textField_1.getText();
					String buf=n1+" "+step;
					String file_name="D://obuchenie/2 курс 4 семестр/Алгоритми та методи обчислень/Лабораторна робота №1/cyclic.txt";
					lab1.write(file_name, buf);
					
					} catch (Exception e2) {
						JOptionPane.showMessageDialog(null, "Помилка");					
					}
			
			}
		});
		btnNewButton_1.setFont(new Font("Times New Roman", Font.BOLD, 15));
		btnNewButton_1.setBounds(10, 152, 109, 34);
		contentPane.add(btnNewButton_1);
		
		JButton button_1 = new JButton("\u0417\u0447\u0438\u0442\u0430\u0442\u0438");
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String str="";
				try {
					str=lab1.read("D://obuchenie/2 курс 4 семестр/Алгоритми та методи обчислень/Лабораторна робота №1/cyclic.txt");
				} catch (FileNotFoundException e3) {
					e3.printStackTrace();
				}
				String strVector [];
				strVector=str.split(" ");
				textField.setText(strVector[0]);
				textField_1.setText(strVector[1]);
			}
		});
		button_1.setFont(new Font("Times New Roman", Font.BOLD, 15));
		button_1.setBounds(142, 152, 109, 34);
		contentPane.add(button_1);
	}

}
