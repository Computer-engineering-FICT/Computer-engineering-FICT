import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JButton;
import javax.swing.JTextArea;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JTextField;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JMenu;
import javax.swing.JRadioButtonMenuItem;
import java.awt.CardLayout;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;


public class lab1 {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					lab1 window = new lab1();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	
	public static void write(String fileName, String text) {
	    //Определяем файл
	    File file = new File(fileName);
	 
	    try {
	        //проверяем, что если файл не существует то создаем его
	        if(!file.exists()){
	            file.createNewFile();
	        }
	 
	        //PrintWriter обеспечит возможности записи в файл
	        PrintWriter out = new PrintWriter(file.getAbsoluteFile());
	 
	        try {
	            //Записываем текст у файл
	            out.print(text);
	        } finally {
	            //После чего мы должны закрыть файл
	            //Иначе файл не запишется
	            out.close();
	        }
	    } catch(IOException e) {
	        throw new RuntimeException(e);
	    }
	}
	
	public static String read(String fileName) throws FileNotFoundException {
	    //Этот спец. объект для построения строки
	    StringBuilder sb = new StringBuilder();
	 
	    exists(fileName);
	 
	    try {
	        File file =new File(fileName);;
			//Объект для чтения файла в буфер
	        BufferedReader in = new BufferedReader(new FileReader( file.getAbsoluteFile()));
	        try {
	            //В цикле построчно считываем файл
	            String s;
	            while ((s = in.readLine()) != null) {
	                sb.append(s);
	                sb.append("\n");
	            }
	        } finally {
	            //Также не забываем закрыть файл
	            in.close();
	        }
	    } catch(IOException e) {
	        throw new RuntimeException(e);
	    }
	 
	    //Возвращаем полученный текст с файла
	    return sb.toString();
	}
	
	private static void exists(String fileName) throws FileNotFoundException {
	    File file = new File(fileName);
	    if (!file.exists()){
	        throw new FileNotFoundException(file.getName());
	    }
	}

	/**
	 * Create the application.
	 */
	public lab1() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setTitle("\u041B\u0430\u0431\u043E\u0440\u0430\u0442\u043E\u0440\u043D\u0430 \u21161 \u041F\u043E\u043F\u0435\u043D\u043A\u0430 \u0420\u0443\u0441\u043B\u0430\u043D\u0430. \u0412\u0430\u0440\u0456\u0430\u043D\u0442 25");
		frame.setBounds(100, 100, 632, 372);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JButton button = new JButton("\u041B\u0456\u043D\u0456\u0439\u043D\u0438\u0439 ");
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				
				liner LineAlg=new liner();
				LineAlg.setVisible(true);
							
			}
		});
		button.setFont(new Font("Times New Roman", Font.BOLD, 25));
		button.setBounds(35, 74, 239, 66);
		frame.getContentPane().add(button);
		
		JButton button_1 = new JButton("\u0426\u0438\u043A\u043B\u0456\u0447\u043D\u0438\u0439");
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				Cyclic cycl=new  Cyclic();
				cycl.setVisible(true);
			}
		});
		button_1.setFont(new Font("Times New Roman", Font.BOLD, 25));
		button_1.setBounds(321, 74, 239, 66);
		frame.getContentPane().add(button_1);
		
		JButton button_2 = new JButton("\u0429\u043E \u0440\u043E\u0437\u0433\u0430\u043B\u0443\u0436\u0443\u0454\u0442\u044C\u0441\u044F");
		button_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {				
				branchingOut brancOut=new branchingOut();
				brancOut.setVisible(true);
			}
		});
		
		button_2.setFont(new Font("Times New Roman", Font.BOLD, 25));
		button_2.setBounds(155, 176, 287, 88);
		frame.getContentPane().add(button_2);
		
		JLabel label = new JLabel("");
		label.setBounds(134, 11, 0, 0);
		frame.getContentPane().add(label);
		
		JLabel label_1 = new JLabel("\u0410\u043B\u0433\u043E\u0440\u0438\u0442\u043C\u0438:");
		label_1.setFont(new Font("Times New Roman", Font.BOLD, 25));
		label_1.setBounds(218, 27, 133, 29);
		frame.getContentPane().add(label_1);
	}
}
