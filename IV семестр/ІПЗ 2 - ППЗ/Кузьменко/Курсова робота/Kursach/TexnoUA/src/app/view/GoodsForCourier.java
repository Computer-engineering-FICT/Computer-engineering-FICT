package app.view;

import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.JTextField;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.util.Iterator;
import java.util.List;
import javax.swing.JTable;
import app.controller.Controller;
import app.controller.command.ConfirmedGoodsCourierCommand;
import app.controller.command.GetGoodsForCourierCommand;
import app.controller.command.GetGourierCommand;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.Description;
import app.model.Goods;
import app.model.OrderGoods;
import app.model.OrderList;
import app.model.Position;
import app.model.Profile;
/**
 * Клас що реалізує графічний інтерфейс користувача для відображення товарів для кур’єра
 * @author Vova
 *
 */
@SuppressWarnings("serial")
public class GoodsForCourier extends JPanel {
	private JTextField textField;
	private JTable table;
	private JLabel lblIdCourier = new JLabel();
	private JButton button_2 = new JButton(Languages.getProperty("GoodsForCourierLabel1"));
	private JButton button_1 = new JButton(Languages.getProperty("closeBtn"));
	private JButton getGoodsbttn = new JButton(Languages.getProperty("GoodsForCourierLabel2"));
	private Integer courierId;
	private Profile profile;

	/**
	 * Додає до панелі елементи графічного інтерфейсу користувача.
	 * відсилає команди контролеру
	 */
	public GoodsForCourier() {
		setFont(Fonts.getFont());
		setVisible(true);
		JLabel lblNewLabel = new JLabel(Languages.getProperty("GoodsForCourierLabel3"));
		lblNewLabel.setFont(Fonts.getFont());
		lblNewLabel.setBounds(21, 27, 91, 28);
		add(lblNewLabel);

		textField = new JTextField();
		textField.setFont(Fonts.getFont());
		textField.setBounds(21, 66, 91, 20);
		add(textField);
		textField.setColumns(10);

		button_2.setBounds(21, 97, 91, 28);
		button_2.setEnabled(false);
		button_2.setFont(Fonts.getFont());
		add(button_2);
	
		button_1.setFont(Fonts.getFont());
		button_1.setBounds(21, 136, 91, 28);
		add(button_1);

		button_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Object[] objects = new Object[2];
				objects[0] = new String(Languages.getProperty("yesBtn"));
				objects[1] = new String(Languages.getProperty("noBtn"));
				int result = JOptionPane.showOptionDialog(GoodsForCourier.this,
						Languages.getProperty("GoodsForCourierLabel4")+ "id="+ courierId+"?", Languages.getProperty("info"),
						JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null,
						objects, null);
				if (result == JOptionPane.YES_OPTION) {
					@COMMAND(key = "confimerGoods")
					@CONTEXT(list = {
							@PARAMETER(key = "ordergoods", type = OrderGoods.class, optional = true),
							@PARAMETER (key = "orderList", type = OrderList.class, optional = true )
					})
					class cmnd extends ConfirmedGoodsCourierCommand {
					}
					;
					Controller.toController(GoodsForCourier.this, cmnd.class.getAnnotation(CONTEXT.class), cmnd.class.getAnnotation(COMMAND.class));
					
				}
				
			}
		});

		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				TabbedPane.tabbedPane.remove(GoodsForCourier.this);
			}
		});

		lblIdCourier.setFont(Fonts.getFont());
		lblIdCourier.setBounds(122, 27, 91, 28);
		add(lblIdCourier);

		getGoodsbttn.setBounds(223, 29, 131, 28);
		getGoodsbttn.setEnabled(false);
		getGoodsbttn.setFont(Fonts.getFont());
		add(getGoodsbttn);
		textField.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				String text = textField.getText();
				if (text.equalsIgnoreCase("")) {
					JOptionPane.showMessageDialog(GoodsForCourier.this,
							Languages.getProperty("GoodsForCourierLabel5"), Languages.getProperty("errorMess"),
							JOptionPane.ERROR_MESSAGE);
				} else {
					try {
						GoodsForCourier.this.setCourierId(new Integer(Integer
								.parseInt(text)));
						@COMMAND(key = "getGourier")
						@CONTEXT(list = {
								@PARAMETER(key = "profile", type = Profile.class, optional = true),
								@PARAMETER(key = "GoodsForCourier", type = GoodsForCourier.class, optional = true) })
						class cmnd extends GetGourierCommand {
						}
						;
						Controller.toController(GoodsForCourier.this,
								cmnd.class.getAnnotation(CONTEXT.class),
								cmnd.class.getAnnotation(COMMAND.class));

					} catch (NumberFormatException e2) {
						JOptionPane.showMessageDialog(GoodsForCourier.this,
								Languages.getProperty("GoodsForCourierLabel6"), Languages.getProperty("errorMess"),
								JOptionPane.ERROR_MESSAGE);
					}
				}

			}
		});

		getGoodsbttn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				/*
				 * викликаємо команду що дає списки для таблиці.
				 */
				@COMMAND(key = "getGoodsForCourier")
				@CONTEXT(list = {
						@PARAMETER(key = "goodsList", type = Goods.class, optional = true),
						@PARAMETER(key = "positionList", type = Position.class, optional = true),
						@PARAMETER(key = "descriptionList", type = Description.class, optional = true) })
				class cmnd extends GetGoodsForCourierCommand {
				}
				;
				Controller.toController(GoodsForCourier.this,
						cmnd.class.getAnnotation(CONTEXT.class),
						cmnd.class.getAnnotation(COMMAND.class));
			}
		});
	}
