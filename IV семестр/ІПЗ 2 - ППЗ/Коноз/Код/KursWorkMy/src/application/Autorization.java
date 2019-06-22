package application;

import java.awt.*;
import java.awt.event.*;
import java.util.Hashtable;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import configuration.CompositeStructure.*;
import controller.*;
import controller.Factory.CommandFactory;
import dao.CRUIDRealisation;

/**
 * ���� ������ �������� ���� �����������.
 * @author ����� ����� 
 */
public class Autorization extends JFrame {

	/**
	 * ������� ������ ����.
	 */
	private final JPanel contentPanel = new JPanel();
	/**
	 * ���� ��� �������� �����.
	 */
	private JTextField textField;
	/**
	 * ���� ��� �������� ������.
	 */
	private JPasswordField passwordField;
	/**
	 * ��������� �� ������ ����.
	 */
	private Autorization link = this;
	/**
	 * ̳��� � ������ "����"
	 */
	private JLabel lblEnterLoginAnd;
	/**
	 * ������ ��� ����������� �� ��� ����� ������.
	 */
	private JButton btnForgotPassword;
	/**
	 * ̳��� � ������� "������".
	 */
	private JLabel lblPassword;
	/**
	 * ������ ��� ��������� � �������.
	 */
	private JButton btnLogin;
	/**
	 * �������, � ��� ����������� ������ ����������
	 */
	private Hashtable<String, String> context;

	/**
	 * ������ ��������
	 */
	public static void main(String[] args) {
		try {
			SwingUtilities.invokeLater(new Runnable() {
				
				
				@Override
				public void run() {
					new Autorization();
					
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * ��������� � ������������ ���������� ����.
	 */
	public Autorization() {
		Controller.getController().dao = new CRUIDRealisation();
		CompositeComponent comp = new CompositePropery();
		comp.load("D:\\DatabaseClient\\mainConfig.xml");
		AppConfiguration appConfig = AppConfiguration.getAppConfiguration(comp);
		try {
			Controller.getController().dao.open(appConfig);
		}catch(Exception e){
			System.out.println("kurwa!");
			e.printStackTrace();
		}
		this.context = ContextUtils.loadContext("Autorization");
		setIcon();
		try {
			CompositeComponent ob = AppConfiguration.getAppConfiguration()
					.getProperties("ProgramTheme");
			UIManager.setLookAndFeel(ob.getProperty("theme"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		setTitle(context.get("title"));
		setBounds(100, 100, 282, 302);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		JLabel lblLogin = new JLabel(context.get("lblLogin"));
		lblLogin.setBounds(63, 11, 131, 14);
		contentPanel.add(lblLogin);

		initComponents();
		allocateComponents();

		btnLogin.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				EventQueue.invokeLater(new Runnable() {
					public void run() {
						ContextForCommand context = new ContextForCommand();
						context.put("proprietor", link);
						context.put("login", textField.getText());
						String pass = new String();
						for (char ch : passwordField.getPassword()) {
							pass += ch;
						}
						context.put("password", pass);
						Controller.getController().execute(context,
								CommandFactory.AUTORIZATION);
					}
				});

			}
		});

		btnForgotPassword.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				lblEnterLoginAnd.setText(context.get("lblEnterLoginAnd"));

			}
		});
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);

	}

	/**
	 * ����������� ����������.
	 */
	private void initComponents() {
		textField = new JTextField();
		textField.setBounds(63, 30, 131, 25);
		textField.setColumns(10);

		lblPassword = new JLabel(context.get("lblPassword"));
		lblPassword.setBounds(63, 61, 131, 14);

		passwordField = new JPasswordField();
		passwordField.setBounds(63, 78, 131, 25);

		btnLogin = new JButton(context.get("btnLogin"));
		btnLogin.setBounds(63, 109, 131, 23);

		btnForgotPassword = new JButton(context.get("btnForgotPassword"));
		btnForgotPassword.setBounds(63, 143, 131, 23);

		lblEnterLoginAnd = new JLabel(context.get("lblEnterLoginAndPassword"));
		lblEnterLoginAnd.setHorizontalAlignment(SwingConstants.CENTER);
		lblEnterLoginAnd.setBounds(10, 177, 246, 76);

	}

	/**
	 * ��������� ���������� � ���������� ���.
	 */
	private void allocateComponents() {
		contentPanel.add(textField);
		contentPanel.add(lblPassword);
		contentPanel.add(passwordField);
		contentPanel.add(btnLogin);
		contentPanel.add(btnForgotPassword);
		contentPanel.add(lblEnterLoginAnd);
	}

	/**
	 * ����� ��� ����������� ��'����. ��������������� ��� ��������� ����������
	 * ��������� ������� �������������. ������ ���������� ���� �����������.
	 * 
	 * @param solution
	 *            ���� �����������.
	 */
	public void getSolution(int solution) {
		if (solution == 3) {
		try {
			setVisible(false);
			SwingUtilities.invokeLater(new Runnable() {
				
				@Override
				public void run() {
					new MainFrame();
					
				}
			});

		} catch (Exception e) {
			e.printStackTrace();
		}
		} else if (solution == 2) {
			lblEnterLoginAnd
			.setText(context.get("StoremanError"));
		} else if (solution == 1) {
		   lblEnterLoginAnd
		   .setText(context.get("CustomerError"));
		} else {
		   lblEnterLoginAnd.setText(context.get("AnotherError"));
		}
	}

	/**
	 * ����� ���������� ��������� �� ����
	 */
	private void setIcon() {
		ImageIcon icon = new ImageIcon("D:\\DatabaseClient\\icon.png");
		setIconImage(icon.getImage());
	}
}
