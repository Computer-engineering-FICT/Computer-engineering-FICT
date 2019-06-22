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


public class branchingOut extends JFrame {

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
					branchingOut frame = new branchingOut();
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
	public branchingOut() {
		setTitle("\u0410\u043B\u0433\u043E\u0440\u0438\u0442\u043C, \u0449\u043E \u0440\u043E\u0437\u0433\u0430\u043B\u0443\u0436\u0443\u0454\u0442\u044C\u0441\u044F");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 502, 291);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel label = new JLabel("\u0426\u0435\u0439 \u0430\u043B\u0433\u043E\u0440\u0438\u0442\u043C \u0432\u0438\u0440\u0430\u0445\u043E\u0432\u0443\u0454 \u0437\u043D\u0430\u0447\u0435\u043D\u043D\u044F \u0444\u0443\u043D\u043A\u0446\u0456\u0457 er=ctg(gh)");
		label.setFont(new Font("Times New Roman", Font.BOLD, 14));
		label.setBounds(61, 22, 383, 17);
		contentPane.add(label);
		
		JLabel lblG = new JLabel("g =");
		lblG.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblG.setBounds(62, 57, 24, 22);
		contentPane.add(lblG);
		
		textField = new JTextField();
		textField.setBounds(96, 60, 86, 20);
		contentPane.add(textField);
		textField.setColumns(10);
		
		JLabel lblH = new JLabel("h =");
		lblH.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblH.setBounds(216, 57, 25, 22);
		contentPane.add(lblH);
		
		textField_1 = new JTextField();
		textField_1.setColumns(10);
		textField_1.setBounds(266, 60, 86, 20);
		contentPane.add(textField_1);
		
		JButton btnNewButton = new JButton("\u041F\u043E\u0440\u0430\u0445\u0443\u0432\u0430\u0442\u0438");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				double g,h, res=0;
				try {
					
					g=Double.parseDouble(textField.getText());
					h=Double.parseDouble(textField_1.getText());
					
					if (Math.sin(g*h)!=0.0){
						res=1.0/Math.tan(g*h);						
					} else {
						int a=1/0;						
					}
					
					
					textField_2.setText(""+res);
				} catch (Exception e) {
					JOptionPane.showMessageDialog(null, "Перевірте правильність вводу даних, cth(x), x!=pi*n");
				}
			}
		});
		btnNewButton.setFont(new Font("Times New Roman", Font.BOLD, 22));
		btnNewButton.setBounds(239, 96, 175, 35);
		contentPane.add(btnNewButton);
		
		JLabel lblNewLabel = new JLabel("er = ");
		lblNewLabel.setFont(new Font("Times New Roman", Font.BOLD, 20));
		lblNewLabel.setBounds(96, 154, 39, 24);
		contentPane.add(lblNewLabel);
		
		textField_2 = new JTextField();
		textField_2.setBounds(145, 159, 230, 19);
		contentPane.add(textField_2);
		textField_2.setColumns(10);
		
		JButton button = new JButton("\u0417\u0430\u043A\u0440\u0438\u0442\u0438 \u0432\u0456\u043A\u043D\u043E");
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				dispose();				
			}
		});
		button.setBounds(331, 203, 134, 22);
		contentPane.add(button);
		
		JButton btnNewButton_1 = new JButton("\u0417\u0430\u043F\u0438\u0441\u0430\u0442\u0438 \u0432 \u0444\u0430\u0439\u043B");
		btnNewButton_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {			
					String g="", h="";
					g=textField.getText();
					h=textField_1.getText();
					String buf=g+" "+h;
					String file_name="D://obuchenie/2 курс 4 семестр/Алгоритми та методи обчислень/Лабораторна робота №1/branchingOut.txt";
					lab1.write(file_name, buf);
					
					} catch (Exception e2) {
						JOptionPane.showMessageDialog(null, "Помилка");					
					}
			}
		});
		btnNewButton_1.setBounds(46, 86, 136, 24);
		contentPane.add(btnNewButton_1);
		
		JButton button_1 = new JButton("\u0417\u0447\u0438\u0442\u0430\u0442\u0438 \u0456\u0437 \u0444\u0430\u0439\u043B\u0443");
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String str="";
				try {
					str=lab1.read("D://obuchenie/2 курс 4 семестр/Алгоритми та методи обчислень/Лабораторна робота №1/branchingOut.txt");
				} catch (FileNotFoundException e3) {
					e3.printStackTrace();
				}
				String strVector [];
				strVector=str.split(" ");
				textField.setText(strVector[0]);
				textField_1.setText(strVector[1]);
				
			}
		});
		button_1.setBounds(46, 124, 136, 24);
		contentPane.add(button_1);
	}
}
