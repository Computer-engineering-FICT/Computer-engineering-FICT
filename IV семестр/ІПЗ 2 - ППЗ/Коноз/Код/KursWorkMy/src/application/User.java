package application;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Hashtable;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

import controller.ContextForCommand;
import controller.Controller;
import controller.Factory.CommandFactory;

import application.Model.ContactInformation;

/**
 * Клас реалізовує діалогове вікно, в якому буде відображатися
 * інформація про користувача.
 * @author Коноз Андрій 
 */

public class User extends JDialog {

	/**
	 * основна панель діалогового вікна, в якій будуть розміщуватися всі інші
	 * елементи.
	 */
	private final JPanel contentPanel = new JPanel();
	/**
	 * Поле для відображення логіну.
	 */
	private JLabel lblLoginlabel;
	/**
	 * Поле для відображення категорії.
	 */
	private JLabel lblCategorylabel;
	/**
	 * Поле для відображення телефону.
	 */
	private JLabel lblTelephonelabel;
	/**
	 * Поле для відображення електронної пошти.
	 */
	private JLabel lblEmaillable;
	/**
	 * Поле для відображення адреси.
	 */
	private JLabel lblAddresslable;
	/**
	 * Поле для відображення стану.
	 */
	private JLabel lblStatelabel;
	/**
	 * Кнопка для розблокування користувача.
	 */
	private JButton btnUnblockUser;
	/**
	 * Кнопка для блокування користувача.
	 */
	private JButton btnBlockUser;
	/**
	 * Таблиця з написани на компонентах.
	 */
	private Hashtable<String, String> context;

	/**
	 * В конструкторі відбувається створення діалогового вікна і налаштування
	 * його параметрів.
	 */
	public User(Component prop) {
		context = ContextUtils.loadContext("User");
		setIcon();
		setTitle(context.get("title"));
		setBounds(100, 100, 450, 263);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);

		JLabel lblLogin = new JLabel(context.get("lblLogin"));
		lblLogin.setBounds(10, 11, 105, 14);
		contentPanel.add(lblLogin);

		JLabel lblCategory = new JLabel(context.get("lblCategory"));
		lblCategory.setBounds(10, 34, 105, 14);
		contentPanel.add(lblCategory);

		JLabel lblContactinformation = new JLabel(context.get("lblContactinformation"));
		lblContactinformation.setVerticalAlignment(SwingConstants.TOP);
		lblContactinformation.setHorizontalAlignment(SwingConstants.LEFT);
		lblContactinformation.setBounds(10, 59, 414, 14);
		contentPanel.add(lblContactinformation);

		btnBlockUser = new JButton(context.get("btnBlockUser"));
		btnBlockUser.setBounds(168, 182, 121, 23);
		contentPanel.add(btnBlockUser);

		btnUnblockUser = new JButton(context.get("btnUnblockUser"));
		btnUnblockUser.setBounds(37, 182, 121, 23);
		contentPanel.add(btnUnblockUser);

		lblLoginlabel = new JLabel("LoginLabel");
		lblLoginlabel.setBounds(125, 11, 299, 14);
		contentPanel.add(lblLoginlabel);

		lblCategorylabel = new JLabel("CategoryLabel");
		lblCategorylabel.setBounds(125, 34, 299, 14);
		contentPanel.add(lblCategorylabel);

		JLabel lblTelephone = new JLabel(context.get("lblTelephone"));
		lblTelephone.setBounds(37, 84, 78, 14);
		contentPanel.add(lblTelephone);

		lblTelephonelabel = new JLabel("TelephoneLabel");
		lblTelephonelabel.setBounds(125, 84, 299, 14);
		contentPanel.add(lblTelephonelabel);

		JLabel lblEmail = new JLabel(context.get("lblEmail"));
		lblEmail.setBounds(37, 109, 78, 14);
		contentPanel.add(lblEmail);

		lblEmaillable = new JLabel("EmailLable");
		lblEmaillable.setBounds(125, 109, 299, 14);
		contentPanel.add(lblEmaillable);

		JLabel lblAddress = new JLabel(context.get("lblAddress"));
		lblAddress.setBounds(37, 132, 78, 14);
		contentPanel.add(lblAddress);

		lblAddresslable = new JLabel("AddressLable");
		lblAddresslable.setBounds(125, 134, 299, 14);
		contentPanel.add(lblAddresslable);

		JLabel lblState = new JLabel(context.get("lblState"));
		lblState.setBounds(37, 157, 78, 14);
		contentPanel.add(lblState);

		lblStatelabel = new JLabel("StateLabel");
		lblStatelabel.setBounds(125, 157, 299, 14);
		contentPanel.add(lblStatelabel);

		
		
		btnBlockUser.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				ContextForCommand context = new ContextForCommand();
				context.put("login", lblLoginlabel.getText());
				context.put("state", 3);
				context.put("proprietor", User.this);
				Controller.getController().execute(context, CommandFactory.CHANGE_STATE);
				
			}
		});
		
		btnUnblockUser.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				ContextForCommand context = new ContextForCommand();
				context.put("login", lblLoginlabel.getText());
				context.put("state", 1);
				context.put("proprietor", User.this);
				Controller.getController().execute(context, CommandFactory.CHANGE_STATE);
				
			}
		});
		setModal(true);
		setLocationRelativeTo(prop);
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		setVisible(true);

	}
	
	/**
	 * Метод для встановлення інформації для відображення.
	 * @param login логін
	 * @param category категорія
	 * @param state стан
	 * @param contInfo контактна інформація
	 */
	public void setInformation(String login, String category, int state, ContactInformation contInfo){
		lblLoginlabel.setText(login);
		lblCategorylabel.setText(category);
		lblAddresslable.setText(contInfo.getAdress());
		lblEmaillable.setText(contInfo.getEmail());
		lblTelephonelabel.setText(Integer.toString(contInfo.getTelepfone()));
		lblStatelabel.setText(getState(state));
		if(!category.equals(context.get("Client"))){
			btnBlockUser.setEnabled(false);
			btnUnblockUser.setEnabled(false);
		}
	}
	
	/**
	 * Метод для отримання назви стану за переданою цифрою.
	 * @param id числовий індентифікатор стану
	 * @return назву стану
	 */
	private String getState(int id){
		String result = "null";
		switch (id) {
		case 1:
			result = context.get("Active");
			btnUnblockUser.setEnabled(false);
			btnBlockUser.setEnabled(true);
			break;
		case 2:
			result = context.get("NonActive");
			btnBlockUser.setEnabled(false);
			btnUnblockUser.setEnabled(false);
			break;
		case 3:
			result = context.get("Banned");
			btnBlockUser.setEnabled(false);
			btnUnblockUser.setEnabled(true);
			break;
		}
		return result;
	}
	/**
	 * Метод встановлює піктограму на вікно.
	 */
	private void setIcon(){
		ImageIcon icon = new ImageIcon("D:\\DatabaseClient\\icon.png");
		setIconImage(icon.getImage());
	}
}
