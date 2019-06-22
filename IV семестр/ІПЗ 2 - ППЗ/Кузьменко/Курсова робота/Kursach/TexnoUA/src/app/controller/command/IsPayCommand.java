package app.controller.command;
import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.OrderGoods;
import app.view.CarryGoods;
/**
 * �������, �� ������� �� �������� ����������
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
	 * ��������� �� ������
	 */
	private CarryGoods dataView;
	/**
	 * ���������� �����
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
	 * ����� �� ���������� ��������� �� ������
	 * @param dataView ��������� �� ������
	 */
	@Override
	public void setDataView(Object dataView) {
		this.dataView = (CarryGoods) dataView;

	}

}
