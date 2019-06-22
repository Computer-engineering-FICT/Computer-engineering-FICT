package app.controller.command;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.ContactInformation;
import app.model.Description;
import app.model.Goods;
import app.model.Goods_has_Description;
import app.model.Position;
import app.view.CarryGoods;

/**
 * команда для  отримання списку списку товарів

 *
 */
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
public class GetGoodsListCommand implements Command {
/**
 * посилання на вигляд
 */
	private CarryGoods dataView;
/**
 * виконавчий метод 
 */
	@Override
	public void run() {
		int order_id = dataView.getOrderListClient().getOrder_id();
		CRUDInterface crud = Controller.getDao();
		try {
			List<Position> listPosition = crud.select(Position.class);
			Iterator<Position> itr = listPosition.iterator();
			Position item;
			while (itr.hasNext()) {
				item = itr.next();
				if (item.getOrder_id() != order_id)
					itr.remove();
			}
			List<Goods> goodsList = new ArrayList<>();
			itr = listPosition.iterator();
			while (itr.hasNext()) {
				Position position = (Position) itr.next();
				goodsList.add((Goods) crud.read(Goods.class,
						position.getGoods_id()));
			}
			List<Description> listDescriptions = new ArrayList<>();
			for (Goods goods : goodsList) {
				listDescriptions.add((Description) crud.read(Description.class,
						((Goods_has_Description) (crud.read(
								Goods_has_Description.class, goods.getId())))
								.getDescription_id()));
			}
			double sum=0;
			
			Iterator<Position> pIterator = listPosition.iterator();
			Iterator<Goods> gIteratot = goodsList.iterator();
			while (pIterator.hasNext()&&gIteratot.hasNext()) {
				sum += pIterator.next().getCount()*gIteratot.next().getMarkofgoods();
			}
			
			ContactInformation info = crud.read(ContactInformation.class, dataView.getOrderListClient().getProfile_id());
			dataView.update(info.getAdress(), info.getTelephone(), sum, goodsList, listPosition, listDescriptions);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
/**
 * метод що встановлює посилання на вигляд
 * @param dataView посилання на вигляд
 */
	@Override
	public void setDataView(Object dataView) {
		GetGoodsListCommand.this.dataView = (CarryGoods) dataView;

	}

}
