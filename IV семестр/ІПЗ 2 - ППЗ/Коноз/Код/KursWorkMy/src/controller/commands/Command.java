package controller.commands;

import java.util.Hashtable;

import controller.ContextForCommand;
import controller.Controller;

/**
 * Клас задає інтерфейс для віс команд, які вигляд буде посилати контролеру.
 * @author Коноз Андрій 
 */
public abstract class Command implements Runnable{

	/**
	 * {@value} контекст команди.
	 */
	protected Hashtable<String, Object> context;
	/**
	 * Таблиця з написами на деяких компонентах.
	 */
	protected Hashtable<String, String> continfo;
	/**
	 * {@value} посилання на контролер програми.
	 */
	Controller controller = Controller.getController();
	/* (non-Javadoc)
	 * @see java.lang.Runnable#run()
	 */
	@Override
	public abstract void  run();
	
	/**
	 * Метод встановлює контекс.
	 * @param context контекст, який потрбно встановити даній команді.
	 */
	public void setContext(ContextForCommand context){
		
		this.context = context.getHashTable();
	}
}
