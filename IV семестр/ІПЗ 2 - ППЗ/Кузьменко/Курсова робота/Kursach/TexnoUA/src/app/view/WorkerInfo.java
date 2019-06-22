package app.view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;

import app.controller.Controller;
import app.controller.command.WorkerInfoCommand;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;

@SuppressWarnings("serial")
/**
 * клас, що реалізує інтерфейс користувача для відображення інформації користувача
 * @author Vova
 *
 */
public class WorkerInfo extends JPanel {
	/**
	 * ідентифікатор текущого користувача
	 */
	private int profile_id = Authorisation.getProfile().getId();
/**
 * панель на якій знаходитимуться всі елементи графічного інтерфейсу користувача
 */
	private final JPanel contentPanel = new JPanel();


	/**
	 * конструктор класу.
	 * Створює вікно
	 */
	public WorkerInfo() {
		setFont(Fonts.getFont());
		this.setVisible(true);
		@COMMAND(key = "WorkerInfoCommand")
		@CONTEXT(list = {
				@PARAMETER(key = "profile_id", type = Integer.class, optional = true),
				@PARAMETER(key = "elementes", type = String.class, optional = true) })
		class cmnd extends WorkerInfoCommand {
		}
		Controller.toController(WorkerInfo.this,
				cmnd.class.getAnnotation(CONTEXT.class),
				cmnd.class.getAnnotation(COMMAND.class));
		setVisible(true);
		setBounds(100, 100, 450, 335);
		setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		{
			JLabel lblLogin = new JLabel(Languages.getProperty("login"));
			lblLogin.setFont(Fonts.getFont());
			lblLogin.setBounds(10, 11, 112, 19);
			contentPanel.add(lblLogin);
		}
		{
			JLabel labelPassword = new JLabel(Languages.getProperty("password"));
			labelPassword.setFont(Fonts.getFont());
			labelPassword.setBounds(10, 41, 112, 19);
			contentPanel.add(labelPassword);
		}
		{
			JLabel lblEmail = new JLabel(Languages.getProperty("email"));
			lblEmail.setFont(Fonts.getFont());
			lblEmail.setBounds(10, 71, 112, 19);
			contentPanel.add(lblEmail);
		}
		{
			JLabel labelTelephone = new JLabel(Languages.getProperty("telephone"));
			labelTelephone.setFont(Fonts.getFont());
			labelTelephone.setBounds(10, 101, 112, 19);
			contentPanel.add(labelTelephone);
		}
		{
			JLabel labelAddress = new JLabel(Languages.getProperty("address"));
			labelAddress.setFont(Fonts.getFont());
			labelAddress.setBounds(10, 131, 112, 19);
			contentPanel.add(labelAddress);
		}
		{
			JLabel lblId = new JLabel("ID");
			lblId.setFont(Fonts.getFont());
			lblId.setBounds(10, 161, 112, 19);
			contentPanel.add(lblId);
		}
		{
			JLabel labelType = new JLabel(Languages.getProperty("type"));
			labelType.setFont(Fonts.getFont());
			labelType.setBounds(10, 191, 112, 19);
			contentPanel.add(labelType);
		}
		{
			JLabel labelState = new JLabel(Languages.getProperty("state"));
			labelState.setFont(Fonts.getFont());
			labelState.setBounds(10, 221, 112, 19);
			contentPanel.add(labelState);
		}

		{
			JPanel buttonPane = new JPanel();
			buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
			add(buttonPane, BorderLayout.SOUTH);

			JButton okButton = new JButton(Languages.getProperty("okBtn"));
			buttonPane.add(okButton);
			okButton.setFont(Fonts.getFont());
			okButton.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent arg0) {
					TabbedPane.tabbedPane.remove(WorkerInfo.this);
				}
			});

			{
				JButton editInfo = new JButton(Languages.getProperty("change"));
				buttonPane.add(editInfo);
				editInfo.setFont(Fonts.getFont());
				editInfo.addActionListener(new ActionListener() {

					@SuppressWarnings("deprecation")
					@Override
					public void actionPerformed(ActionEvent arg0) {
						new EditInfo();
						WorkerInfo.this.hide();

					}
				});

			}
		}
	}
/**
 * метод що оновлює дані графічного інтерфейсу
 * @param mapinfo дані
 */
	public void update(HashMap<String, String> mapinfo) {
		HashMap<String, String> map = mapinfo;

		{
			JLabel login = new JLabel(map.get("login"));
			login.setFont(Fonts.getFont());
			login.setBounds(152, 11, 109, 18);
			contentPanel.add(login);
			login.setVisible(true);
			contentPanel.repaint();
		}
		{
			JLabel password = new JLabel(map.get("password"));
			password.setFont(Fonts.getFont());
			password.setBounds(152, 41, 109, 18);
			contentPanel.add(password);
			password.setVisible(true);
			contentPanel.repaint();
		}
		{
			JLabel email = new JLabel(map.get("Email"));
			email.setFont(Fonts.getFont());
			email.setBounds(152, 71, 109, 18);
			contentPanel.add(email);
			email.setVisible(true);
			contentPanel.repaint();
		}
		{
			JLabel telehpone = new JLabel(map.get("Telephone"));
			telehpone.setFont(Fonts.getFont());
			telehpone.setBounds(152, 101, 109, 18);
			contentPanel.add(telehpone);
			telehpone.setVisible(true);
			contentPanel.repaint();
		}
		{
			JLabel addres = new JLabel(map.get("Addres"));
			addres.setFont(Fonts.getFont());
			addres.setBounds(152, 132, 109, 18);
			contentPanel.add(addres);
			addres.setVisible(true);
			contentPanel.repaint();
		}
		{
			JLabel id = new JLabel(map.get("id"));
			id.setFont(Fonts.getFont());
			id.setBounds(152, 161, 109, 18);
			contentPanel.add(id);
			id.setVisible(true);
			contentPanel.repaint();
		}
		{
			JLabel category = new JLabel(map.get("Category"));
			category.setFont(Fonts.getFont());
			category.setBounds(149, 195, 112, 23);
			contentPanel.add(category);
			category.setVisible(true);
			contentPanel.repaint();
		}
		{
			JLabel state = new JLabel(map.get("State"));
			state.setFont(Fonts.getFont());
			state.setBounds(152, 225, 99, 19);
			contentPanel.add(state);
			state.setVisible(true);
			contentPanel.repaint();
		}
	}
/**
 * метод що повертає профайл
 * @return профайл
 */
	public int getProfile_id() {
		return profile_id;
	}
/**
 * метод, що встановлює ідентифікаційний номер профайла
 * @param profile_id ідентифікаційний номер профайла
 */
	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}
	/**
	 * метод що встановлює стиль вікна
	 * @param className назва стилю
	 */
	public static void setStyle(String className){
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
