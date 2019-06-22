package app.controller.command;



/**
 *	інтерфейс команди
 *
 */
public interface Command extends Runnable  {
/**
 * виконавчий метод команди
 */
	@Override
	public void run();
/**
 * метод для встановлення зв'язку з виглядом	
 * @param dataView посилання на клас вигляду
 */
	public void setDataView(Object dataView);
	
	
}
