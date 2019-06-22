import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JButton;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;
import java.io.FileNotFoundException;

import javax.swing.JTextField;


public class liner extends JFrame {

	private JPanel contentPane;
	private JTextField DtextField;
	private JTextField RtextField_1;
	private JTextField GtextField_2;
	private JTextField FFtextField;
	private JTextField DDtextField_1;
	private JTextField REStextField;
	private String [] string;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					liner frame = new liner();
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
	public liner() {
		setTitle("\u041B\u0456\u043D\u0456\u0439\u043D\u0438\u0439 \u0430\u043B\u0433\u043E\u0440\u0438\u0442\u043C");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 585, 365);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("\u0426\u0435\u0439 \u0430\u043B\u0433\u043E\u0440\u0438\u0442\u043C \u0432\u0438\u0440\u0430\u0445\u043E\u0432\u0443\u0454 \u0437\u043D\u0430\u0447\u0435\u043D\u043D\u044F \u0444\u0443\u043D\u043A\u0446\u0456\u0457\r\n F1= ((d+r/g)^F) / ((d+r/g)^D)");
		lblNewLabel.setFont(new Font("Times New Roman", Font.BOLD, 14));
		lblNewLabel.setBounds(51, 34, 455, 17);
		contentPane.add(lblNewLabel);
		
		JLabel lblD = new JLabel("d =");
		lblD.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblD.setBounds(71, 72, 25, 22);
		contentPane.add(lblD);
		
		DtextField = new JTextField();
		DtextField.setBounds(106, 75, 86, 20);
		contentPane.add(DtextField);
		DtextField.setColumns(10);
		
		JLabel lblR = new JLabel("r =");
		lblR.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblR.setBounds(202, 68, 22, 22);
		contentPane.add(lblR);
		
		RtextField_1 = new JTextField();
		RtextField_1.setColumns(10);
		RtextField_1.setBounds(236, 75, 86, 20);
		contentPane.add(RtextField_1);
		
		JLabel lblG = new JLabel("g =");
		lblG.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblG.setBounds(332, 68, 24, 22);
		contentPane.add(lblG);
		
		GtextField_2 = new JTextField();
		GtextField_2.setColumns(10);
		GtextField_2.setBounds(374, 75, 86, 20);
		contentPane.add(GtextField_2);
		
		JLabel lblF = new JLabel("F =");
		lblF.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblF.setBounds(106, 133, 25, 22);
		contentPane.add(lblF);
		
		FFtextField = new JTextField();
		FFtextField.setBounds(141, 136, 86, 20);
		contentPane.add(FFtextField);
		FFtextField.setColumns(10);
		
		JLabel lblD_1 = new JLabel("D = ");
		lblD_1.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblD_1.setBounds(272, 133, 33, 22);
		contentPane.add(lblD_1);
		
		DDtextField_1 = new JTextField();
		DDtextField_1.setColumns(10);
		DDtextField_1.setBounds(307, 136, 86, 20);
		contentPane.add(DDtextField_1);
		
		JButton btnNewButton = new JButton("\u041F\u043E\u0440\u0430\u0445\u0443\u0432\u0430\u0442\u0438");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				double d,r,g,F,D, res;
				try {
					d=Double.parseDouble(DtextField.getText());
					r=Double.parseDouble(RtextField_1.getText());
					g=Double.parseDouble(GtextField_2.getText());
					F=Double.parseDouble(FFtextField.getText());
					D=Double.parseDouble(DDtextField_1.getText());
					
					res=Math.pow(d+r/g, F)/Math.pow(d+r/g, D);
					REStextField.setText(""+res);
				} catch (Exception e) {
					JOptionPane.showMessageDialog(null, "Перевірте правильність вводу даних");
				}
			}
		});
		btnNewButton.setFont(new Font("Times New Roman", Font.BOLD, 18));
		btnNewButton.setBounds(186, 167, 150, 31);
		contentPane.add(btnNewButton);
		
		JLabel lblF_1 = new JLabel("\u0420\u0435\u0437\u0443\u043B\u044C\u0442\u0430\u0442 F1 =");
		lblF_1.setFont(new Font("Times New Roman", Font.BOLD, 20));
		lblF_1.setBounds(61, 232, 131, 24);
		contentPane.add(lblF_1);
		
		REStextField = new JTextField();
		REStextField.setBounds(202, 236, 272, 22);
		contentPane.add(REStextField);
		REStextField.setColumns(10);
		
		JButton button = new JButton("\u0417\u0430\u043A\u0440\u0438\u0442\u0438 \u0432\u0456\u043A\u043D\u043E");
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
		button.setBounds(419, 269, 123, 34);
		contentPane.add(button);
		
		
		JButton button_1 = new JButton("\u0417\u0430\u043F\u0438\u0441\u0430\u0442\u0438 \u0432 \u0444\u0430\u0439\u043B");
		button_1.setFont(new Font("Times New Roman", Font.BOLD, 15));
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {			
				String d,r,g,F,D;
				d=DtextField.getText();
				r=RtextField_1.getText();
				g=GtextField_2.getText();
				F=FFtextField.getText();
				D=DDtextField_1.getText();
				String buf=d+" "+r+" "+g+" "+F+" "+D;
				String file_name="D://obuchenie/2 курс 4 семестр/Алгоритми та методи обчислень/Лабораторна робота №1/liner.txt";
				lab1.write(file_name, buf);
				
				} catch (Exception e2) {
					JOptionPane.showMessageDialog(null, "Помилка");					
				}
			}
		});
		button_1.setBounds(15, 166, 161, 36);
		contentPane.add(button_1);
		
		JButton button_2 = new JButton("\u0417\u0447\u0438\u0442\u0430\u0442\u0438 \u0456\u0437 \u0444\u0430\u0439\u043B\u0443");
		button_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				String str="";
				try {
					str=lab1.read("D://obuchenie/2 курс 4 семестр/Алгоритми та методи обчислень/Лабораторна робота №1/liner.txt");
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				}
				String strVector [];
				strVector=str.split(" ");
				DtextField.setText(strVector[0]);
				RtextField_1.setText(strVector[1]);
				GtextField_2.setText(strVector[2]);
				FFtextField.setText(strVector[3]);
				DDtextField_1.setText(strVector[4]);	
				}
		});
		button_2.setFont(new Font("Times New Roman", Font.BOLD, 15));
		button_2.setBounds(362, 167, 161, 36);
		contentPane.add(button_2);
	}
}
