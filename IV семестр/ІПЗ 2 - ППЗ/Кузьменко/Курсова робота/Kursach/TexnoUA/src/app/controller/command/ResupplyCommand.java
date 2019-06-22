package app.controller.command;

import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.Goods;
import app.view.ResupplyGoods;

/**
 * команда, що виконує запит на поповнення товару
 * @author Vova
 *
 */
@COMMAND(key = "ressuplyGoods")
@CONTEXT(list = {
		@PARAMETER(key = "goods", type = Goods.class, optional = true),
		@PARAMETER(key = "numberofgoods", type = Integer.class, optional = true) })
public class ResupplyCommand implements Command {
	/**
	 * посилання на вигляд
	 */
	private ResupplyGoods dataView;

	/**
	 * виконавчий метод
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
	 * Метод що встановлює посилання на вигляд
	 * 
	 * @param dataView
	 *            посилання на вигляд
	 */
	@Override
	public void setDataView(Object dataView) {
		this.dataView = (ResupplyGoods) dataView;

	}

}
