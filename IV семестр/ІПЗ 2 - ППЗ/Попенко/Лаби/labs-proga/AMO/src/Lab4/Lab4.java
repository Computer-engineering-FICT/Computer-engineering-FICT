package Lab4;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JButton;

import java.awt.Font;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Lab4 {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Lab4 window = new Lab4();
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
	public Lab4() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setTitle("\u041B\u0430\u0431\u043E\u0440\u0430\u0442\u043E\u0440\u043D\u0430 \u21164 \u041F\u043E\u043F\u0435\u043D\u043A\u0430 \u0420\u0443\u0441\u043B\u0430\u043D\u0430 \u041C\u0435\u0442\u043E\u0434 \u0456\u0442\u0435\u0440\u0430\u0446\u0456\u0439");
		frame.setBounds(100, 100, 655, 397);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JButton btnNewButton = new JButton("\u0423\u0437\u0430\u0433\u0430\u043B\u044C\u043D\u0435\u043D\u0438\u0439 \u043C\u0435\u0442\u043E\u0434 \u0456\u0442\u0435\u0440\u0430\u0446\u0456\u0439");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					OriginIter frame = new OriginIter();
					frame.setVisible(true);
				} catch (Exception e3) {
					e3.printStackTrace();
				}
			}
		});
		btnNewButton.setFont(new Font("Times New Roman", Font.BOLD, 24));
		btnNewButton.setBounds(132, 85, 372, 54);
		frame.getContentPane().add(btnNewButton);
		
		JButton btnNewButton_1 = new JButton("\u041C\u0435\u0442\u043E\u0434 \u0456\u0442\u0435\u0440\u0430\u0446\u0456\u0439 \u041D\u044C\u044E\u0442\u043E\u043D\u0430");
		btnNewButton_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					NewtonIter window = new NewtonIter();
					window.frame.setVisible(true);
				} catch (Exception e5) {
					e5.printStackTrace();
				}
				
			}
		});
		btnNewButton_1.setFont(new Font("Times New Roman", Font.BOLD, 24));
		btnNewButton_1.setBounds(132, 225, 372, 54);
		frame.getContentPane().add(btnNewButton_1);
	}
}
