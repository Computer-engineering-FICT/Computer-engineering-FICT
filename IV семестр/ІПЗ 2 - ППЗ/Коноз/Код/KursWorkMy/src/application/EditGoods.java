package application;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Hashtable;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JEditorPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import controller.ContextForCommand;
import controller.Controller;
import controller.Factory.CommandFactory;

import application.Model.Description;
import application.Model.Goods;

/**
 * Клас реалізовує функціонал діалогового вікна для редагування товару.
 * @author Коноз Андрій 
 */
public class EditGoods extends JDialog {

	/**
	 * Панель, яка містить в собі всі компоненти вікна.
	 */
	private final JPanel contentPanel = new JPanel();
	/**
	 * Поле для введення назви товару.
	 */
	private JTextField namefield;
	/**
	 * Поле для введення виробника.
	 */
	private JTextField manufacturedfield;
	/**
	 * Поле для введення ціни.
	 */
	private JTextField prisefield;
	/**
	 * Поле для введення кількості.
	 */
	private JTextField countfield;
	/**
	 * Поле для введення опису.
	 */
	private JEditorPane descriptionArea;
	/**
	 * Поле для введення популярності.
	 */
	private JTextField popularityfield;
	/**
	 * Посилання на головне вікно.
	 */
	protected MainFrame link;
	/**
	 * Мітка для відображення попереджень.
	 */
	private JLabel lblTips;
	/**
	 * Товар, який редагується.
	 */
	private Goods goods;
	/**
	 * Опис товару, який редагується.
	 */
	private Description descr;
	/**
	 * Таблиця з написами компонентів.
	 */
	private Hashtable<String, String> context;
	
	
	/**
	 * Конструктор налаштовує діалогове вікно згідно отриманих параметрів.
	 * @param link посилання на головне вікно.
	 * @param goods товар, для редагування.
	 * @param descr опис товару, який редагується.
	 */
	public EditGoods(MainFrame link, Goods goods, Description descr) {
		setResizable(false);
		context = ContextUtils.loadContext("EditGoods");
		setIcon();
		this.link = link;
		this.goods = goods;
		this.descr = descr;
		setTitle(context.get("title"));
		setBounds(10, 10, 491, 555);
		getContentPane().setLayout(new BorderLayout());
		
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		
		JLabel lblName = new JLabel(context.get("lblName"));
		lblName.setBounds(10, 11, 89, 30);
		contentPanel.add(lblName);
		
		namefield = new JTextField(goods.getName());
		namefield.setBounds(103, 11, 350, 30);
		contentPanel.add(namefield);
		
		JLabel lblManufactured = new JLabel(context.get("lblManufactured"));
		lblManufactured.setBounds(10, 49, 89, 30);
		contentPanel.add(lblManufactured);
		
		manufacturedfield = new JTextField(descr.getMaker());
		manufacturedfield.setBounds(103, 49, 350, 30);
		contentPanel.add(manufacturedfield);
		
		JLabel lblPrice = new JLabel(context.get("lblPrice"));
		lblPrice.setBounds(10, 87, 89, 27);
		contentPanel.add(lblPrice);
		
		prisefield = new JTextField(Integer.toString(goods.getPrice()));
		prisefield.setBounds(103, 87, 350, 30);
		contentPanel.add(prisefield);
		
		JLabel lblCount = new JLabel(context.get("lblCount"));
		lblCount.setBounds(10, 125, 89, 30);
		contentPanel.add(lblCount);
		
		countfield = new JTextField(Integer.toString(goods.getNumberOfgoods()));
		countfield.setBounds(103, 125, 350, 30);
		contentPanel.add(countfield);
		
		JLabel lblDescription = new JLabel(context.get("lblDescription"));
		lblDescription.setBounds(9, 201, 90, 30);
		contentPanel.add(lblDescription);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBorder(null);
		scrollPane.setBounds(102, 201, 350, 200);
		contentPanel.add(scrollPane);
		
		descriptionArea = new JEditorPane();
		descriptionArea.setText(descr.getText());
		descriptionArea.setEditable(true);
		scrollPane.setViewportView(descriptionArea);
		
		JButton btnCancel = new JButton(context.get("btnCancel"));
		btnCancel.setBounds(356, 425, 97, 23);
		contentPanel.add(btnCancel);
		
		JButton btnEdit = new JButton(context.get("btnEdit"));
		btnEdit.setBounds(249, 425, 97, 23);
		contentPanel.add(btnEdit);
		
		JLabel lblPopularity = new JLabel(context.get("lblPopularity"));
		lblPopularity.setBounds(10, 163, 89, 30);
		contentPanel.add(lblPopularity);
		
		popularityfield = new JTextField(Integer.toString(goods.getMark()));
		popularityfield.setBounds(103, 163, 350, 30);
		contentPanel.add(popularityfield);
		
		lblTips = new JLabel("");
		lblTips.setBounds(103, 459, 350, 39);
		contentPanel.add(lblTips);
		
		JPanel buttonPane = new JPanel();
		buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
		getContentPane().add(buttonPane, BorderLayout.SOUTH);
		
		
		btnCancel.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
					EditGoods.this.dispose();
				}
		});
		
		btnEdit.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				lblTips.setText("");
				ContextForCommand context = new ContextForCommand();
				boolean isChange = false;
				try {
					if(EditGoods.this.goods.getMark() != Integer.parseInt(popularityfield.getText())){
						EditGoods.this.goods.setMark(Integer.parseInt(popularityfield.getText()));
						isChange = true;
					}
				} catch (Exception e) {
					lblTips.setText(EditGoods.this.context.get("MarkMustBeNumber"));
					return;
				}
				try {
					if(EditGoods.this.goods.getNumberOfgoods() != Integer.parseInt(countfield.getText())){
						EditGoods.this.goods.setNumberOfgoods(Integer.parseInt(countfield.getText()));
						isChange = true;
					}
				} catch (Exception e) {
					lblTips.setText(EditGoods.this.context.get("CountMustBeNumber"));
					return;
				}
				try {
					if(EditGoods.this.goods.getPrice() != Integer.parseInt(prisefield.getText())){
						EditGoods.this.goods.setPrice(Integer.parseInt(prisefield.getText()));
						isChange = true;
					}
				} catch (Exception e) {
					lblTips.setText(EditGoods.this.context.get("PriceMustBeNumber"));
					return;
				}
				if(!EditGoods.this.goods.getName().equals(namefield.getText())){
					EditGoods.this.goods.setName(namefield.getText());
					isChange = true;
				}
				if(!EditGoods.this.descr.getMaker().equals(manufacturedfield.getText())){
					EditGoods.this.descr.setMaker(manufacturedfield.getText());
					isChange = true;
				}
				if(!EditGoods.this.descr.getText().equals(descriptionArea.getText())){
					EditGoods.this.descr.setText(descriptionArea.getText());
					isChange = true;
				}
				if(isChange){
					context.put("goods", EditGoods.this.goods);
					context.put("description", EditGoods.this.descr);
					context.put("proprietor", EditGoods.this.link);
					Controller.getController().execute(context, CommandFactory.EDIT_GOODS);
				
				}
				EditGoods.this.dispose();
				
			}
		});
		
		setModal(true);
		setLocationRelativeTo(link);
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		setVisible(true);
	}
	/**
	 * Метод встановлює піктограму на вікно.
	 */
	private void setIcon(){
		ImageIcon icon = new ImageIcon("D:\\DatabaseClient\\icon.png");
		setIconImage(icon.getImage());
	}
}
