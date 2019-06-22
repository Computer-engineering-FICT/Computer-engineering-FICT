package app.view;

import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.ListSelectionModel;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.JList;
import javax.swing.JLabel;
import app.controller.Controller;
import app.controller.command.GetAllGoodsCommand;
import app.controller.command.ResupplyCommand;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.Description;
import app.model.Goods;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Vova
 *	����, �� ������ ��������� ����������� ��� ��������� ������
 */
@SuppressWarnings("serial")
public class ResupplyGoods extends JPanel {
	
	private JLabel lblNameGoods;
	private JLabel lblNumberOfGoods;
	@SuppressWarnings("rawtypes")
	private JList list = new JList();
	private Integer GoodsID = new Integer(0);
	private Integer numberOfGoods = new Integer(0);

	private JButton bttnResuply = new JButton(Languages.getProperty("RespplGoods5"));
	private JButton bttnExit = new JButton(Languages.getProperty("closeBtn"));

	/**
	 * ��������� ���� �����. 
	 */
	public ResupplyGoods() {
		setFont(Fonts.getFont());
		@COMMAND(key = "getAllGoods")
		@CONTEXT(list = {
				@PARAMETER(key = "goods", type = Goods.class, optional = true),
				@PARAMETER(key = "listGoods", type = List.class, optional = true) })
		class cmnd extends GetAllGoodsCommand {
		}
		;
		Controller.toController(ResupplyGoods.this,
				cmnd.class.getAnnotation(CONTEXT.class),
				cmnd.class.getAnnotation(COMMAND.class));

		setVisible(true);
		setLayout(null);
		JLabel nameGoodsLabel = new JLabel(Languages.getProperty("nameGoods"));
		nameGoodsLabel.setFont(Fonts.getFont());
		nameGoodsLabel.setBounds(171, 23, 115, 25);
		add(nameGoodsLabel);

		JLabel CountLabel = new JLabel(Languages.getProperty("count"));
		CountLabel.setFont(Fonts.getFont());
		CountLabel.setBounds(171, 59, 115, 25);
		add(CountLabel);

		bttnResuply.setFont(Fonts.getFont());
		bttnResuply.setBounds(167, 90, 119, 25);
		bttnResuply.setEnabled(false);
		add(bttnResuply);

		bttnExit.setFont(Fonts.getFont());
		bttnExit.setBounds(296, 90, 119, 25);
		add(bttnExit);
		bttnExit.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				TabbedPane.tabbedPane.remove(ResupplyGoods.this);

			}
		});
		bttnResuply.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				StringBuilder message = new StringBuilder(Languages.getProperty("RespplGoods1")+" '");
				message.append(lblNameGoods.getText());
				message.append("' "+Languages.getProperty("RespplGoods2"));
				message.append(lblNumberOfGoods.getText());
				message.append("��. \n");
				message.append(Languages.getProperty("RespplGoods3")+"\n");
				message.append(Languages.getProperty("RespplGoods4"));
				String h = JOptionPane.showInputDialog(
						ResupplyGoods.this, message, Languages.getProperty("info"),
						JOptionPane.QUESTION_MESSAGE);
				int g =0;
				if (h!=null){
					h =h.trim();
					if (h.equalsIgnoreCase("")==false)
						g = Integer.parseInt(h);					
				}
				ResupplyGoods.this.setNumberOfGoods(g);
				@SuppressWarnings("hiding")
				@COMMAND(key = "ressuplyGoods")
				@CONTEXT(list = {
						@PARAMETER(key = "goods", type = Goods.class, optional = true),
						@PARAMETER(key = "numberofgoods", type = Integer.class, optional = true) })
				class cmnd extends ResupplyCommand {
				}
				;
				Controller.toController(ResupplyGoods.this,
						cmnd.class.getAnnotation(CONTEXT.class),
						cmnd.class.getAnnotation(COMMAND.class));
				TabbedPane.tabbedPane.remove(ResupplyGoods.this);
				TabbedPane.addTabPanel(new ResupplyGoods(), Languages.getProperty("getGoods"));
			}
		});

	}
/**
 * ����� �� ������� ��� ��� ����������
 * @param goods ������ ������
 * @param descriptions ������ �����
 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void update(final List<Goods> goods, List<Description> descriptions) {
		final ArrayList<String> numberOfGoodsList = new ArrayList<String>(
				goods.size());
		int i = 0;
		for (Goods item : goods) {
			numberOfGoodsList.add(new String(Integer.toString(item
					.getNumberofgoods())));
			i++;
		}
		i = 0;
		final ArrayList<String> namegoods = new ArrayList<String>(
				descriptions.size());
		for (Description item : descriptions) {
			namegoods.add(new String(item.getName()));

		}
		String[] mas = new String[namegoods.size()];
		for (String string : namegoods) {
			mas[i] = new String(string);
			i++;
		}

		list = new JList(mas);
		this.list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		list.setVisibleRowCount(10);
		JScrollPane pane = new JScrollPane(list);
		pane.setBounds(34, 23, 127, 253);
		pane.setFont(Fonts.getFont());
		pane.setViewportView(list);
		pane.setVisible(true);
		add(pane);
		lblNameGoods = new JLabel();
		lblNumberOfGoods = new JLabel();

		lblNameGoods.setFont(Fonts.getFont());
		lblNameGoods.setBounds(290, 23, 115, 25);
		lblNumberOfGoods.setFont(Fonts.getFont());
		lblNumberOfGoods.setBounds(296, 59, 115, 25);

		add(lblNameGoods);
		add(lblNumberOfGoods);
		list.addListSelectionListener(new ListSelectionListener() {

			@Override
			public void valueChanged(ListSelectionEvent event) {
				if (event.getValueIsAdjusting() == false) {
					String value = (String) list.getSelectedValue();

					int i = namegoods.indexOf(value);
					lblNameGoods.setText(namegoods.get(i));
					lblNameGoods.setVisible(true);
					bttnResuply.setEnabled(true);
					lblNumberOfGoods.setText(numberOfGoodsList.get(i));
					lblNumberOfGoods.setVisible(true);
					ResupplyGoods.this.setGoodsID(new Integer(goods.get(i)
							.getId()));

				}

			}
		});
	}
/**
 * ����� �� ������� �������� ������
 * @return ������� ������
 */
	public Integer getNumberOfGoods() {
		return numberOfGoods;
	}
/**
 * �����, �� ���������� ������� ������
 * @param numberOfGoods ������� ������
 */
	public void setNumberOfGoods(Integer numberOfGoods) {
		this.numberOfGoods = numberOfGoods;
	}
/**
 * ����� �� ������� ���������������� ����� ������
 * @return ���������������� �����
 */
	public Integer getGoodsID() {
		return ResupplyGoods.this.GoodsID;
	}
/**
 * ����� �� ���������� ���������������� ����� ������
 * @param goodsID ���������������� �����
 */
	public void setGoodsID(Integer goodsID) {
		ResupplyGoods.this.GoodsID = goodsID;
	}
	/**
	 * �����, �� ���������� ����� ����
	 * @param className ����� �����
	 */
	public static void setStyle(String className){
		try {
			UIManager.setLookAndFeel(className);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (UnsupportedLookAndFeelException e) {
			e.printStackTrace();
		}
	}

}
