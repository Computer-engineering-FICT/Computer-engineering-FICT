package app.view;

import java.awt.FlowLayout;

import javax.swing.ButtonGroup;
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
import javax.swing.JRadioButton;

import app.controller.Controller;
import app.controller.command.RegistrationCommand;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.Category;
import app.model.ContactInformation;
import app.model.Profile;
import app.model.State;

@SuppressWarnings("serial")
/**
 * Клас що реалізує інтерфейс для реєстрації нового користувача
 * @author Vova
 *
 */
public class Registration extends JDialog {
	/**
	 * панель на якій будуть відображатись всі елементи графічного інтерфейсу
	 */
	private final JPanel contentPanel = new JPanel();

	private JTextField telephoneTextField;
	private JTextField emailTextField;
	private JTextField addresTextField;
	private JPasswordField passwordFieldTwo;
	private JPasswordField passwordFieldOne;
	private JTextField loginTextField;
	private ContactInformation info = new ContactInformation();
	private Profile profile = new Profile();
	private Category category = new Category();
	private State state = new State();


	/**
	 * Створення вікна реєстрації.
	 */
	public Registration() {
		setFont(Fonts.getFont());
		setResizable(false);
		setTitle(Languages.getProperty("registrationName"));
		setBounds(100, 100, 450, 300);
		getContentPane().setLayout(null);
		contentPanel.setBounds(0, 0, 434, 229);
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel);
		contentPanel.setLayout(null);

		JLabel labelLogin = new JLabel(Languages.getProperty("login"));
		labelLogin.setFont(Fonts.getFont());
		labelLogin.setBounds(10, 28, 57, 17);
		contentPanel.add(labelLogin);

		JLabel passwordLabel = new JLabel(Languages.getProperty("password"));
		passwordLabel.setFont(Fonts.getFont());
		passwordLabel.setBounds(10, 56, 57, 17);
		contentPanel.add(passwordLabel);

		JLabel repeatPassword = new JLabel(
				Languages.getProperty("EditInfoLabel3"));
		repeatPassword.setFont(Fonts.getFont());
		repeatPassword.setBounds(10, 84, 123, 17);
		contentPanel.add(repeatPassword);

		JLabel telephoneLabel = new JLabel(Languages.getProperty("telephone"));
		telephoneLabel.setFont(Fonts.getFont());
		telephoneLabel.setBounds(10, 112, 123, 17);
		contentPanel.add(telephoneLabel);

		JLabel lblEmail = new JLabel(Languages.getProperty("email"));
		lblEmail.setFont(Fonts.getFont());
		lblEmail.setBounds(10, 140, 123, 17);
		contentPanel.add(lblEmail);

		JLabel labelAddress = new JLabel(Languages.getProperty("address"));
		labelAddress.setFont(Fonts.getFont());
		labelAddress.setBounds(10, 168, 123, 17);
		contentPanel.add(labelAddress);

		JLabel labelTupe = new JLabel("type");
		labelTupe.setFont(Fonts.getFont());
		labelTupe.setBounds(10, 196, 123, 17);
		contentPanel.add(labelTupe);

		telephoneTextField = new JTextField();
		telephoneTextField.setFont(Fonts.getFont());
		telephoneTextField.setColumns(10);
		telephoneTextField.setBounds(143, 112, 108, 20);
		
		contentPanel.add(telephoneTextField);

		emailTextField = new JTextField();
		emailTextField.setFont(Fonts.getFont());
		emailTextField.setColumns(10);
		emailTextField.setBounds(143, 140, 108, 20);
		contentPanel.add(emailTextField);

		addresTextField = new JTextField();
		addresTextField.setFont(Fonts.getFont());
		addresTextField.setColumns(10);
		addresTextField.setBounds(143, 168, 108, 20);
		contentPanel.add(addresTextField);

		passwordFieldTwo = new JPasswordField();
		passwordFieldTwo.setBounds(143, 84, 108, 20);
		contentPanel.add(passwordFieldTwo);

		passwordFieldOne = new JPasswordField();
		passwordFieldOne.setBounds(143, 56, 108, 20);
		contentPanel.add(passwordFieldOne);

		final JRadioButton rdbtnCourier = new JRadioButton(Languages.getProperty("courier"));
		rdbtnCourier.setFont(Fonts.getFont());
		rdbtnCourier.setBounds(139, 195, 109, 23);
		contentPanel.add(rdbtnCourier);

