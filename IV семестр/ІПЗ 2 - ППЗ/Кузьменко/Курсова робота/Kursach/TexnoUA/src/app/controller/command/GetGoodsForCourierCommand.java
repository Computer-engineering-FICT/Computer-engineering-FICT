package app.controller.command;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.Description;
import app.model.Goods;
import app.model.Goods_has_Description;
import app.model.OrderGoods;
import app.model.OrderList;
import app.model.Position;
import app.view.GoodsForCourier;

/**
 * команда що повертає усі товари, призначені для текущого кур'єра
 */
@COMMAND(key = "getGoodsForCourier")
@CONTEXT(list = {
		@PARAMETER(key = "goodsList", type = Goods.class, optional = true),
		@PARAMETER(key = "positionList", type = Position.class, optional = true),
		@PARAMETER(key = "descriptionList", type = Description.class, optional = true) })
public class GetGoodsForCourierCommand implements Command {
	/**
	 * посилання на вигляд
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
						|| goods.getIsOnCourier() == true) {
					itr.remove();
				}
			}

			List<Position> positions = new ArrayList<Position>();
			List<Position> pList = crud.select(Position.class);
			for (OrderList orderList : orderLists) {
				for (Position position : pList) {
					if (orderList.getOrder_id() == position.getOrder_id()) {
						positions.add(position);
					}
				}
			}

			List<Goods> goods = new ArrayList<Goods>();
			for (Position position : positions) {
				int id = position.getGoods_id();
				goods.add((Goods) crud.read(Goods.class, id));
			}

			List<Description> descriptions = new ArrayList<Description>();
			for (Goods goods2 : goods) {
				int goods_id = goods2.getId();
				Goods_has_Description item = crud.read(
						Goods_has_Description.class, goods_id);
				int id = item.getDescription_id();
				descriptions
						.add((Description) crud.read(Description.class, id));
			}
			dataView.update(goods, descriptions, positions);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * метод що встановлює посилання на вигляд
	 * 
	 * @param dataView
	 *            посилання на вигляд
	 */
	@Override
	public void setDataView(Object dataView) {
		this.dataView = (GoodsForCourier) dataView;

	}

}
