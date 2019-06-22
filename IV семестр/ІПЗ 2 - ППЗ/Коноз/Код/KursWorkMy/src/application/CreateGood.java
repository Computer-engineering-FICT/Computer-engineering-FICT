package application;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Hashtable;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JTextArea;
import javax.swing.JScrollPane;

import controller.ContextForCommand;
import controller.Controller;
import controller.Factory.CommandFactory;

/**
 *  Клас реалізовує діалогове вікно для створення товару.
 *  @author Коноз Андрій 
 */
public class CreateGood extends JDialog {
	/**
	 * Основна панель вікна.
	 */
	private final JPanel contentPanel = new JPanel();
	/**
	 * Поле для введення назви товару.
	 */
	private JTextField nameField;
	/**
	 * Поле для введення виробника.
	 */
	private JTextField manufacturedField;
	/**
	 * Поле для введення ціни.
	 */
	private JTextField priceField;
	/**
	 * Поле для введення кількості товару.
	 */
	private JTextField countField;
	/**
	 * Поле для введення опису товару.
	 */
	private JTextArea descriptionArea;
	/**
	 * Таблиця з написами на компонентах.
	 */
	private Hashtable<String, String> context;
	/**
	 * Мітка для відображення попереджень.
	 */
	private JLabel lblError;
	/**
	 * Посилання на власника вікна.
	 */
	private MainFrame link;
	/**
	 * Кнопка для скасування створення.
	 */
	private JButton cancelButton;

	
	/**
	 * Створення і налаштування діалогового вікна.
	 * @param link посилання на головне вікно.
	 */
	public CreateGood(MainFrame link) {
		context = ContextUtils.loadContext("CreateGoods");
		setIcon();
		this.link = link;
		setTitle(context.get("title"));
		setResizable(false);
		setBounds(100, 100, 350, 497);
		getContentPane().setLayout(new BorderLayout());
		
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		
		JLabel lblName = new JLabel(context.get("lblName"));
		lblName.setBounds(53, 11, 218, 14);
		contentPanel.add(lblName);
		
		nameField = new JTextField();
		nameField.setBounds(53, 25, 218, 30);
		contentPanel.add(nameField);
		nameField.setColumns(10);
		
		JLabel lblManufactured = new JLabel(context.get("lblManufactured"));
		lblManufactured.setBounds(53, 56, 218, 14);
		contentPanel.add(lblManufactured);
		
		manufacturedField = new JTextField();
		manufacturedField.setBounds(53, 71, 218, 30);
		contentPanel.add(manufacturedField);
		manufacturedField.setColumns(10);
		
		JLabel lblPrise = new JLabel(context.get("lblPrise"));
		lblPrise.setBounds(53, 104, 218, 14);
		contentPanel.add(lblPrise);
		
		priceField = new JTextField();
		priceField.setBounds(53, 119, 218, 30);
		contentPanel.add(priceField);
		priceField.setColumns(10);
		
		JLabel lblCount = new JLabel(context.get("lblCount"));
		lblCount.setBounds(53, 151, 218, 14);
		contentPanel.add(lblCount);
		
		countField = new JTextField();
		countField.setBounds(53, 166, 218, 30);
		contentPanel.add(countField);
		countField.setColumns(10);
		
		JLabel lblDescription = new JLabel(context.get("lblDescription"));
		lblDescription.setBounds(53, 197, 218, 14);
		contentPanel.add(lblDescription);

		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(53, 222, 218, 157);
		contentPanel.add(scrollPane);

		descriptionArea = new JTextArea();
		scrollPane.setViewportView(descriptionArea);

		lblError = new JLabel("");
		lblError.setBounds(53, 390, 218, 35);
		contentPanel.add(lblError);
		
		JPanel buttonPane = new JPanel();
		buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
		getContentPane().add(buttonPane, BorderLayout.SOUTH);
		JButton okButton = new JButton(context.get("okButton"));
		okButton.setActionCommand("OK");
		buttonPane.add(okButton);
		
		getRootPane().setDefaultButton(okButton);
		cancelButton = new JButton(context.get("cancelButton"));
		cancelButton.setActionCommand("Cancel");
		buttonPane.add(cancelButton);

		cancelButton.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				CreateGood.this.dispose();
				
			}
		});
		
		okButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				ContextForCommand context = new ContextForCommand();
				context.put("proprietor", CreateGood.this.link);
				context.put("catalog", CreateGood.this.link.getTitleLabel()
						.getText());
				context.put("name", nameField.getText());
				context.put("manufactured", manufacturedField.getText());
				try {
					context.put("count", Integer.parseInt(countField.getText()));
				} catch (Exception e) {
					lblError.setText(CreateGood.this.context
							.get("CountMustBeNumber"));
					return;
				}
				try {
					context.put("price", Integer.parseInt(priceField.getText()));
				} catch (Exception e) {
					lblError.setText(CreateGood.this.context
							.get("PriceMustBeNumber"));
					return;
				}
				context.put("description", descriptionArea.getText());
				Controller.getController().execute(context,
						CommandFactory.CREATE_GOODS);
				setVisible(false);
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
	private void setIcon(){
		ImageIcon icon = new ImageIcon("D:\\DatabaseClient\\icon.png");
		setIconImage(icon.getImage());
	}
}
