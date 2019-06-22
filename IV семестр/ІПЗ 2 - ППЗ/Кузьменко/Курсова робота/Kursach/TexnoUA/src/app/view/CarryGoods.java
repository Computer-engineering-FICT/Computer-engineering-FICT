package app.view;

import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.JCheckBox;
import javax.swing.JList;
import javax.swing.JScrollPane;
import javax.swing.ListSelectionModel;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import app.controller.Controller;
import app.controller.command.GetGoodsListCommand;
import app.controller.command.GetOrderListCommand;
import app.controller.command.IsPayCommand;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.Description;
import app.model.Goods;
import app.model.OrderGoods;
import app.model.OrderList;
import app.model.Position;
import app.model.Profile;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/**
 * ���� �� ������ ��������� �������� �������� ������ �볺���
 * @author Vova
 *
 */
@SuppressWarnings("serial")
public class CarryGoods extends JPanel {
	/**
	 * ������� ������� �����������
	 */
	private Profile profileWorker;
	/**
	 * ���������� �����������
	 */
	private OrderList OrderListClient;
	@SuppressWarnings("rawtypes")
	/**
	 * ������ ��� ����������� ������ ���������
	 */
	private JList list = new JList<>();
	/**
	 * ������ ���������
	 */
	private List<OrderList> clientList;
	
	private final String prefix = Languages.getProperty("CarryGoodsLable10");
	/**
	 * ������ ������
	 */
	private List<Goods> goods;
	/**
	 * ������ ������� � ���������
	 */
	private List<Position> positions;
	/**
	 * ������ ����� ������
	 */
	private List<Description> descriptions;

	JLabel lblIdid = new JLabel();
	JLabel lblSumm = new JLabel();
	JLabel lblTelephone = new JLabel();
	JLabel lblAddres = new JLabel();
	JCheckBox isPayCheckBox = new JCheckBox(Languages.getProperty("CarryGoodsLable1"));
	JButton confirmPayBttn = new JButton(Languages.getProperty("CarryGoodsLable2"));
	JButton bttnGoodsList = new JButton(Languages.getProperty("CarryGoodsLable3"));
	JScrollPane pane;
	String[] orderList;

