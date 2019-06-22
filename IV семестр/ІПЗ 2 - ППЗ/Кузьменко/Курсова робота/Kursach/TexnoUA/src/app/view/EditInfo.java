package app.view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JTextField;
import javax.swing.JPasswordField;

import app.controller.Controller;
import app.controller.command.EditInfoCommand;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.Profile;

/**
 * клас що реалізує інтерфейс редагування інформації користувача
 * 
 * @author Vova
 * 
 */
@SuppressWarnings("serial")
public class EditInfo extends JDialog {
	/**
	 * панель на якісь знаходяться усі елементи інтерфейсу користувача 
	 */
	private final JPanel contentPanel = new JPanel();
	/**
	 * текстове поле для введення адреси
	 */
	private JTextField addresTextField;
	/**
	 * текстове поле для введення електронної пошти
	 */
	private JTextField emailTextField;
	/**
	 * текстове поле для введення логіну
	 */
	private JTextField loginTextFiled;
	/**
	 * текстове поле для старого паролю
	 */
	private JPasswordField passwordOldField;
	/**
	 * текстове поле для введення телефону
	 */
	private JTextField telephoneTextField;
	/**
	 * текстове поле для введення нового паролю
	 */
	private JPasswordField passwordNew1Filed;
	/**
	 * текстове поле для підтврердження нового паролю
	 */
	private JPasswordField passwordNew2Field;
	/**
	 * старий пароль
	 */
	private String oldPassword = Authorisation.getProfile().getPassword();

