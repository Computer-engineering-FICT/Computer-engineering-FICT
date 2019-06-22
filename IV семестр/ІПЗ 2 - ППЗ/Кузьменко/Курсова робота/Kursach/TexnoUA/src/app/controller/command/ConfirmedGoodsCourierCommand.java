package app.controller.command;

import java.util.Iterator;
import java.util.List;
import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.OrderGoods;
import app.model.OrderList;
import app.view.GoodsForCourier;
/**
 * �������, �� ������ ������������ ������ ������ ���'���

 *
 */
@COMMAND(key = "confimerGoods")
@CONTEXT(list = {
		@PARAMETER(key = "ordergoods", type = OrderGoods.class, optional = true),
		@PARAMETER (key = "orderList", type = OrderList.class, optional = true )
})
public class ConfirmedGoodsCourierCommand implements Command {
	/**
	 * ���� ��� ��������� ��������� �� ������
	 */
	private GoodsForCourier dataView;
/**
 * ���������� �����
 */
	@Override
	public void run() {
		int profile_id = dataView.getCourierId();
		CRUDInterface crud = Controller.getDao();
		try {
			List<OrderList> orderLists = crud.select(OrderList.class);
			Iterator<OrderList> itr = orderLists.iterator();
			while (itr.hasNext()) {
				OrderList orderList = (OrderList) itr.next();
				OrderGoods goods = crud.read(OrderGoods.class,
						orderList.getOrder_id());
				if (orderList.getProfile_id() != profile_id
						|| goods.getIsOnCourier() == false) {
					goods.setIsOnCourier(true);
					crud.update(goods);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

	/**
	 * ����� �� ���������� ��������� �� ������
	 * 
	 * @param dataView ��������� �� ������
	 */
	@Override
	public void setDataView(Object dataView) {
		this.dataView = (GoodsForCourier) dataView;

	}

}
