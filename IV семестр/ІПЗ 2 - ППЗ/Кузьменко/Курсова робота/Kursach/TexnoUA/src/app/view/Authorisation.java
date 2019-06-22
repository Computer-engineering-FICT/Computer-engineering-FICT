package app.view;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.ComponentEvent;
import java.awt.event.ComponentListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JPasswordField;

import app.controller.command.annotation.*;
import app.controller.Controller;
import app.controller.command.AutorisationCommand;
import app.controller.command.annotation.CONTEXT;
import app.model.*;


/**
 * клас що реалізує інтерфейс авторизації
 * 
 * @author Vova
 * 
 */
/**
 * @author Vova
 *
 */
@SuppressWarnings("serial")
public class Authorisation extends JFrame {
	/**
	 * Текуща інфоррація користувача
	 */
	private static Profile profile = new Profile();
	/**
	 * стан текущого користувача
	 */
	private State state = new State();
	/**
	 * категорія текущого користувача
	 */
	private static Category category = new Category();
	/**
	 * основна панель
	 */
	private final JPanel contentPanel = new JPanel();
	/**
	 * поле для вводу тесту
	 */
	private JTextField loginTextField;
	/**
	 * поле для вводу пароля
	 */
	private JPasswordField passwordField;
	
	/**
	 * мітка для логіну
	 */
	JLabel login = new JLabel(Languages.getProperty("login"));
	/**
	 * мітка для пароля
	 */
	JLabel password = new JLabel(Languages.getProperty("password"));
	/**
	 * мітка для кнопки реєстрації
	 */
	JButton registrationButton = new JButton(Languages.getProperty("registrationBtn"));
	/**
	 * мітка для ктопки ОК
	 */
	JButton okButton = new JButton(Languages.getProperty("okBtn"));
	/**
	 * міткадля кнопки відміна
	 */
	JButton cancelButton = new JButton(Languages.getProperty("cancelBtn"));
	