		JRadioButton rdbtnStoreman = new JRadioButton(Languages.getProperty("storeman"));
		rdbtnStoreman.setFont(Fonts.getFont());
		rdbtnStoreman.setBounds(271, 195, 157, 23);
		contentPanel.add(rdbtnStoreman);
		ButtonGroup group = new ButtonGroup();
		group.add(rdbtnStoreman);
		group.add(rdbtnCourier);
		loginTextField = new JTextField();
		loginTextField.setFont(Fonts.getFont());
		loginTextField.setBounds(143, 28, 108, 20);
		contentPanel.add(loginTextField);
		loginTextField.setColumns(10);
		{
			JPanel buttonPane = new JPanel();
			buttonPane.setFont(Fonts.getFont());
			buttonPane.setBounds(0, 229, 434, 33);
			buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
			getContentPane().add(buttonPane);
			{
				JButton okButton = new JButton(Languages.getProperty("okBtn"));
				buttonPane.add(okButton);
				okButton.setFont(Fonts.getFont());
				getRootPane().setDefaultButton(okButton);
				okButton.addActionListener(new ActionListener() {

					@SuppressWarnings("deprecation")
					@Override
					public void actionPerformed(ActionEvent arg0) {
						try {
							if (telephoneTextField.getText().equalsIgnoreCase("")
									|| emailTextField.getText()
									.equalsIgnoreCase("")
									|| addresTextField.getText().equalsIgnoreCase(
											"")
											|| passwordFieldOne.getText().equalsIgnoreCase(
													"")) {
								JOptionPane.showMessageDialog(Registration.this, Languages.getProperty("RgistrationLabel1"), Languages.getProperty("info"), JOptionPane.WARNING_MESSAGE);
							}else{
								
								Integer.parseInt(telephoneTextField.getText());
								if (telephoneTextField.getText().contentEquals("@")){
									throw new NumberFormatException();
								}
								
								Registration.this.state.setState("Active");
								Registration.this.info.setTelephone(telephoneTextField
										.getText());
								Registration.this.info.setAdress(addresTextField
										.getText());
								Registration.this.info.setEmail(emailTextField
										.getText());
								if (rdbtnCourier.isSelected())
									Registration.this.category.setCategory("Courier");
								else
									Registration.this.category.setCategory("Storeman");
								Registration.this.profile.setLogin(loginTextField
										.getText());
								
								@COMMAND(key = "RegistrationCommand")
								@CONTEXT(list = {
										@PARAMETER(key = "Profile", type = Profile.class, optional = true),
										@PARAMETER(key = "Category", type = Category.class, optional = true),
										@PARAMETER(key = "ContactInformation", type = ContactInformation.class, optional = true),
										@PARAMETER(key = "State", type = State.class, optional = true),
										@PARAMETER(key = "password1", type = String.class, optional = true),
										@PARAMETER(key = "password2", type = String.class, optional = true) })
								class cmnd extends RegistrationCommand {
								}
								
								if (passwordFieldOne.getText().equals(
										passwordFieldTwo.getText())) {
									Registration.this.profile
									.setPassword(passwordFieldOne.getText());
									Controller.toController(Registration.this,
											cmnd.class.getAnnotation(CONTEXT.class),
											cmnd.class.getAnnotation(COMMAND.class));
									Registration.this.dispose();
								} else
									JOptionPane.showMessageDialog(null,
											Languages.getProperty("RgistrationLabel2"));
							}
							
							
						} catch (NumberFormatException e) {
							JOptionPane.showMessageDialog(Registration.this,Languages.getProperty("registrMess"), Languages.getProperty("errorMess"), JOptionPane.ERROR_MESSAGE);
						}

					}
				});
			}
			{
				JButton cancelButton = new JButton(Languages.getProperty("cancelBtn"));
				buttonPane.add(cancelButton);
				cancelButton.setFont(Fonts.getFont());
				cancelButton.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent arg0) {
						Object[] objects = new Object[2];
						objects[0] = new String(Languages.getProperty("yesBtn"));
						objects[1] = new String(Languages.getProperty("noBtn"));
						int result = JOptionPane.showOptionDialog(
								Registration.this,
								Languages.getProperty("RgistrationLabel3"),
								Languages.getProperty("info"), JOptionPane.YES_NO_OPTION,
								JOptionPane.QUESTION_MESSAGE, null, objects,
								null);

						if (result == JOptionPane.YES_OPTION) {
							Registration.this.dispose();

						}
					}
				});
			}
		}

	}
/**
 * метод, що повертає контактну інофрмацію
 * @return контактнта інформація
 */
	public ContactInformation getInfo() {
		return info;
	}
/**
 * метод, що встановлює контактну інформацію
 * @param info контактнта інформація
 */
	public void setInfo(ContactInformation info) {
		this.info = info;
	}
/**
 * метод, що повертає профайл
 * @return профайл
 */
	public Profile getProfile() {
		return profile;
	}
/**
 * метод, що встановлює профайл
 * @param profile профайл
 */
	public void setProfile(Profile profile) {
		this.profile = profile;
	}
/**
 * метод що повертає категорію
 * @return категорія
 */
	public Category getCategory() {
		return category;
	}
/**
 * метод що встановлює категорію
 * @param category категорія
 */
	public void setCategory(Category category) {
		this.category = category;
	}
/**
 * метод що повертає стан
 * @return стан
 */
	public State getState() {
		return state;
	}
/**
 * метод, що встановлює стан
 * @param state стан
 */
	public void setState(State state) {
		this.state = state;
	}
	/**
	 * метод що встановлює стиль вікна
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
