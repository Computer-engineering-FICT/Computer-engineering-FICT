package Kursach;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JScrollPane;

import net.proteanit.sql.DbUtils;

import com.mysql.jdbc.PreparedStatement;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Time;
import javax.swing.JTextField;

public class Smpl {
	JButton btnLoadTable = new JButton("Load");
	public Connection connection = null;
	private JFrame frame;
	private JTable table;
	private JScrollPane scrollPane;
	private JButton btnNewButton;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Smpl window = new Smpl();
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
	public Smpl() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 604, 407);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		btnLoadTable.addActionListener(new ActionListener() {
			private Statement statement;

			public void actionPerformed(ActionEvent e) {
				String query = "select*from profile"; 
				statement = null;
				try {	
							 
				statement = connection.createStatement();
				 ResultSet rs = statement.executeQuery(query);
					
					table.setModel(DbUtils.resultSetToTableModel(rs));
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			   
				
			}
		});
		
		
		btnLoadTable.setEnabled(false);
		btnLoadTable.setBounds(263, 24, 200, 50);
		frame.getContentPane().add(btnLoadTable);
		
		scrollPane = new JScrollPane();
		scrollPane.setEnabled(true);
		scrollPane.setBounds(190, 131, 388, 209);
		frame.getContentPane().add(scrollPane);
		
		table = new JTable();
		scrollPane.setViewportView(table);
		
		btnNewButton = new JButton("Connection");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				try {
					Class.forName("com.mysql.jdbc.Driver");
					connection = DriverManager.getConnection(
							"jdbc:mysql://localhost/compDB", "root", "1111");
					JOptionPane.showMessageDialog(null, "З'єднання встановлено");
					btnLoadTable.setEnabled(true);
				} catch (Exception e2) {
					JOptionPane.showMessageDialog(null, "ОУЧ");
				}
			}
		});
		btnNewButton.setBounds(21, 24, 159, 50);
		frame.getContentPane().add(btnNewButton);
	}
}
