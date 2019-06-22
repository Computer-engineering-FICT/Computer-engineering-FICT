package Lab3;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JSeparator;
import javax.swing.SwingConstants;
import javax.swing.JScrollPane;
import javax.swing.SwingUtilities;

public class Menu extends JFrame {

	private JPanel contentPane;
	private JTextField textField;
	private JLabel label;
	private JLabel label_1;

	/**
	 * Launch the application.
	 */
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

	/**
	 * Create the frame.
	 */
	public Menu() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 900, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblN = new JLabel("¬вед≥ть n:");
		lblN.setBounds(10, 24, 62, 14);
		contentPane.add(lblN);
		
		textField = new JTextField();
		textField.setText("10");
		textField.setBounds(82, 21, 86, 20);
		contentPane.add(textField);
		textField.setColumns(10);
		
		JButton button = new JButton("√раф≥к ≥нтерпол€ц≥њ");
		button.setBounds(10, 49, 158, 23);
		contentPane.add(button);
		
		JButton button_1 = new JButton("ќц≥нка похибки");
		button_1.setBounds(10, 83, 158, 23);
		contentPane.add(button_1);
		
		JSeparator separator = new JSeparator();
		separator.setOrientation(SwingConstants.VERTICAL);
		separator.setBounds(194, 11, 7, 251);
		contentPane.add(separator);
		
		label = new JLabel("");
		label.setBounds(10, 121, 158, 130);
		contentPane.add(label);
		
		label_1 = new JLabel("");
		label_1.setBounds(211, 21, 663, 230);
		contentPane.add(label_1);
		
		button.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				try {
					int n = Integer.parseInt(textField.getText());
					new XYSeriesDemo(n);
					
				} catch (Exception e) {
					label.setText("<html>n повинно бути нев≥д'Їмним ц≥лим числом!");
				}
				
			}
		});
		button_1.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
			label_1.setText((new Lagr()).showTable());
				
			}
		});
	}
}
