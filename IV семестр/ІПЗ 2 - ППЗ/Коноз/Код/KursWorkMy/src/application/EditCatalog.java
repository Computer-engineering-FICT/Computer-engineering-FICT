package application;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Hashtable;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JTextField;

import controller.ContextForCommand;
import controller.Controller;
import controller.Factory.CommandFactory;

/**
 * Клас реалізовує діалогове вікно для редагування товару.
 * @author Коноз Андрій 
 */
public class EditCatalog extends JDialog {

	/**
	 * Панель, на якій розташовуються всі компоненти вікна.
	 */
	private final JPanel contentPanel = new JPanel();
	/**
	 * Поле для введення нової назви.
	 */
	private JTextField textField;
	/**
	 * Посилання на головне вікно.
	 */
	private MainFrame link;
	/**
	 * Таблиця з написами на компонентах.
	 */
	private Hashtable<String, String> context;

	
	/**
	 * Створення і налаштування діалогового вікна
	 * @param link посилання на головне вікно.
	 */
	public EditCatalog(MainFrame link) {
		this.link = link;
		setIcon();
		setResizable(false);
		getContentPane().setLayout(null);
		context = ContextUtils.loadContext("EditCatalog");
		setTitle(context.get("title"));
		setBounds(100, 100, 302, 210);
		getContentPane().setLayout(new BorderLayout());

		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);

		JLabel lblNewName = new JLabel(context.get("lblNewName"));
		lblNewName.setBounds(15, 38, 261, 14);
		contentPanel.add(lblNewName);

		textField = new JTextField();
		textField.setBounds(15, 63, 261, 25);
		contentPanel.add(textField);
		textField.setColumns(10);

		JButton okButton = new JButton(context.get("okButton"));
		okButton.setBounds(10, 136, 119, 25);
		contentPanel.add(okButton);
		okButton.setActionCommand("OK");
		getRootPane().setDefaultButton(okButton);
		JButton cancelButton = new JButton(context.get("cancelButton"));
		cancelButton.setBounds(157, 136, 119, 25);
		contentPanel.add(cancelButton);
		cancelButton.setActionCommand("Cancel");
		
		cancelButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				dispose();

			}
		});

		okButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				ContextForCommand context = new ContextForCommand();
				context.put("proprietor", EditCatalog.this.link);
				context.put("name", textField.getText());
				Controller.getController().execute(context,
						CommandFactory.EDIT_CATALOG);
				dispose();

			}
		});

		setModal(true);
		setLocationRelativeTo(link);
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		setVisible(true);
	}

	/**
	 * Метод встановлює піктограму на вікно
	 */
	private void setIcon() {
		ImageIcon icon = new ImageIcon("D:\\DatabaseClient\\icon.png");
		setIconImage(icon.getImage());
	}
}
