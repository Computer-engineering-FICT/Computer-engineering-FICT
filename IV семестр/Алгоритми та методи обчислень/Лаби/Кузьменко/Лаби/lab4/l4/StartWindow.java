package l4;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.border.LineBorder;
import javax.swing.border.MatteBorder;

public class StartWindow extends JFrame {
	private static final long serialVersionUID = 1L;
	private JTextField textField_a;
	private JTextField textField_b;
	private JTextField textField_e;
	private String a = "-6";
	private String b = "0";
	private String eps = "0.0001";
	private Logic l;
	private Plot p;
	
	
	
	public static void main(String[] args) {
		StartWindow st = new StartWindow();								
	}
	

	public StartWindow() {		
		setTitle("\u041B\u0430\u0431\u043E\u0440\u0430\u0442\u043E\u0440\u043D\u0430 \u0440\u043E\u0431\u043E\u0442\u0430 \u2116 4");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 600, 290);
		getContentPane().setLayout(new GridLayout(3, 1, 0, 0));
		
		JLabel lbla = new JLabel("\u0412\u043A\u0430\u0436\u0456\u0442\u044C \u0432\u0456\u0434\u0440\u0456\u0437\u043E\u043A [a; b] \u0434\u043B\u044F \u043F\u043E\u0448\u0443\u043A\u0443 \u043A\u043E\u0440\u0435\u043D\u044F \u0444\u0443\u043D\u043A\u0446\u0456\u0457 f(x) = x^3 - 2 * x^2 - 7 \u0456 \u0442\u043E\u0447\u043D\u0456\u0441\u0442\u044C \u0440\u0435\u0437\u0443\u043B\u044C\u0442\u0430\u0442\u0443");
		lbla.setBorder(new MatteBorder(1, 1, 0, 1, (Color) new Color(0, 0, 0)));
		lbla.setHorizontalTextPosition(SwingConstants.CENTER);
		lbla.setHorizontalAlignment(SwingConstants.CENTER);
		getContentPane().add(lbla);
		
		JPanel panel = new JPanel();
		panel.setBorder(new LineBorder(new Color(0, 0, 0)));
		getContentPane().add(panel);
		panel.setLayout(new GridLayout(0, 2, 0, 0));
		
		JLabel label_a = new JLabel("\u0417\u043D\u0430\u0447\u0435\u043D\u043D\u044F \u043B\u0456\u0432\u0457 \u043C\u0435\u0436\u0456 (a)");
		label_a.setBorder(new MatteBorder(0, 0, 1, 1, (Color) new Color(0, 0, 0)));
		label_a.setHorizontalAlignment(SwingConstants.CENTER);
		panel.add(label_a);
		
		textField_a = new JTextField();
		textField_a.setText("-6");
		textField_a.addKeyListener(new KeyAdapter() {
			@Override
			public void keyReleased(KeyEvent arg0) {
				setA(textField_a.getText());
			}
		});
		textField_a.setBorder(new MatteBorder(0, 0, 1, 0, (Color) new Color(0, 0, 0)));
		textField_a.setToolTipText("");
		textField_a.setHorizontalAlignment(SwingConstants.CENTER);
		panel.add(textField_a);
		textField_a.setColumns(10);
		
		JLabel label_b = new JLabel("\u0417\u043D\u0430\u0447\u0435\u043D\u043D\u044F \u043F\u0440\u0430\u0432\u043E\u0457 \u043C\u0435\u0436\u0456 (b)");
		label_b.setBorder(new MatteBorder(0, 0, 1, 1, (Color) new Color(0, 0, 0)));
		label_b.setHorizontalAlignment(SwingConstants.CENTER);
		panel.add(label_b);
		
		textField_b = new JTextField();
		textField_b.setText("0");
		textField_b.addKeyListener(new KeyAdapter() {
			@Override
			public void keyReleased(KeyEvent e) {
				setB(textField_b.getText());
			}
		});
		textField_b.setBorder(new MatteBorder(0, 0, 1, 0, (Color) new Color(0, 0, 0)));
		textField_b.setHorizontalAlignment(SwingConstants.CENTER);
		panel.add(textField_b);
		textField_b.setColumns(10);
		
		JLabel label_e = new JLabel("\u0422\u043E\u0447\u043D\u0456\u0441\u0442\u044C (e)");
		label_e.setBorder(new MatteBorder(0, 0, 0, 1, (Color) new Color(0, 0, 0)));
		label_e.setHorizontalAlignment(SwingConstants.CENTER);
		panel.add(label_e);
		
		textField_e = new JTextField();
		textField_e.setText("0.0001");
		textField_e.addKeyListener(new KeyAdapter() {
			@Override
			public void keyReleased(KeyEvent e) {
				setE(textField_e.getText());
			}
		});
		textField_e.setBorder(new MatteBorder(0, 0, 0, 0, (Color) new Color(0, 0, 0)));
		textField_e.setHorizontalAlignment(SwingConstants.CENTER);
		panel.add(textField_e);
		textField_e.setColumns(10);
		
		JPanel panel_OK = new JPanel();
		panel_OK.setName("");
		panel_OK.setToolTipText("");
		getContentPane().add(panel_OK);
		panel_OK.setLayout(null);
		
		JButton button_OK = new JButton("\u041E\u041A");
		button_OK.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseReleased(MouseEvent arg0) {
				l = new Logic(Double.parseDouble(getA()), Double.parseDouble(getB()), Double.parseDouble(getE()));
				
				if (l.func(Double.parseDouble(getA())) * l.func(Double.parseDouble(getB())) < 0) {
					l.find_x();
					p = new Plot(l);
				} else {
					JOptionPane.showMessageDialog(null,
						    "На відрізку [" + getA() + "; " + getB() + "] немає кореня.");
				}
			}
		});
		button_OK.setBorder(new LineBorder(new Color(0, 0, 0)));
		button_OK.setHorizontalTextPosition(SwingConstants.CENTER);
		button_OK.setBounds(258, 26, 80, 25);
		panel_OK.add(button_OK);
		setVisible(true);
	}


	public String getA() {
		return a;
	}


	public void setA(String a) {
		this.a = a;
	}


	public String getB() {
		return b;
	}


	public void setB(String b) {
		this.b = b;
	}


	public String getE() {
		return eps;
	}


	public void setE(String e) {
		this.eps = e;
	}
}