	/**
	 * ���������� ������. ��������� �������� ���������� �����������.
	 */
	public CarryGoods(Profile p) {
		setFont(Fonts.getFont());
		setVisible(true);
		this.setProfileWorker(p);
		setLayout(null);
		/**
		 * ��������� ������� ��� �� ������ ��������� �� ���� �������� id ����,
		 * ��� ����.
		 * 
		 */
		getNewOrderList();
		JLabel addresClient = new JLabel(Languages.getProperty("address"));
		addresClient.setFont(Fonts.getFont());
		addresClient.setBounds(144, 74, 135, 23);
		add(addresClient);

		JLabel clientTelephone = new JLabel(Languages.getProperty("telephone"));
		clientTelephone.setFont(Fonts.getFont());
		clientTelephone.setBounds(144, 102, 135, 23);
		add(clientTelephone);

		JLabel orderSum = new JLabel(Languages.getProperty("CarryGoodsLable5"));
		orderSum.setFont(Fonts.getFont());
		orderSum.setBounds(144, 136, 135, 23);
		add(orderSum);

		bttnGoodsList.setFont(Fonts.getFont());
		bttnGoodsList.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					if (goods != null) {
						SetGoodsList dialog = new SetGoodsList(goods,
								descriptions, positions);

						dialog.setVisible(true);
					}

				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		});
		bttnGoodsList.setBounds(144, 181, 135, 32);
		add(bttnGoodsList);

		JLabel clientID = new JLabel(Languages.getProperty("CarryGoodsLable4"));
		clientID.setFont(Fonts.getFont());
		clientID.setBounds(144, 40, 135, 23);
		add(clientID);

		isPayCheckBox.setFont(Fonts.getFont());
		isPayCheckBox.setBounds(144, 231, 97, 23);
		isPayCheckBox.setSelected(false);
		add(isPayCheckBox);

		confirmPayBttn.setFont(Fonts.getFont());
		confirmPayBttn.setBounds(289, 181, 135, 32);
		confirmPayBttn.setEnabled(false);
		add(confirmPayBttn);

		JButton bttnExit = new JButton(Languages.getProperty("closeBtn"));
		bttnExit.setFont(Fonts.getFont());
		bttnExit.setBounds(289, 222, 135, 32);
		add(bttnExit);
		bttnExit.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				TabbedPane.tabbedPane.remove(CarryGoods.this);

			}
		});

		isPayCheckBox.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (isPayCheckBox.isSelected()) {
					confirmPayBttn.setEnabled(true);
				} else {
					confirmPayBttn.setEnabled(false);
				}

			}
		});
		confirmPayBttn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent arg0) {
				int i = JOptionPane.showConfirmDialog(CarryGoods.this,
						Languages.getProperty("CarryGoodsLable7"), Languages.getProperty("info"),
						JOptionPane.YES_NO_OPTION);
				if (i == JOptionPane.YES_OPTION) {
					@COMMAND(key = "isPayCommnad")
					@CONTEXT(list = {
							@PARAMETER(key = "orderGoods", type = OrderGoods.class, optional = true),
							@PARAMETER(key = "order_id", type = Integer.class, optional = true),
							@PARAMETER(key = "isPay", type = Boolean.class, optional = true) })
					class commnd extends IsPayCommand {
					}
					;
					Controller.toController(CarryGoods.this,
							commnd.class.getAnnotation(CONTEXT.class),
							commnd.class.getAnnotation(COMMAND.class));

					TabbedPane.tabbedPane.remove(CarryGoods.this);
					TabbedPane.tabbedPane.add(
							new CarryGoods(Authorisation.getProfile()),
							Languages.getProperty("CarryGoodsLable8"));

				}
			}
		});

	}

	/**
	 * ����� �� ������� ��� ��� �������������
	 * @param listWorker ������ ���������
	 * @param clientList ������ �볺���
	 */
	public void update(List<OrderList> listWorker, List<OrderList> clientList) {

		if (listWorker.size() != 0) {
			orderList = new String[listWorker.size()];
			Iterator<OrderList> itr = listWorker.iterator();
			int i = 0;
			while (itr.hasNext()) {
				orderList[i] = new String(this.prefix
						+ Integer.toString(itr.next().getOrder_id()));
				i++;
			}
			pane = new JScrollPane();
			pane.setBounds(10, 44, 124, 142);
			pane.setFont(Fonts.getFont());
			this.add(pane);
			this.list = new JList<Object>(orderList);
			this.list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
			pane.setViewportView(list);
			list.setVisibleRowCount(5);
			this.clientList = clientList;
			list.setFont(Fonts.getFont());
			list.addListSelectionListener(new ListSelectionListener() {

				@Override
				public void valueChanged(ListSelectionEvent event) {
					if (event.getValueIsAdjusting() == false) {
						String value = (String) list.getSelectedValue();
						value = value.substring(prefix.length(), value.length());
						int idClient = Integer.parseInt(value);
						Iterator<OrderList> itr = CarryGoods.this.clientList
								.iterator();
						OrderList item = new OrderList();
						boolean flag = true;
						while (itr.hasNext() && flag) {
							item = itr.next();
							if (item.getOrder_id() == idClient) {
								flag = false;

							}
						}
						CarryGoods.this.setOrderListClient(item);

						@COMMAND(key = "getGoodsListCommand")
						@CONTEXT(list = {
								@PARAMETER(key = "orderGoodsid", type = Integer.class, optional = true),
								@PARAMETER(key = "addres", type = String.class, optional = true),
								@PARAMETER(key = "telephone", type = Integer.class, optional = true),
								@PARAMETER(key = "summ", type = Integer.class, optional = true),
								@PARAMETER(key = "goods", type = Goods.class, optional = true),
								@PARAMETER(key = "position", type = Position.class, optional = true),
								@PARAMETER(key = "description", type = Description.class, optional = true)

						})
						class cmnd extends GetGoodsListCommand {
						}
						;
						Controller.toController(CarryGoods.this,
								cmnd.class.getAnnotation(CONTEXT.class),
								cmnd.class.getAnnotation(COMMAND.class));

					}

				}
			});
		} else {
			JOptionPane.showMessageDialog(this, Languages.getProperty("CarryGoodsLable9"), "����������",
					JOptionPane.INFORMATION_MESSAGE);
			TabbedPane.tabbedPane.remove(CarryGoods.this);
		}

	}

	/**
	 * ����� �� ������� ��� �������
	 * @param addres ������ �볺���
	 * @param Telephone ������� �볺���
	 * @param sum ���� ����������
	 * @param goods ������ ������
	 * @param positions ������ �������
	 * @param descriptions ������ ����� ������
	 */
	public void update(String addres, String Telephone, double sum,
			List<Goods> goods, List<Position> positions,
			List<Description> descriptions) {
		lblIdid.setFont(Fonts.getFont());
		lblIdid.setBounds(289, 46, 104, 17);
		lblIdid.setText(Integer.toString(OrderListClient.getProfile_id()));
		add(lblIdid);

		lblIdid.setText(Integer.toString(getOrderListClient().getProfile_id()));
		lblSumm.setFont(Fonts.getFont());
		lblSumm.setBounds(289, 139, 104, 17);
		lblSumm.setText(Double.toString(sum));
		add(lblSumm);

		lblTelephone.setFont(Fonts.getFont());
		lblTelephone.setBounds(289, 105, 104, 17);
		lblTelephone.setText(Telephone);
		add(lblTelephone);

		lblAddres.setFont(Fonts.getFont());
		lblAddres.setBounds(289, 77, 104, 17);
		lblAddres.setText(addres);
		add(lblAddres);
		this.updateUI();
		this.descriptions = descriptions;
		this.goods = goods;
		this.positions = positions;
	}
/**
 * ������ �� ������� ������� �����������
 * @return �������
 */
	public Profile getProfileWorker() {
		return profileWorker;
	}
/**
 * ����� �� ���������� ������ �����������
 * @param profileWorker
 */
	public void setProfileWorker(Profile profileWorker) {
		this.profileWorker = profileWorker;
	}
/**
 * ����� �� �������� ����������
 * @return ����������
 */
	public OrderList getOrderListClient() {
		return OrderListClient;
	}
/**
 * ����� �� ���������� ����������
 * @param orderListClient ���������� �볺���
 */
	public void setOrderListClient(OrderList orderListClient) {
		OrderListClient = orderListClient;
	}
/**
 * ����� ������� �������, �� ����� ����� ������ ���������
 */
	private void getNewOrderList() {
		@COMMAND(key = "GetOrderListCommand")
		@CONTEXT(list = {
				@PARAMETER(key = "Profile", type = Profile.class, optional = true),
				@PARAMETER(key = "list", type = ArrayList.class, optional = true), })
		class cmnd extends GetOrderListCommand {
		}
		;
		Controller.toController(CarryGoods.this,
				cmnd.class.getAnnotation(CONTEXT.class),
				cmnd.class.getAnnotation(COMMAND.class));
	}
	/**
	 * ����� ���������� ����� �����
	 * @param className ���� ����� �����
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
