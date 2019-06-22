package controller.commands;

import java.util.List;
import application.Model.Profile;
import controller.Factory.CommandFactory;
import controller.annotations.COMMAND;
import controller.annotations.CONTEXT;
import controller.annotations.PARAMETER;
import dao.FilterStub;

/**
 * Клас, який реалізує команду авторизації користувача в системі.
 * 
 * @author Коноз Андрій
 */
@COMMAND(key = CommandFactory.AUTORIZATION)
@CONTEXT(list = { @PARAMETER(key = "login", type = String.class),
		@PARAMETER(key = "password", type = String.class),
		@PARAMETER(key = "proprietor", type = application.Autorization.class) })
public class Autorization extends Command {

	/*
	 * (non-Javadoc)
	 * 
	 * @see controller.commands.Command#run()
	 */
	@Override
	public void run() {
		try {

			List<Profile> profiles = controller.dao.select(Profile.class,
					new FilterStub());
			for (Profile prof : profiles) {
				if (prof.getLogin().equals(context.get("login"))
						&& prof.getPassword().equals(context.get("password"))) {
					((application.Autorization) context.get("proprietor"))
							.getSolution(prof.getCategory());
					return;
				}
			}
			((application.Autorization) context.get("proprietor"))
					.getSolution(-1);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
