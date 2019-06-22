package app.controller.command;

import java.util.List;
import java.util.Iterator;

import javax.swing.JOptionPane;

import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.Category;
import app.model.Profile;
import app.model.State;
import app.view.Authorisation;
import app.view.Languages;


/**
 *	команда авторизації
 * @author Vova
 */
@COMMAND(key = "AutorisationCmnd")
@CONTEXT(list = {
		@PARAMETER(key = "login", type = String.class, optional = true),
		@PARAMETER(key = "password", type = String.class, optional = true) })
public class AutorisationCommand implements Command {
	
	/**
	 * текущий логін
	 * @author Vova
	 */
	private static String login = null;
	/**
	 * текущий палоль
	 * @author Vova
	 */
	private static String password = null;
	/**
	 * поле для зберігання даних моделі
	 * @author Vova
	 */
	private Profile prof = null;
	/**
	 * поле для зберігання посилання на обєкт вигляду
	 * @author Vova
	 */
	private Authorisation dataView;
	/**
	 * метод встановлює посилання вигляду
	 * @param dataView вигляд
	 */
	@SuppressWarnings("static-access")
	@Override
	public void setDataView(Object dataView) {
		AutorisationCommand.this.dataView = (Authorisation) dataView;
		login = ((Authorisation) dataView).getProfile().getLogin();
		password = ((Authorisation) dataView).getProfile().getPassword();
	}
	/**
	 * конструктор rkfce
	 */
	public AutorisationCommand() {

	}
	/**
	 * виконавчий метод команди
	 */
	@Override
	public void run() {

		CRUDInterface crud = Controller.getDao();
		try {
			List<Profile> profiles = crud.select(Profile.class);
			Iterator<Profile> itr = profiles.iterator();

			boolean flag = true;
			prof = null;
			while (itr.hasNext() && flag) {
				prof = itr.next();
				flag = true;
				if (prof.getLogin().equalsIgnoreCase(login)
						&& prof.getPassword().equalsIgnoreCase(password)) {
					flag = false;
				} else
					prof = null;
			}
			String message = new String();
			if (prof != null) {
				Category category = (Category) crud.read(Category.class,
						prof.getCategory_id());
				if (category.getCategory().equals("Storeman")
						|| category.getCategory().equals("Courier")) {

					message = "Авторизація пройшла успішно";
					
				} else if (category.getCategory().equals("Administrator")) {
					message = "Зверніться до Коноза Андрія";
				} else if (category.getCategory().equals("Client")) {
					message = "Зверніться до Кахерського Олега";
				} else {
					message = "Направильно введений логін та пароль. Перевірте чи правильно ви ввели дані або зареєструйтесь";

				}
				State state = crud.read(State.class, prof.getState_id());
				if (state.getState().equalsIgnoreCase("Active")||state.getState().equalsIgnoreCase("Unbanned"))
				dataView.update(prof, category, message);
				else {
					JOptionPane.showMessageDialog(dataView, Languages.getProperty("autorisatMess"), Languages.getProperty("errorMess"), JOptionPane.ERROR_MESSAGE);
				}

			} else {
				message = "Невірний логін або пароль";
				dataView.update(prof, null, message);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
/**
 * повертає текущий 
 * @return логін
 */
	public String getLogin() {
		return login;
	}
/**
 * встановлює новий логін замість текущого
 * @param login новий логін
 */
	@SuppressWarnings("static-access")
	public void setLogin(String login) {
		this.login = new String(login);
	}
/**
 * повертає текущий пароль
 * @return пароль
 */
	public String getPassword() {
		return password;
	}
/**
 * встановлює новий текущий пароль
 * @param password новий пароль
 */
	@SuppressWarnings("static-access")
	public void setPassword(String password) {
		this.password = new String(password);

	}

}
