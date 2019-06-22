package controller;


import controller.Factory.CommandFactory;
import controller.Validator.Validator;
import controller.commands.Command;
import dao.CRUIDRealisation;



/**
 * Кла реалізує контролер програми.
 * @author Коноз Андрій 
 */
public class Controller {
	
	/**
	 * {@value} посилання на самого себе.
	 */
	private static Controller controller;
	
	/**
	 * {@value} посилання на об'єкт доступу до даних.
	 */
	public CRUIDRealisation dao;
	
	
	/**
	 * Приватний конструктор для створення об'єкта даного типу. Частина патерну Одинак.
	 */
	private Controller(){
		
	}
	
	/**
	 * Частина патерну Одинак.
	 * @return посилання на єдини контролер.
	 */
	public static Controller getController(){
		if (controller == null){
			controller = new Controller();
		}
		return controller;
	}
	
	/**
	 * Метод запуску на виконаня команди. 
	 * Перед запском проводиться перевірка валідносі.
	 * @param context контекст для команди.
	 * @param id назва команди.
	 */
	public void execute(ContextForCommand context, String id){
		Command command = CommandFactory.getCommand(id);
		command.setContext(context);
		if(Validator.isValid(command, context)){
			MyExecutor.execute(command);
		}
	}

}
