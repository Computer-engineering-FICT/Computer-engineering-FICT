package app.controller.command;

import java.util.List;
import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.Description;
import app.model.Goods;
import app.view.ResupplyGoods;
/**
 *	�������, �� ������� �� ������
 
 */
@COMMAND(key = "getAllGoods")
@CONTEXT(list={
		@PARAMETER(key = "goods", type = Goods.class, optional = true),
		@PARAMETER(key = "listGoods", type = List.class, optional = true)
})
public class GetAllGoodsCommand implements Command {
	/**
	 * ��������� �� �������������
	 */
	private ResupplyGoods dataView;
	/**
	 * ���������� �����
	 */
	@Override
	public void run() {
		CRUDInterface crud = Controller.getDao();
		try {
			List<Goods> goods = crud.select(Goods.class);
			List<Description> descriptions = crud.select(Description.class);
			dataView.update(goods,descriptions);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
/**
 * ����� �� ���������� ��������� �� ������
 * @param dataView ��������� �� ������
 */
	@Override
	public void setDataView(Object dataView) {
		// TODO Auto-generated method stub
		this.dataView = (ResupplyGoods) dataView;
	}

}
