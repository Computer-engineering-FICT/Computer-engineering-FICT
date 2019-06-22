package controller.Factory;

import controller.commands.Autorization;
import controller.commands.ChangeState;
import controller.commands.Command;
import controller.commands.CreateCatalog;
import controller.commands.CreateGoods;
import controller.commands.DeleteCatalog;
import controller.commands.DeleteGoods;
import controller.commands.EditCatalog;
import controller.commands.EditGoods;
import controller.commands.GetListOfUsers;
import controller.commands.GetUserInformation;
import controller.commands.OpenGoods;
import controller.commands.getListOfItems;

/**
 * Клас займається створенням команд.
 * @author Коноз Андрій 
 */
public class CommandFactory {
	/**
	 * {@value} назва команди авторизації.
	 */
	public static final String AUTORIZATION = "Autorization";
	/**
	 * {@value} назва команди вибірки каталогів і товарів.
	 */
	public static final String GET_LIST_OF_ITEM = "GetListOfItem";
	/**
	 * {@value} назва команди створення каталогу.
	 */
	public static final String CREATE_CATALOG = "CreateCatalog";
	/**
	 * назва команди видалення каталогу.
	 */
	public static final String DELETE_CATALOG = "DeleteCatalog";
	/**
	 * назва команди створення каталогу.
	 */
	public static final String EDIT_CATALOG = "EditCatalog";
	/**
	 * назва команди вибірки списку користувачів.
	 */
	public static final String GET_LIST_OF_USERS = "GetListOfUsers";
	/**
	 * назва команди створення товару.
	 */
	public static final String CREATE_GOODS = "CreateGoods";
	/**
	 * назва команди видалення товару.
	 */
	public static final String DELETE_GOODS = "DeleteGoods";
	/**
	 * назва команди ддетального перегляду товару.
	 */
	public static final String OPEN_GOODS = "OpenGoods";
	/**
	 * назва команди редагування товару.
	 */
	public static final String EDIT_GOODS = "EditGoods";
	/**
	 * назва команди детального перегляду інформації про користувача.
	 */
	public static final String GET_USER_INFO = "GetUserInformation";
	/**
	 * назва команди зміни стану профілю.
	 */
	public static final String CHANGE_STATE = "ChangeState";
	
	/**
	 * Метод, який створює команду за назвою.
	 * @param id назва команди.
	 * @return команду типу {@link Command}
	 */
	public static Command getCommand(String id){
		Command result = null;
		switch (id) {
		case AUTORIZATION:
			result = new Autorization();
			break;
		case GET_LIST_OF_ITEM:
			result = new getListOfItems();
			break;
		case CREATE_CATALOG:
			result = new CreateCatalog();
			break;
		case DELETE_CATALOG:
			result = new DeleteCatalog();
			break;
		case EDIT_CATALOG:
			result = new EditCatalog();
			break;
		case GET_LIST_OF_USERS:
			result = new GetListOfUsers();
			break;
		case CREATE_GOODS:
			result = new CreateGoods();
			break;
		case DELETE_GOODS:
			result = new DeleteGoods();
			break;
		case OPEN_GOODS:
			result = new OpenGoods();
			break;
		case EDIT_GOODS:
			result = new EditGoods();
			break;
		case GET_USER_INFO:
			result = new GetUserInformation();
			break;
		case CHANGE_STATE:
			result = new ChangeState();
			break;
		}
		return result;
	}

}
