package Lab5;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JScrollPane;
import javax.swing.JLabel;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.JTextField;

public class Menu extends JFrame {

	private JPanel contentPane;
	private JTextField textField;
	private JScrollPane scrollPane_1;
	private JScrollPane scrollPane;
	private JTable matr;
	private JTable solve;
	private JLabel label_2;
	protected int lenght = 0;
	private JLabel lblNewLabel;
	private JButton btnNewButton;
	

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
		setBounds(100, 100, 632, 360);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		scrollPane = new JScrollPane();
		scrollPane.setBounds(20, 44, 200, 200);
		contentPane.add(scrollPane);
		
		scrollPane_1 = new JScrollPane();
		scrollPane_1.setBounds(289, 44, 80, 200);
		contentPane.add(scrollPane_1);
		
		JLabel label = new JLabel("        =");
		label.setBounds(230, 139, 46, 14);
		contentPane.add(label);
		
		JButton button = new JButton("Знайти корені");
		button.setBounds(473, 7, 116, 23);
		contentPane.add(button);
		
		JLabel label_1 = new JLabel("Введіть кількість невідомих і натисніть Enter:");
		label_1.setBounds(22, 11, 275, 14);
		contentPane.add(label_1);
		
		textField = new JTextField();
		textField.setBounds(307, 8, 86, 20);
		contentPane.add(textField);
		textField.setColumns(10);
		
		label_2 = new JLabel("");
		label_2.setBounds(396, 44, 210, 267);
		contentPane.add(label_2);
		
		lblNewLabel = new JLabel("Зчитати дані з файлу C:\\lab.txt і розв'язати.");
		lblNewLabel.setBounds(10, 255, 359, 14);
		contentPane.add(lblNewLabel);
		
		btnNewButton = new JButton("Зчитати і розв'язати");
		btnNewButton.setBounds(10, 280, 165, 23);
		contentPane.add(btnNewButton);
		
		
		textField.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				try{
					label_2.setText("");
					int n = Integer.parseInt(textField.getText());
					lenght = n;
					matr = new JTable(n, n);
					matr.setCellSelectionEnabled(true);
					matr.setFillsViewportHeight(true);
					matr.setMaximumSize(new Dimension(200, 200));
					matr.setRowHeight(197/n);
					matr.setTableHeader(null);
					scrollPane.setViewportView(matr);
					
					solve = new JTable(n, 1);
					solve.setCellSelectionEnabled(true);
					solve.setFillsViewportHeight(true);
					solve.setRowHeight(197/n);
					solve.setTableHeader(null);
					scrollPane_1.setViewportView(solve);
				} catch (Exception e) {
					label_2.setText("<html>Поле n повинно бути цілим невід'ємним числом!");
				}
				
			}
		});
		
		
		
		btnNewButton.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				double slar[][];
				double solves [];
				SolveSLAR ob = new SolveSLAR();
				
				
				try {
					label_2.setText("");
					ob.reader();
					slar = ob.getMatr();
					solves = ob.getSolve();
					int n = slar.length;
					
					matr = new JTable(n, n);
					matr.setCellSelectionEnabled(true);
					matr.setFillsViewportHeight(true);
					matr.setMaximumSize(new Dimension(200, 200));
					matr.setRowHeight(197/n);
					matr.setTableHeader(null);
					scrollPane.setViewportView(matr);
					
					solve = new JTable(n, 1);
					solve.setCellSelectionEnabled(true);
					solve.setFillsViewportHeight(true);
					solve.setRowHeight(197/n);
					solve.setTableHeader(null);
					scrollPane_1.setViewportView(solve);
					for (int i = 0; i < slar.length; i++) {
						for (int j = 0; j < slar.length; j++) {
							matr.getModel().setValueAt(slar[i][j], i, j);
						}
					}
					for (int i = 0; i < solves.length; i++) {
						solve.getModel().setValueAt(solves[i], i, 0);
					}
					label_2.setText(ob.readcount());
				} catch (Exception e2) {
					label_2.setText("<html>Файла не знайдено. Спробуйте ще раз.");
				}
				
			}
		});
		button.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				double slar[][] = new double[lenght][lenght];
				double solves[] = new double[lenght];
				for (int i = 0; i < lenght; i++) {
					for (int j = 0; j < lenght; j++) {
						slar[i][j] = Double.parseDouble((String) matr.getModel().getValueAt(i, j));
					}
				}
				for (int i = 0; i < lenght; i++) {
					solves[i] = Double.parseDouble((String) solve.getModel().getValueAt(i, 0));
				}
				SolveSLAR ob = new SolveSLAR();
				label_2.setText(ob.Gaus(slar, solves));
			}
		});
		
	}

}
