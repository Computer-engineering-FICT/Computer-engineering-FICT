package app.controller.command;

import dao.CRUDInterface;
import app.controller.Controller;
import app.controller.command.annotation.COMMAND;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.model.ContactInformation;
import app.model.Profile;
import app.view.Authorisation;
import app.view.EditInfo;

/**
 * команда що виконує редагування інформації
 * 
 * 
 */
@COMMAND(key = "editInfo")
@CONTEXT(list = {
		@PARAMETER(key = "profile", type = Profile.class, optional = true),
		@PARAMETER(key = "password", type = String.class, optional = true),
		@PARAMETER(key = "email", type = String.class, optional = true),
		@PARAMETER(key = "addres", type = String.class, optional = true),
		@PARAMETER(key = "telephone", type = String.class, optional = true) })
public class EditInfoCommand implements Command {
	/**
	 * поле для зберігання силки на представлення
	 */
	private EditInfo infoView;
/**
 * інформація про текущого користувача
 */
	private Profile profile = Authorisation.getProfile();
/**
 * текущий пароль
 */
	private String password;
/**
 * текущий логі
 */
	private String login;
/**
 * текуща адреса електронної пошти
 */
	private String email;
/**
 * текуща домашня адреса
 */
	private String addres;
/**
 * текущий номер телефону
 */
	private String telephone;
/**
 * виконавчий метод команди
 */
	@Override
	public void run() {
		CRUDInterface crud = Controller.getDao();
		try {
			ContactInformation contInform = crud.read(ContactInformation.class,
					profile.getContactinformation_id());
			Profile prfl = crud.read(Profile.class, profile.getId());
			contInform.setId(profile.getContactinformation_id());
			contInform.setAdress(addres);
			contInform.setTelephone(telephone);
			contInform.setEmail(email);
			prfl.setCategory_id(profile.getCategory_id());
			prfl.setContactinformation_id(profile.getContactinformation_id());
			prfl.setState_id(profile.getState_id());
			prfl.setId(profile.getId());
			prfl.setLogin(login);
			prfl.setPassword(password);
			crud.update(contInform);
			crud.update(prfl);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
		}
	}
/**
 * метод для встановлення силки на обєкт представлення
 * @param dataView посилання на представлення
 */
	@Override
	public void setDataView(Object dataView) {
		EditInfoCommand.this.infoView = (EditInfo) dataView;
		EditInfoCommand.this.addres = EditInfoCommand.this.infoView.getAddres();
		EditInfoCommand.this.email = EditInfoCommand.this.infoView.getEmail();
		EditInfoCommand.this.telephone = EditInfoCommand.this.infoView
				.getTelephone();
		EditInfoCommand.this.login = EditInfoCommand.this.infoView.getLogin();
		EditInfoCommand.this.password = EditInfoCommand.this.infoView
				.getPassword();

	}

}
