package Lab5;

import java.awt.Color;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;

import java.awt.Font;

import javax.swing.JScrollBar;

import java.awt.Choice;

import javax.swing.JFormattedTextField;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JSpinner;
import javax.swing.SpinnerNumberModel;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.JScrollPane;
import javax.swing.table.DefaultTableModel;

import bsh.commands.dir;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class lab5 {

	private JFrame frame;
	private JTable table;
	JSpinner spinner;
	private JScrollPane scrollPane;
	private JLabel label_2;
	private JButton btnNewButton;
	private JLabel label_3;
	private JTable table_1;
	private JScrollPane scrollPane_1;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					lab5 window = new lab5();
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
	public lab5() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setTitle("\u041B\u0430\u0431\u043E\u0440\u0430\u0442\u043E\u0440\u043D\u0430 \u21165. \u041F\u043E\u043F\u0435\u043D\u043A\u0430 \u0420\u0443\u0441\u043B\u0430\u043D\u0430. \u041C\u0435\u0442\u043E\u0434\u043E\u043C \u0413\u0430\u0443\u0441\u0430 \u0437 \u043E\u0434\u0438\u043D\u0438\u0447\u043D\u043E\u044E \u0434\u0456\u0430\u0433\u043E\u043D\u0430\u043B\u043B\u044E");
		frame.setBounds(100, 100, 818, 380);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JLabel label = new JLabel("\u0420\u043E\u0437\u0432'\u044F\u0437\u0430\u043D\u043D\u044F \u0421\u041B\u0410\u0420 \u043C\u0435\u0442\u043E\u0434\u043E\u043C \u0413\u0430\u0443\u0441\u0430-\u0416\u043E\u0440\u0434\u0430\u043D\u0430 (\u0437 \u043E\u0434\u0438\u043D\u0438\u0447\u043D\u043E\u044E \u0434\u0456\u0430\u0433\u043E\u043D\u0430\u043B\u043B\u044E)");
		label.setFont(new Font("Times New Roman", Font.BOLD, 22));
		label.setBounds(37, 0, 755, 64);
		frame.getContentPane().add(label);
		
		JLabel label_1 = new JLabel("\u0412\u0432\u0435\u0434\u0456\u0442\u044C \u043A\u0456\u043B\u044C\u043A\u0456\u0441\u0442\u044C \u043D\u0435\u0432\u0456\u0434\u043E\u043C\u0438\u0445 \u0442\u0430 \u043A\u0456\u043B\u044C\u043A\u0456\u0441\u0442\u044C \u0440\u0456\u0432\u043D\u044F\u043D\u044C \u0456 \u043D\u0430\u0442\u0438\u0441\u043D\u0456\u0442\u044C \u043E\u043A\r\n");
		label_1.setFont(new Font("Times New Roman", Font.ITALIC, 18));
		label_1.setBounds(10, 53, 519, 42);
		frame.getContentPane().add(label_1);
		
		spinner = new JSpinner();
		spinner.setFont(new Font("Times New Roman", Font.BOLD, 14));
		spinner.setModel(new SpinnerNumberModel(2, 2, 9, 1));
		spinner.setBounds(539, 61, 39, 29);
		frame.getContentPane().add(spinner);
		
		JButton btnOk = new JButton("OK");
		btnOk.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setModel();
			}
		});
		btnOk.setFont(new Font("Times New Roman", Font.BOLD, 18));
		btnOk.setBounds(592, 53, 76, 42);
		frame.getContentPane().add(btnOk);
		
		scrollPane = new JScrollPane();
		scrollPane.setBounds(37, 164, 307, 166);
		frame.getContentPane().add(scrollPane);
		
		table = new JTable();
		scrollPane.setViewportView(table);
		
		label_2 = new JLabel("\u0421\u0438\u0441\u0442\u0435\u043C\u0430:");
		label_2.setFont(new Font("Times New Roman", Font.BOLD | Font.ITALIC, 18));
		label_2.setBounds(123, 106, 93, 42);
	    label_2.setVisible(false);
		frame.getContentPane().add(label_2);
		
		btnNewButton = new JButton("\u0420\u043E\u0437\u0432'\u044F\u0437\u0430\u0442\u0438\r\n");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try{
					
				DefaultTableModel dtm = (DefaultTableModel) table.getModel();
				int nRow = dtm.getRowCount(), nCol = dtm.getColumnCount();
			    Object[][] tableData = new Object[nRow][nCol];
			    for (int i = 0 ; i < nRow ; i++){
			        for (int j = 0 ; j < nCol ; j++){
			            tableData[i][j] = dtm.getValueAt(i,j);
			            if (tableData[i][j]==null){
			            	int a=5/0;
			            }
			        }
			    }   
			    
			    double [][] m0=new double [nRow] [nCol-1];
			    for (int i = 0 ; i < nRow ; i++){
			        for (int j = 0 ; j < nCol-1 ; j++){
			            m0[i][j]=Double.parseDouble(tableData[i][j].toString());
			        }
			    } 
			    
			    double [] v0=new double [nRow];
			    
			    for (int i = 0; i < v0.length; i++) {
					v0[i]=Double.parseDouble(tableData[i][nCol-1].toString());
				}
			    
			    
			    Matrix matrix = new Matrix(m0);
				Vector free = new Vector(v0);
				System.out.println(matrix);
				System.out.println(free);
				
				GaussJordano GS=new GaussJordano ();
				
				Vector result = GS.solve(matrix, free, 4);
				System.out.println(matrix);
				System.out.println(result);
				Object [] res=new Object [result.getVector().length];
				for (int i = 0; i < res.length; i++) {
					res[i]=new Object ();
					res[i]=""+result.getVector()[i];
				}
				
				
				
				Object [] colName=new Object [res.length];
				for (int i = 0; i < colName.length; i++) {
					colName[i]="X"+(i+1);					
				}
				Object [][]data=new Object [1] [res.length];
				for (int i = 0; i < res.length; i++) {
					data[0][i]=res[i];
				}
				System.out.println(result);
				DefaultTableModel model=new DefaultTableModel (data, colName);
				table_1.setModel(model);
				label_3.setVisible(true);
				scrollPane_1.setVisible(true);
				
			    
				} catch(Exception e2){
					JOptionPane.showMessageDialog(null, "Перевірте правильність вводу даних");
				}
			}
		});
		btnNewButton.setFont(new Font("Times New Roman", Font.ITALIC, 24));
		btnNewButton.setBounds(464, 127, 237, 56);
		btnNewButton.setVisible(false);
		frame.getContentPane().add(btnNewButton);
		
		label_3 = new JLabel("\u0412\u0456\u0434\u043F\u043E\u0432\u0456\u0434\u044C\r\n:");
		label_3.setFont(new Font("Times New Roman", Font.BOLD | Font.ITALIC, 22));
		label_3.setBounds(525, 194, 109, 64);
		label_3.setVisible(false);
		frame.getContentPane().add(label_3);
		
		scrollPane_1 = new JScrollPane();
		scrollPane_1.setBounds(374, 248, 389, 82);
		frame.getContentPane().add(scrollPane_1);
		
		table_1 = new JTable();
		scrollPane_1.setViewportView(table_1);
		
		JButton btnNewButton_1 = new JButton("\u041E\u0447\u0438\u0441\u0442\u0438\u0442\u0438");
		btnNewButton_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				label_3.setVisible(false);
				scrollPane_1.setVisible(false);
				btnNewButton.setVisible(false);
				scrollPane.setVisible(false);
				label_2.setVisible(false);
			}
		});
		btnNewButton_1.setFont(new Font("Times New Roman", Font.ITALIC, 14));
		btnNewButton_1.setBounds(678, 53, 109, 42);
		frame.getContentPane().add(btnNewButton_1);
		scrollPane_1.setVisible(false);
		scrollPane.setVisible(false);
		JFormattedTextField tf = ((JSpinner.DefaultEditor) spinner.getEditor()).getTextField();
	    tf.setEditable(false);
	    tf.setBackground(Color.white);
	}
	
	public void setModel (){		
		int len;
		Integer currentValue = (Integer) spinner.getValue();
		len=currentValue.intValue();
		Object [] colName=new Object [len+1];
		for (int i = 0; i < colName.length; i++) {
			colName[i]="X"+(i+1);
			if(i==colName.length-1){
				colName[i]="b";
			}
		}
		Object [][]data=new Object [len] [len+1];
		DefaultTableModel model=new DefaultTableModel (data, colName);
		table.setModel(model);
		scrollPane.setVisible(true);
		label_2.setVisible(true);		
		btnNewButton.setVisible(true);
	}
}
