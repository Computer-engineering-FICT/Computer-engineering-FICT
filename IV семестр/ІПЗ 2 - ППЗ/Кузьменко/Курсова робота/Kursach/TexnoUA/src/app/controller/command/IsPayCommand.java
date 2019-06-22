package app.controller.command;
import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.OrderGoods;
import app.view.CarryGoods;
/**
 * команда, що визначає чи оплачене замовлення
 * @author Vova
 *
 */
@COMMAND(key= "isPayCommnad")
@CONTEXT (list  = {
		@PARAMETER(key = "orderGoods", type = OrderGoods.class, optional = true),
		@PARAMETER (key = "order_id",type = Integer.class, optional = true),
		@PARAMETER(key = "isPay", type = Boolean.class, optional = true)
})
public class IsPayCommand implements Command {
	/**
	 * посилання на вигляд
	 */
	private CarryGoods dataView;
	/**
	 * виконавчий метож
	 */
	@Override
	public void run() {
		CRUDInterface crud = Controller.getDao();
		OrderGoods item = new OrderGoods();
		item.setId(dataView.getOrderListClient().getOrder_id());
		item.setIsPay(true);
		try {
			crud.update(item);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	/**
	 * Метод що встановлює посилання на вигляд
	 * @param dataView посилання на вигляд
	 */
	@Override
	public void setDataView(Object dataView) {
		this.dataView = (CarryGoods) dataView;

	}

}
