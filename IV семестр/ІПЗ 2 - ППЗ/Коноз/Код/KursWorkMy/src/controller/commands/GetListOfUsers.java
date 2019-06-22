package controller.commands;

import java.util.List;

import javax.swing.JTable;
import javax.swing.ListSelectionModel;

import application.ContextUtils;
import application.MainFrame;
import application.Model.ContactInformation;
import application.Model.Profile;
import controller.Factory.CommandFactory;
import controller.annotations.COMMAND;
import controller.annotations.CONTEXT;
import controller.annotations.PARAMETER;
import dao.FilterStub;
/**
 * Клас реалізовує інтерфейс {@link Command} для операції відкриття списку користувачів.
 * @author Коноз Андрій.
 *
 */
@COMMAND(key = CommandFactory.GET_LIST_OF_ITEM)
@CONTEXT(list = {
				@PARAMETER(key = "proprietor", type = MainFrame.class)
				}
		)
public class GetListOfUsers extends Command{

	/**
	 * Список, який містить контакну інформацію, яка зберігається в базі даних.
	 */
	private List<ContactInformation> contactList;
	/* (non-Javadoc)
	 * @see controller.commands.Command#run()
	 */
	@Override
	public void run() {
		JTable table;
		String matr [][];
		List<Profile> profileList;
		
		continfo = ContextUtils.loadContext("Service");
		try{
			
			profileList = controller.dao.select(Profile.class, new FilterStub());
			contactList = controller.dao.select(ContactInformation.class, new FilterStub());
			matr = new String [profileList.size()][3];
			int i = 0;
			for(Profile prof : profileList){
				matr[i][0] = prof.getLogin();
				matr[i][1] = getCategory(prof.getCategory());
				matr[i][2] = getTelephone(prof.getContactinform());
				i++;
			}
			
			String titles[] = {continfo.get("Login"), continfo.get("Category"), continfo.get("Telephone")};
			table = new JTable(matr, titles);
			table.getSelectionModel().setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
			table.setFillsViewportHeight(true);
			table.setRowSelectionInterval(0, 0);
			((MainFrame) context.get("proprietor")).getTitleLabel().setText(continfo.get("Users"));
			((MainFrame) context.get("proprietor")).getScrolPane().setViewportView(table);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	/**
	 * Метод для вибірки категорії через індитифікатор.
	 * @param id індинтифікатор.
	 * @return повертає назву категорії.
	 */
	private String getCategory(int id){
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
	
	/**
	 * Метод для вибірки номера телефону через id
	 * @param id індинтифікатор
	 * @return повертає номер телефону.
	 */
	private String getTelephone(int id){
		String result = continfo.get("None");
		for(ContactInformation cont : contactList){
			if(cont.getId() == id){
				result = Integer.toString(cont.getTelepfone());
			}
		}
		return result;
	}
	
	
}
