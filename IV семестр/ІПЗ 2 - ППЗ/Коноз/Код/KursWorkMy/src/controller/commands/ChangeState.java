package controller.commands;

import java.util.List;

import application.ContextUtils;
import application.User;
import application.Model.ContactInformation;
import application.Model.Profile;
import controller.Factory.CommandFactory;
import controller.annotations.COMMAND;
import controller.annotations.CONTEXT;
import controller.annotations.PARAMETER;
import dao.FilterStub;
/**
 * ���� �������� ��������� {@link Command} ��� �������� ���� ����� �������.
 * @author ����� �����.
 *
 */
@COMMAND(key = CommandFactory.CHANGE_STATE)
@CONTEXT(list = { @PARAMETER(key = "login", type = String.class),
				  @PARAMETER(key = "state", type = Integer.class),
		  		  @PARAMETER(key = "proprietor", type = User.class) })
public class ChangeState extends Command{

	/* (non-Javadoc)
	 * @see controller.commands.Command#run()
	 */
	@Override
	public void run() {
		continfo = ContextUtils.loadContext("Service");
		try {
			List<Profile> profList = controller.dao.select(Profile.class,
					new FilterStub());
			Profile prof = null;
			ContactInformation contInfo = null;
			for (Profile p : profList) {
				if (p.getLogin().equals(context.get("login"))) {
					prof = p;
					break;
				}
			}
			prof.setState((int) context.get("state"));
			controller.dao.update(prof);
			contInfo = controller.dao.read(ContactInformation.class,
					prof.getContactinform());
			((User) context.get("proprietor")).setInformation(prof.getLogin(),
					getCategory(prof.getCategory()), prof.getState(), contInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * ����� �� ���������������� ������� ����� �������.
	 * @param id ��������������.
	 * @return ����� �������.
	 */
	private String getCategory(int id) {
		String result = continfo.get("None");
		switch (id) {
		case 1:
			result = continfo.get("Client");
			break;
		case 2:
			result = continfo.get("Storeman");
			break;
		case 3:
			result = continfo.get("Administrator");
			break;
		}
		return result;
	}

	

}
