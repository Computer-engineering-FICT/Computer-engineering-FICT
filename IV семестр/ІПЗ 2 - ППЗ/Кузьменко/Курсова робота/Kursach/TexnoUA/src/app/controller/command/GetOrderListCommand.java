package app.controller.command;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.OrderGoods;
import app.model.OrderList;
import app.model.Profile;
import app.view.CarryGoods;

/**
 * ������� �� ���� ������ ���������
 * @author Vova
 *
 */
@COMMAND(key = "GetOrderListCommand")
@CONTEXT(list = {
		@PARAMETER(key = "Profile", type = Profile.class, optional = true),
		@PARAMETER(key = "list", type = ArrayList.class, optional = true), })
public class GetOrderListCommand implements Command {
	/**
	 * ��������� �� ������
	 */
	private CarryGoods dataView;

	/**
	 * ���������� ����� �������
	 */
	@Override
	public void run() {
		CRUDInterface crud = Controller.getDao();
		try {
			List<OrderList> list = crud.select(OrderList.class);
			// ������ ��������� ����������� ����������
			List<OrderList> listOrder = new ArrayList<>();
			// ������ �볺��� ��� ���������� ����������
			List<OrderList> listClient = new ArrayList<>();
			Iterator<OrderList> iteratog = list.listIterator();

			while (iteratog.hasNext()) {
				OrderList orderList = iteratog.next();
				OrderGoods ordrGoods = crud.read(OrderGoods.class,
						orderList.getOrder_id());
				if (ordrGoods.getIsPay() == true) {
					iteratog.remove();
				}
			}
			iteratog = list.listIterator();
			while (iteratog.hasNext()) {
				OrderList item = iteratog.next();
				if (item.getProfile_id() == dataView.getProfileWorker().getId()) {
					listOrder.add(item);
				} else
					listClient.add(item);
			}
			dataView.update(listOrder, listClient);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * ����� �� ���������� ��������� �� ������
	 * 
	 * @param dataView
	 *            ��������� �� ������
	 */
	@Override
	public void setDataView(Object dataView) {
		GetOrderListCommand.this.dataView = (CarryGoods) dataView;
	}

}
