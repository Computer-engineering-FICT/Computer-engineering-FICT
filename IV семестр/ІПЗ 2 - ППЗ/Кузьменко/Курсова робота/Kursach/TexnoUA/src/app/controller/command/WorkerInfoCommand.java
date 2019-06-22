package app.controller.command;

import java.util.HashMap;

import dao.CRUDInterface;
import app.view.Authorisation;
import app.view.WorkerInfo;
import app.controller.Controller;
import app.controller.command.annotation.*;
import app.model.*;

/**
 * ������� �� ���� ���������� ��� �����������
 * @author Vova
 *
 */
@COMMAND(key = "WorkerInfoCommand")
@CONTEXT(list = {
		@PARAMETER(key = "profile_id", type = Integer.class, optional = true),
		@PARAMETER(key = "elementes", type = String.class, optional = true) })
public class WorkerInfoCommand implements Command {
	/**
	 * ������������� ��� ������ ���������� ��� �����������
	 */
	private int profile_id = Authorisation.getProfile().getId();
	/**
	 * ��������� �� ������
	 */
	private WorkerInfo dataView;
	/**
	 * ���-����� � ��� �������� ���������� ��� �����������
	 */
	private HashMap<String, String> mapinfo = new HashMap<>();

	/**
	 * ���������� �����
	 */
	@Override
	public void run() {
		try {
			CRUDInterface crud = Controller.getDao();
			Profile profile = crud.read(Profile.class, profile_id);
			mapinfo.put("login", profile.getLogin());
			Category category = crud.read(Category.class,
					profile.getCategory_id());
			State state = crud.read(State.class, profile.getState_id());
			ContactInformation contactInformation = crud.read(
					ContactInformation.class,
					profile.getContactinformation_id());
			mapinfo.put("Category", category.getCategory());
			mapinfo.put("State", state.getState());
			mapinfo.put("Email", contactInformation.getEmail());
			mapinfo.put("Telephone", contactInformation.getTelephone());
			mapinfo.put("Addres", contactInformation.getAdress());
			mapinfo.put("id", Integer.toString(profile_id));
			mapinfo.put("password", profile.getPassword());
			//Authorisation.
			dataView.update(mapinfo);
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
		WorkerInfoCommand.this.dataView = (WorkerInfo) dataView;

		WorkerInfoCommand.this.profile_id = WorkerInfoCommand.this.dataView
				.getProfile_id();
	}

}
