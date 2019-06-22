package app.controller.command;

import java.util.List;

import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.Category;
import app.model.ContactInformation;
import app.model.Profile;
import app.model.State;
import app.view.Registration;

/**
 * команда що виконує реєстрацію нового користувача
 * @author Vova
 *
 */
@COMMAND(key = "RegistrationCommand")
@CONTEXT(list = {
		@PARAMETER(key = "Profile", type = Profile.class, optional = true),
		@PARAMETER(key = "Category", type = Category.class, optional = true),
		@PARAMETER(key = "ContactInformation", type = ContactInformation.class, optional = true),
		@PARAMETER(key = "State", type = State.class, optional = true) })
public class RegistrationCommand implements Command {
	/**
	 * посилання на вигляд
	 */
	Registration registrationView;

	/**
	 * виконавчий метод
	 */
	@Override
	public void run() {
		try {
			CRUDInterface crud = Controller.getDao();
			crud.insert(registrationView.getState());
			List<State> list = crud.select(State.class);
			registrationView.getProfile().setState_id(
					list.get(list.size() - 1).getId());

			crud.insert(registrationView.getCategory());
			List<Category> listCategory = crud.select(Category.class);
			registrationView.getProfile().setCategory_id(
					listCategory.get(listCategory.size() - 1).getId());
			crud.insert(registrationView.getInfo());
			List<ContactInformation> listInfo = crud
					.select(ContactInformation.class);
			registrationView.getProfile().setContactinformation_id(
					listInfo.get(listInfo.size() - 1).getId());
			crud.insert(registrationView.getProfile());
		} catch (Exception e) {
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
		RegistrationCommand.this.registrationView = (Registration) dataView;
	}

}