/**
 * метод що оновлює дані для інтерфейсу
 * @param profile профайл користувача
 */
	public void update(Profile profile) {
		add(lblIdCourier);
		
		if (profile.getId() != -1) {
			this.setProfile(profile);
			lblIdCourier.setText(Integer.toString(this.getProfile().getId()));
			lblIdCourier.setVisible(true);
			lblIdCourier.setFont(Fonts.getFont());
			getGoodsbttn.setFont(Fonts.getFont());
			getGoodsbttn.setEnabled(true);
			
		} else {
			table.setFont(Fonts.getFont());
			table.setVisible(false);
			getGoodsbttn.setEnabled(false);
			button_2.setEnabled(false);
			lblIdCourier.setVisible(false);
			JOptionPane.showMessageDialog(GoodsForCourier.this,
					Languages.getProperty("GoodsForCourierLabel7"), Languages.getProperty("errorMess"),
					JOptionPane.ERROR_MESSAGE);
		}
	}
/**
 * метод що оновлює інформацію для представлення
 * @param goods список товарів
 * @param descriptions список описів
 * @param positions список позицій
 */
	public void update(List<Goods> goods, List<Description> descriptions,
			List<Position> positions) {
		if (goods.size()>0){
			button_2.setEnabled(true);
			String [] colums = {Languages.getProperty("goodsID"), Languages.getProperty("nameGoods"), Languages.getProperty("count")};
			Object [] [] cells = new Object [goods.size()][colums.length];
			Iterator<Goods> gItr = goods.iterator();
			Iterator<Description> dItr = descriptions.iterator();
			Iterator<Position> pItr = positions.iterator();
			Goods g;
			Description d;
			Position p;
			for (int i = 0; i < cells.length; i++) {
				g = gItr.next();
				d= dItr.next();
				p = pItr.next();
				
				cells[i][0]=g.getId();
				cells[i][1] = d.getName();
				cells[i][2]=p.getCount();
			}
			table = new JTable(cells, colums);
			table.setFont(Fonts.getFont());
			table.setVisible(true);
			JScrollPane pane = new JScrollPane(table);
			pane.setFont(Fonts.getFont());
			pane.setBounds(122, 66, 301, 171);
			pane.setVisible(true);
			this.add(pane);
		}else{
			getGoodsbttn.setFont(Fonts.getFont());
			getGoodsbttn.setEnabled(false);
			button_2.setEnabled(false);
			JOptionPane.showMessageDialog(this, Languages.getProperty("GoodsForCourierLabel8"));
		}
		
	}
/**
 * метод повертає ідентифікаційний номер кур'єра
 * @return ідентифікаційний норме
 */
	public Integer getCourierId() {
		return this.courierId;
	}
/**
 * метод встановлює ідентифікацйний номер кур'єра
 * @param courierId ідентифікаійний номер
 */
	public void setCourierId(Integer courierId) {
		this.courierId = courierId;
	}
/**
 * метод що повертає профайл
 * @return профайл
 */
	public Profile getProfile() {
		return profile;
	}
/**
 * метод що встановлює профайл
 * @param profile профайл
 */
	public void setProfile(Profile profile) {
		this.profile = profile;
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
