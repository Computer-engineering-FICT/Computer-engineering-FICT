package Lab4;

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

public class OriginIter extends JFrame {

	private JPanel contentPane;
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;
	private JTextField textField_3;
	private JTextField textField_4;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					OriginIter frame = new OriginIter();
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
	public OriginIter() {
		setTitle("\u0423\u0437\u0430\u0433\u0430\u043B\u044C\u043D\u0435\u043D\u0438\u0439 \u043C\u0435\u0442\u043E\u0434 \u0456\u0442\u0435\u0440\u0430\u0446\u0456\u0439");
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(100, 100, 550, 338);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblFx = new JLabel("\u0417\u043D\u0430\u0445\u043E\u0434\u0436\u0435\u043D\u043D\u044F \u043A\u043E\u0440\u0435\u043D\u0456\u0432 f(x)=0 \u043F\u043E \u0444\u0443\u043D\u043A\u0446\u0456\u0457 \u03C6(x) ");
		lblFx.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblFx.setBounds(64, 11, 385, 39);
		contentPane.add(lblFx);
		
		JLabel lblx = new JLabel("\u03C6 (x) =");
		lblx.setFont(new Font("Times New Roman", Font.BOLD, 22));
		lblx.setBounds(31, 56, 77, 39);
		contentPane.add(lblx);
		
		textField = new JTextField();
		textField.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		textField.setColumns(10);
		textField.setBounds(100, 61, 147, 31);
		contentPane.add(textField);
		
		JLabel label = new JLabel("\u041F\u043E\u0445\u0438\u0431\u043A\u0430 =");
		label.setFont(new Font("Times New Roman", Font.BOLD, 22));
		label.setBounds(260, 62, 114, 33);
		contentPane.add(label);
		
		textField_1 = new JTextField();
		textField_1.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		textField_1.setColumns(10);
		textField_1.setBounds(376, 62, 122, 33);
		contentPane.add(textField_1);
		
		JLabel label_1 = new JLabel("\u041F\u0440\u0438\u0431\u043B\u0438\u0436\u0435\u043D\u0435 \u0437\u043D\u0430\u0447\u0435\u043D\u043D\u044F \u043A\u043E\u0440\u043D\u044F =");
		label_1.setFont(new Font("Times New Roman", Font.BOLD, 22));
		label_1.setBounds(31, 125, 325, 27);
		contentPane.add(label_1);
		
		textField_2 = new JTextField();
		textField_2.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		textField_2.setColumns(10);
		textField_2.setBounds(357, 119, 122, 33);
		contentPane.add(textField_2);
		
		JButton button = new JButton("\u041F\u043E\u0440\u0430\u0445\u0443\u0432\u0430\u0442\u0438");
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					String fi=textField.getText();
					double eps=Double.parseDouble(textField_1.getText());
					double x0=Double.parseDouble(textField_2.getText());
					IterationRoot IR=new IterationRoot(fi, x0, eps, true);					
					double res=IR.getResult();
					res=IR.roundResult(res, 9);
					IR.isCalsOrigin();
					textField_3.setText(""+res);
					textField_4.setText(""+IR.getIter());
										
				} catch (Exception e2) {
					JOptionPane.showMessageDialog(null, "Корінь не знайдено, перевірте правильність вводу даних");
				}
				
			}
		});
		button.setFont(new Font("Times New Roman", Font.BOLD, 24));
		button.setBounds(148, 163, 238, 38);
		contentPane.add(button);
		
		JLabel label_2 = new JLabel("\u0420\u0435\u0437\u0443\u043B\u044C\u0442\u0430\u0442: \u043A\u043E\u0440\u0456\u043D\u044C \u0440\u0456\u0432\u043D\u044F\u043D\u043D\u044F =");
		label_2.setFont(new Font("Times New Roman", Font.BOLD, 22));
		label_2.setBounds(10, 207, 311, 38);
		contentPane.add(label_2);
		
		textField_3 = new JTextField();
		textField_3.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		textField_3.setColumns(10);
		textField_3.setBounds(318, 212, 122, 33);
		contentPane.add(textField_3);
		
		JLabel label_3 = new JLabel("\u041A\u0456\u043B\u044C\u043A\u0456\u0441\u0442\u044C \u0456\u0442\u0435\u0440\u0430\u0446\u0456\u0439 =");
		label_3.setFont(new Font("Times New Roman", Font.BOLD, 22));
		label_3.setBounds(10, 244, 215, 46);
		contentPane.add(label_3);
		
		textField_4 = new JTextField();
		textField_4.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		textField_4.setColumns(10);
		textField_4.setBounds(220, 251, 122, 33);
		contentPane.add(textField_4);
	}
}