	/**
	 * створення панелі, виконання команд
	 */
	public EditInfo() {
		setFont(Fonts.getFont());
		setTitle(Languages.getProperty("editInfoTitle"));
		setResizable(false);
		setBounds(100, 100, 450, 364);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		{
			JLabel loginLable = new JLabel(Languages.getProperty("login"));
			loginLable.setFont(Fonts.getFont());
			loginLable.setBounds(24, 11, 92, 26);
			contentPanel.add(loginLable);
		}
		{
			JLabel oldPasswordLable = new JLabel(Languages.getProperty("EditInfoLabel1"));
			oldPasswordLable.setFont(Fonts.getFont());
			oldPasswordLable.setBounds(24, 48, 112, 26);
			contentPanel.add(oldPasswordLable);
		}
		{
			JLabel labelEmail = new JLabel(Languages.getProperty("email"));
			labelEmail.setFont(Fonts.getFont());
			labelEmail.setBounds(24, 159, 92, 26);
			contentPanel.add(labelEmail);
		}
		{
			JLabel labelAddres = new JLabel(Languages.getProperty("address"));
			labelAddres.setFont(Fonts.getFont());
			labelAddres.setBounds(24, 196, 92, 26);
			contentPanel.add(labelAddres);
		}
		{
			addresTextField = new JTextField();
			addresTextField.setFont(Fonts.getFont());
			addresTextField.setBounds(146, 199, 134, 20);
			contentPanel.add(addresTextField);
			addresTextField.setColumns(10);
		}
		{
			emailTextField = new JTextField();
			emailTextField.setFont(Fonts.getFont());
			emailTextField.setColumns(10);
			emailTextField.setBounds(146, 162, 134, 20);
			contentPanel.add(emailTextField);
		}
		{
			loginTextFiled = new JTextField();
			loginTextFiled.setFont(Fonts.getFont());
			loginTextFiled.setColumns(10);
			loginTextFiled.setBounds(146, 11, 134, 20);
			contentPanel.add(loginTextFiled);
		}
		{
			passwordOldField = new JPasswordField();
			passwordOldField.setFont(Fonts.getFont());
			passwordOldField.setBounds(146, 48, 134, 20);
			contentPanel.add(passwordOldField);
		}
		{
			JLabel labelTelephone = new JLabel(Languages.getProperty("telephone"));
			labelTelephone.setFont(Fonts.getFont());
			labelTelephone.setBounds(24, 228, 92, 26);
			contentPanel.add(labelTelephone);
		}
		{
			telephoneTextField = new JTextField();
			telephoneTextField.setFont(Fonts.getFont());
			telephoneTextField.setColumns(10);
			telephoneTextField.setBounds(146, 231, 134, 20);
			contentPanel.add(telephoneTextField);
		}
		{
			JLabel newPasswordLable = new JLabel(Languages.getProperty("EditInfoLabel2"));
			newPasswordLable.setFont(Fonts.getFont());
			newPasswordLable.setBounds(24, 85, 92, 26);
			contentPanel.add(newPasswordLable);
		}
		{
			passwordNew1Filed = new JPasswordField();
			passwordNew1Filed.setBounds(146, 85, 134, 20);
			contentPanel.add(passwordNew1Filed);
		}
		{
			JLabel repeatPasswordLable = new JLabel(Languages.getProperty("EditInfoLabel3"));
			repeatPasswordLable.setFont(Fonts.getFont());
			repeatPasswordLable.setBounds(24, 117, 127, 26);
			contentPanel.add(repeatPasswordLable);
		}
		{
			passwordNew2Field = new JPasswordField();
			passwordNew2Field.setBounds(146, 122, 134, 20);
			contentPanel.add(passwordNew2Field);
		}
		{
			JPanel buttonPane = new JPanel();
			buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
			getContentPane().add(buttonPane, BorderLayout.SOUTH);
			{
				JButton okButton = new JButton(Languages.getProperty("okBtn"));
				buttonPane.add(okButton);
				getRootPane().setDefaultButton(okButton);
				okButton.addActionListener(new ActionListener() {

					@SuppressWarnings("deprecation")
					@Override
					public void actionPerformed(ActionEvent e) {
						try {
							Integer.parseInt(telephoneTextField.getText());
							if (emailTextField.getText().contentEquals("@"))
								throw new NumberFormatException();
							if (passwordOldField.getText().equalsIgnoreCase(
									EditInfo.this.oldPassword)) {
								if (passwordNew1Filed.getText().equalsIgnoreCase(
										passwordNew2Field.getText()) == true) {
									
									@COMMAND(key = "editInfo")
									@CONTEXT(list = {
											@PARAMETER(key = "profile", type = Profile.class, optional = true),
											@PARAMETER(key = "password", type = String.class, optional = true),
											@PARAMETER(key = "email", type = String.class, optional = true),
											@PARAMETER(key = "addres", type = String.class, optional = true),
											@PARAMETER(key = "telephone", type = String.class, optional = true) })
									class cmnd extends EditInfoCommand {
									}
									Controller.toController(
											EditInfo.this,
											cmnd.class.getAnnotation(CONTEXT.class),
											cmnd.class.getAnnotation(COMMAND.class));
									EditInfo.this.dispose();
								} else
									JOptionPane.showMessageDialog(null,
											Languages.getProperty("EditInfoLabel4"));
								
							} else
								JOptionPane.showMessageDialog(null,
										Languages.getProperty("EditInfoLabel5"));
							
						} catch (NumberFormatException e2) {
							JOptionPane.showMessageDialog(EditInfo.this,Languages.getProperty("registrMess"), Languages.getProperty("errorMess"), JOptionPane.ERROR_MESSAGE);
						}

					}
				});
			}
			{
				JButton cancelButton = new JButton(Languages.getProperty("cancelBtn"));
				buttonPane.add(cancelButton);
				cancelButton.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent e) {
						// TODO Auto-generated method stub
						EditInfo.this.dispose();
					}
				});
			}
		}
		setVisible(true);
	}
	/**
	 * метод повертає логін
	 * @return логін
	 */
	public String getLogin() {
		return loginTextFiled.getText();
	}
/**
 * метод повертає email
 * @return email
 */
	public String getEmail() {
		return emailTextField.getText();
	}
/**
 * метод повертає адресу
 * @return адреса
 */
	public String getAddres() {
		return addresTextField.getText();
	}
/**
 * метод повретає телефон
 * @return номер телефону
 */
	public String getTelephone() {
		return telephoneTextField.getText();
	}
/**
 * метод повертає пароль
 * @return пароль
 */
	@SuppressWarnings("deprecation")
	public String getPassword() {
		return passwordNew1Filed.getText();
	}
/**
 * становлення стилю вікна
 * @param className назва стилю
 */
	public static void setStyle(String className) {
		try {
			UIManager.setLookAndFeel(className);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedLookAndFeelException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
