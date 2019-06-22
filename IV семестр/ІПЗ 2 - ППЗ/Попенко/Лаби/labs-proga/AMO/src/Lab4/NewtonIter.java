package Lab4;

import java.awt.EventQueue;

import javax.swing.JFrame;

import java.awt.Font;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.JButton;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class NewtonIter {

	public JFrame frame;
	private JTextField txtGrrgree;
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;
	private JTextField textField_3;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					NewtonIter window = new NewtonIter();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public NewtonIter() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setFont(new Font("Dialog", Font.BOLD, 12));
		frame.setTitle(" \u041C\u0435\u0442\u043E\u0434 \u0456\u0442\u0435\u0440\u0430\u0446\u0456\u0439 \u0437\u0430 \u0444\u043E\u0440\u043C\u0443\u043B\u043E\u044E \u041D\u044C\u044E\u0442\u043E\u043D\u0430");
		frame.setResizable(false);
		frame.setBounds(100, 100, 568, 389);
		frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JLabel lblNewLabel = new JLabel("\u0412\u0438\u0437\u043D\u0430\u0447\u0435\u043D\u043D\u044F \u0437\u043D\u0430\u0447\u0435\u043D\u043D\u044F \u043A\u043E\u0440\u043D\u044F \u0440\u0456\u0432\u043D\u044F\u043D\u043D\u044F f(x)=0 \u043C\u0435\u0442\u043E\u0434\u043E\u043C \u0456\u0442\u0435\u0440\u0430\u0446\u0456\u0439");
		lblNewLabel.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblNewLabel.setBounds(30, 11, 507, 38);
		frame.getContentPane().add(lblNewLabel);
		
		JLabel lblFx = new JLabel("f(x) =");
		lblFx.setFont(new Font("Times New Roman", Font.BOLD, 22));
		lblFx.setBounds(30, 72, 58, 38);
		frame.getContentPane().add(lblFx);
		
		txtGrrgree = new JTextField();
		txtGrrgree.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		txtGrrgree.setBounds(88, 79, 147, 31);
		frame.getContentPane().add(txtGrrgree);
		txtGrrgree.setColumns(10);
		
		JLabel label = new JLabel("\u041F\u043E\u0445\u0438\u0431\u043A\u0430 =");
		label.setFont(new Font("Times New Roman", Font.BOLD, 22));
		label.setBounds(245, 75, 114, 33);
		frame.getContentPane().add(label);
		
		textField = new JTextField();
		textField.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		textField.setColumns(10);
		textField.setBounds(362, 77, 122, 33);
		frame.getContentPane().add(textField);
		
		JLabel label_1 = new JLabel("\u041F\u0440\u0438\u0431\u043B\u0438\u0436\u0435\u043D\u0435 \u0437\u043D\u0430\u0447\u0435\u043D\u043D\u044F \u043A\u043E\u0440\u043D\u044F =");
		label_1.setFont(new Font("Times New Roman", Font.BOLD, 22));
		label_1.setBounds(30, 145, 325, 27);
		frame.getContentPane().add(label_1);
		
		textField_1 = new JTextField();
		textField_1.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		textField_1.setColumns(10);
		textField_1.setBounds(362, 139, 122, 33);
		frame.getContentPane().add(textField_1);
		
		JLabel label_2 = new JLabel("\u0420\u0435\u0437\u0443\u043B\u044C\u0442\u0430\u0442: \u043A\u043E\u0440\u0456\u043D\u044C \u0440\u0456\u0432\u043D\u044F\u043D\u043D\u044F =");
		label_2.setFont(new Font("Times New Roman", Font.BOLD, 22));
		label_2.setBounds(30, 242, 311, 38);
		frame.getContentPane().add(label_2);
		
		
		JButton btnNewButton = new JButton("\u041F\u043E\u0440\u0430\u0445\u0443\u0432\u0430\u0442\u0438");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					String func=txtGrrgree.getText();
					double eps=Double.parseDouble(textField.getText());
					double x0=Double.parseDouble(textField_1.getText());
					IterationRoot IR=new IterationRoot(func, x0, eps);
					IR.isCals();
					double res=IR.getResult();
					res=IR.roundResult(res, 9);
					textField_2.setText(""+res);
					textField_3.setText(""+IR.getIter());
										
				} catch (Exception e2) {
					JOptionPane.showMessageDialog(null, "Корінь не знайдено, перевірте правильність вводу даних");
				}
				
			}
		});
		btnNewButton.setFont(new Font("Times New Roman", Font.BOLD, 24));
		btnNewButton.setBounds(162, 193, 238, 38);
		frame.getContentPane().add(btnNewButton);
		
		
		textField_2 = new JTextField();
		textField_2.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		textField_2.setColumns(10);
		textField_2.setBounds(334, 247, 122, 33);
		frame.getContentPane().add(textField_2);
		
		JLabel label_3 = new JLabel("\u041A\u0456\u043B\u044C\u043A\u0456\u0441\u0442\u044C \u0456\u0442\u0435\u0440\u0430\u0446\u0456\u0439 =");
		label_3.setFont(new Font("Times New Roman", Font.BOLD, 22));
		label_3.setBounds(30, 291, 215, 46);
		frame.getContentPane().add(label_3);
		
		textField_3 = new JTextField();
		textField_3.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		textField_3.setColumns(10);
		textField_3.setBounds(245, 300, 122, 33);
		frame.getContentPane().add(textField_3);
	}
}
