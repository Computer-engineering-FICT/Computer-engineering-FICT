package application;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Hashtable;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextPane;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import controller.ContextForCommand;
import controller.Controller;
import controller.Factory.CommandFactory;
import application.Model.Description;
import application.Model.Goods;

/**
 * Клас реалізовує функціонал для відображення детальної інформації про товар.
 * @author Коноз Андрій 
 */
public class OpenGoods extends JDialog {

	/**
	 * Панель, яка містить всі компоненти вікна.
	 */
	private final JPanel contentPanel = new JPanel();
	/**
	 * Мітка, для відображення назви.
	 */
	private JLabel lblNamefield;
	/**
	 * Мітка для відображення виробника.
	 */
	private JLabel lblManufacturedfield;
	/**
	 * Мітка для відображення ціни.
	 */
	private JLabel lblPrisefield;
	/**
	 * Мітка для відображення кількості.
	 */
	private JLabel lblCountfield;
	/**
	 * Поле для відображення опису.
	 */
	private JTextPane txtrDescriptionArea;
	/**
	 * Поле для відображення коментарів. 
	 */
	private JTextPane txtrComments;
	/**
	 * Поле для відображення популярності.
	 */
	private JLabel lblPopularityfield;
	/**
	 * Посилання на головне вікно.
	 */
	protected MainFrame link;
	/**
	 * Товар для відображення.
	 */
	private Goods goods;
	/**
	 * Опис товару для відображення.
	 */
	private Description descr;
	/**
	 * Тадлиця з написами компонентів. 
	 */
	private Hashtable<String, String> context;
	
	
	/**
	 * Конструктор налаштовує діалогове вікно.
	 * @param link посилання наголовне вікно.
	 */
	public OpenGoods(MainFrame link) {
		setResizable(false);
		context = ContextUtils.loadContext("OpenGoods");
		setIcon();
		this.link = link;
		setTitle(context.get("title"));
		setBounds(10, 10, 491, 697);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		
		JLabel lblName = new JLabel(context.get("lblName"));
		lblName.setBounds(10, 11, 89, 14);
		contentPanel.add(lblName);
		
		lblNamefield = new JLabel("NameField");
		lblNamefield.setBounds(103, 11, 350, 14);
		contentPanel.add(lblNamefield);
		
		JLabel lblManufactured = new JLabel(context.get("lblManufactured"));
		lblManufactured.setBounds(10, 36, 89, 14);
		contentPanel.add(lblManufactured);
		
		lblManufacturedfield = new JLabel("ManufacturedField");
		lblManufacturedfield.setBounds(103, 36, 350, 14);
		contentPanel.add(lblManufacturedfield);
		
		JLabel lblPrice = new JLabel(context.get("lblPrice"));
		lblPrice.setBounds(10, 61, 89, 14);
		contentPanel.add(lblPrice);
		
		lblPrisefield = new JLabel("PriseField");
		lblPrisefield.setBounds(103, 61, 350, 14);
		contentPanel.add(lblPrisefield);
		
		JLabel lblCount = new JLabel(context.get("lblCount"));
		lblCount.setBounds(10, 86, 89, 14);
		contentPanel.add(lblCount);
		
		lblCountfield = new JLabel("CountField");
		lblCountfield.setBounds(103, 86, 350, 14);
		contentPanel.add(lblCountfield);
		
		JLabel lblDescription = new JLabel(context.get("lblDescription"));
		lblDescription.setBounds(10, 136, 89, 14);
		contentPanel.add(lblDescription);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBorder(null);
		scrollPane.setBounds(103, 136, 350, 200);
		contentPanel.add(scrollPane);
		
		txtrDescriptionArea = new JTextPane();
		txtrDescriptionArea.setText("Description area");
		txtrDescriptionArea.setEditable(false);
		scrollPane.setViewportView(txtrDescriptionArea);
		
		JLabel lblComments = new JLabel(context.get("lblComments"));
		lblComments.setBounds(10, 350, 83, 14);
		contentPanel.add(lblComments);
		
		JScrollPane scrollPane_1 = new JScrollPane();
		scrollPane_1.setBorder(null);
		scrollPane_1.setBounds(103, 347, 350, 260);
		contentPanel.add(scrollPane_1);
		
		txtrComments = new JTextPane();
		txtrComments.setText("Comments");
		txtrComments.setContentType("text/html");
		txtrComments.setEditable(false);
		scrollPane_1.setViewportView(txtrComments);
		
		JButton btnDelete = new JButton(context.get("btnDelete"));
		btnDelete.setBounds(356, 618, 97, 23);
		contentPanel.add(btnDelete);
		
		JButton btnEdit = new JButton(context.get("btnEdit"));
		btnEdit.setBounds(249, 618, 97, 23);
		contentPanel.add(btnEdit);
		
		JLabel lblPopularity = new JLabel(context.get("lblPopularity"));
		lblPopularity.setBounds(10, 111, 89, 14);
		contentPanel.add(lblPopularity);
		
		lblPopularityfield = new JLabel("PopularityField");
		lblPopularityfield.setBounds(103, 111, 350, 14);
		contentPanel.add(lblPopularityfield);
		JPanel buttonPane = new JPanel();
		buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
		getContentPane().add(buttonPane, BorderLayout.SOUTH);
		
		
		btnDelete.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				Object[] options = { context.get("Yes"), context.get("No")};
				int result = JOptionPane.showOptionDialog(OpenGoods.this, context.get("DeleteQuestionGoods"), context.get("Delete"), JOptionPane.YES_NO_OPTION,
                        JOptionPane.QUESTION_MESSAGE, null, options,
                        options[0]);
				if(result == JOptionPane.YES_OPTION){
					ContextForCommand context = new ContextForCommand();
					context.put("proprietor", OpenGoods.this.link);
					context.put("name", lblNamefield.getText());
					Controller.getController().execute(context, CommandFactory.DELETE_GOODS);
					OpenGoods.this.dispose();
				}
			}
		});
		
		btnEdit.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				new EditGoods(OpenGoods.this.link, OpenGoods.this.goods, OpenGoods.this.descr);
				OpenGoods.this.dispose();
			}
		});
		
		setModal(true);
		setLocationRelativeTo(link);
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		setVisible(true);
	}
	
	
	/**
	 * Метод встановлює інформацію для відображення.
	 * @param goods товар для відображення.
	 * @param descr опис для відображення.
	 * @param comments коментарі.
	 */
	public void setInformation(Goods goods, Description descr, String comments){
		this.goods = goods;
		this.descr = descr;
		lblNamefield.setText(goods.getName());
		lblManufacturedfield.setText(descr.getMaker());
		lblCountfield.setText(Integer.toString(goods.getNumberOfgoods()));
		lblPrisefield.setText(Integer.toString(goods.getPrice()));
		lblPopularityfield.setText(Integer.toString(goods.getMark()) +"/10");
		txtrDescriptionArea.setText(descr.getText());
		txtrComments.setText(comments);
		if(comments.length() == 0)
			txtrComments.setBackground(this.getBackground());
	}
	/**
	 * Метод встановлює піктограму на вікно
	 */
	private void setIcon(){
		ImageIcon icon = new ImageIcon("D:\\DatabaseClient\\icon.png");
		setIconImage(icon.getImage());
	}
}
