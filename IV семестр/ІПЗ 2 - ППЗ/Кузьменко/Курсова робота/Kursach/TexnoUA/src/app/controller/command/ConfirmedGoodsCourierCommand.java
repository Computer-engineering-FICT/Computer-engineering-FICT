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
 * команда, що виконує підтвердження видачі товару кур'єру

 *
 */
@COMMAND(key = "confimerGoods")
@CONTEXT(list = {
		@PARAMETER(key = "ordergoods", type = OrderGoods.class, optional = true),
		@PARAMETER (key = "orderList", type = OrderList.class, optional = true )
})
public class ConfirmedGoodsCourierCommand implements Command {
	/**
	 * поле для зберігання посилання на вигляд
	 */
	private GoodsForCourier dataView;
/**
 * виконавчий метод
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
	 * метод що встановлює посилання на вигляд
	 * 
	 * @param dataView посилання на вигляд
	 */
	@Override
	public void setDataView(Object dataView) {
		this.dataView = (GoodsForCourier) dataView;

	}

}