	/**
	 * конструктор вікна. Додає до панелі усі елементи.
	 */
	public Authorisation() {
		setMinimumSize(new Dimension(450, 300));
		Authorisation.this.setFont(Fonts.getFont());
		//setResizable(false);
		setTitle(Languages.getProperty("authorisationName"));
		setBounds(100, 100, 450, 300);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		addComponentListener(new ComponentListener() {
			
			@Override
			public void componentShown(ComponentEvent arg0) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void componentResized(ComponentEvent arg0) {
				// TODO Auto-generated method stub
				Dimension s = Authorisation.this.getSize();
				double h = s.height;
				double w = s.width;
				login.setBounds((int) (w/4), (int) (h/6), 59, 30);
				password.setBounds((int) (w/4), (int) (h/3.5), 59, 30);
				loginTextField.setBounds((int) (w/2.5), (int) (h/6), 117, 30);
				passwordField.setBounds((int) (w/2.5), (int) (h/3.5), 117, 30);
				
			}
			
			@Override
			public void componentMoved(ComponentEvent arg0) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void componentHidden(ComponentEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
		
		{
			login.setFont(Fonts.getFont());
			contentPanel.add(login);
		}
		{
			password.setFont(Fonts.getFont());
			contentPanel.add(password);
		}
		{
			loginTextField = new JTextField();
			loginTextField.setFont(Fonts.getFont());
			contentPanel.add(loginTextField);
			loginTextField.setColumns(10);

		}
		{
			passwordField = new JPasswordField();
			contentPanel.add(passwordField);

		}
		;
		{
			JPanel buttonPane = new JPanel();
			buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
			getContentPane().add(buttonPane, BorderLayout.SOUTH);
			{
				registrationButton.setFont(Fonts.getFont());
				registrationButton.addActionListener(new ActionListener() {
					public void actionPerformed(ActionEvent arg0) {
						Registration rgstr = new Registration();
						rgstr.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
						rgstr.addWindowListener(new MyWindowsListener());
						rgstr.setVisible(true);

					}
				});
				buttonPane.add(registrationButton);
				{
					okButton.setFont(Fonts.getFont());
					buttonPane.add(okButton);
					getRootPane().setDefaultButton(okButton);
					okButton.addActionListener(new ActionListener() {

						@SuppressWarnings({ "static-access", "deprecation" })
						@Override
						public void actionPerformed(ActionEvent arg0) {
							if (Authorisation.this.profile == null){
								Authorisation.this.profile = new Profile();
							}
							Authorisation.this.profile.setLogin(loginTextField
									.getText());
					
							Authorisation.this.profile
									.setPassword(passwordField.getText());

							@COMMAND(key = "AutorisationCmnd")
							@CONTEXT(list = {
									@PARAMETER(key = "login", type = String.class, optional = true),
									@PARAMETER(key = "password", type = String.class, optional = true) })
							class cmd extends AutorisationCommand {

							}
							Controller.toController(Authorisation.this,
									cmd.class.getAnnotation(CONTEXT.class),
									cmd.class.getAnnotation(COMMAND.class));

							category = Authorisation.this.getCategory();

						}

					});
				}
			}
			{
				buttonPane.add(cancelButton);
				cancelButton.setFont(Fonts.getFont());
				cancelButton.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent arg0) {
						Object[] objects = new Object[2];
						objects[0] = new String(Languages.getProperty("yesBtn"));
						objects[1] = new String(Languages.getProperty("noBtn"));
						int result = JOptionPane.showOptionDialog(
								Authorisation.this,
								Languages.getProperty("autorisLabel1"),
								Languages.getProperty("info"), JOptionPane.YES_NO_OPTION,
								JOptionPane.QUESTION_MESSAGE, null, objects,
								null);

						if (result == JOptionPane.YES_OPTION) {
							Authorisation.this.setVisible(false);
							Authorisation.this.dispose();
							try {
								Controller.getDao().close();
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							System.exit(0);
						}

					}
				});

			}

		}
	}

	/**
	 * метод що оновлює модель
	 * 
	 * @param objects
	 *            дані для оновлення
	 */
	@SuppressWarnings("static-access")
	public void update(Object... objects) {
		Authorisation.this.profile = (Profile) objects[0];
		Authorisation.this.category = (Category) objects[1];
		JOptionPane.showMessageDialog(null, objects[2]);
		if (Authorisation.this.category == null
				&& Authorisation.this.profile == null) {
			
			Authorisation.this.dispose();
			Authorisation.this.setVisible(false);
			new Authorisation().setVisible(true);
		} else {
			if (Authorisation.this.category.getCategory().equalsIgnoreCase(
					"Administrator")
					|| Authorisation.this.category.getCategory()
							.equalsIgnoreCase("Client")) {
				Authorisation.this.setVisible(false);
				Authorisation.this.dispose();
				new Authorisation().setVisible(true);
			} else {
				Authorisation.this.dispose();
				final MainFrame frame = new MainFrame();
				frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
				frame.addWindowListener(new MyWindowsListener());
				frame.setVisible(true);
			}
		}
	}

	/**
	 * метод повертає стан
	 * 
	 * @return стан
	 */
	public State getStateAuth() {
		return this.state;
	}

	
	/**
	 * метод встановлює стан
	 * 
	 * @param state
	 *            стан
	 */
	public void setState(State state) {
		this.state = state;
	}

	/**
	 * метод повертає категорі
	 * 
	 * @return категорія
	 */
	public static Category getCategory() {
		return Authorisation.category;
	}

	/**
	 * меьод встановлює категорію
	 * 
	 * @param category
	 *            категорія
	 */
	@SuppressWarnings("static-access")
	public void setCategory(Category category) {

		this.category = category;
	}

	
	/**
	 * метод встановлює інформацію про користувача - профайл
	 * 
	 * @param profile
	 *            профайл
	 */
	
	public static void setProfile(Profile profile) {
		Authorisation.profile = profile;

	}

	/**
	 * метод повертає інформацію про користувача
	 * 
	 * @return профайл
	 */
	public static Profile getProfile() {
		return Authorisation.profile;
	}
	
	

}
