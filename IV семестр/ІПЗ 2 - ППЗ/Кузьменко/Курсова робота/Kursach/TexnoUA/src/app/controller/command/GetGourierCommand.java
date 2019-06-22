package app.controller.command;


import javax.swing.JOptionPane;

import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.Category;
import app.model.Profile;
import app.view.GoodsForCourier;

/**
 * 
 * команда що повертає дані про кур'єра
 * @author Vova
 */
@COMMAND(key = "getGourier")
@CONTEXT(list = {
		@PARAMETER(key = "profile", type = Profile.class, optional = true),
		@PARAMETER(key = "GoodsForCourier", type = GoodsForCourier.class, optional = true) })
public class GetGourierCommand implements Command {
/**
 * посилання на вигляд
 */
	private GoodsForCourier dataView;
/**
 * виконавчий метод команди
 */
	@Override
	public void run() {
		CRUDInterface crud = Controller.getDao();
		try {
			Profile item = crud.read(Profile.class, dataView.getCourierId());
			Category category = crud
					.read(Category.class, item.getCategory_id());
			if (category.getCategory().equalsIgnoreCase("Courier")&&item.getId()!=0){
				dataView.update(item);
			}
			else {
				item.setId(-1);
				dataView.update(item);
			}
		} catch (NullPointerException e) {
			JOptionPane.showMessageDialog(dataView, "Помилка, неправильний ввід", "Інформація", JOptionPane.ERROR_MESSAGE);
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
		this.dataView = (GoodsForCourier) dataView;

	}

}
