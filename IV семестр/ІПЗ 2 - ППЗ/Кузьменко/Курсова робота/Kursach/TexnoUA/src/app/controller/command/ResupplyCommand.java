package app.controller.command;

import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.Goods;
import app.view.ResupplyGoods;

/**
 * �������, �� ������ ����� �� ���������� ������
 * @author Vova
 *
 */
@COMMAND(key = "ressuplyGoods")
@CONTEXT(list = {
		@PARAMETER(key = "goods", type = Goods.class, optional = true),
		@PARAMETER(key = "numberofgoods", type = Integer.class, optional = true) })
public class ResupplyCommand implements Command {
	/**
	 * ��������� �� ������
	 */
	private ResupplyGoods dataView;

	/**
	 * ���������� �����
	 */
	@Override
	public void run() {
		try {
			CRUDInterface crud = Controller.getDao();
			Goods item = crud.read(Goods.class, this.dataView.getGoodsID());
			int number = item.getNumberofgoods() + dataView.getNumberOfGoods();
			item.setNumberofgoods(number);
			crud.update(item);
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
		this.dataView = (ResupplyGoods) dataView;

	}

}
