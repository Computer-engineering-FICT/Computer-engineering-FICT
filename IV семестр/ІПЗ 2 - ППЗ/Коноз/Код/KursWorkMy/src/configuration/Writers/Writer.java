package configuration.Writers;

import java.util.Properties;

import configuration.CompositeStructure.CompositeComponent;

/**
 * 
 * Даний інтерфейс є единим інтерфейсом для всіх класів, які будуть
 * займатися записом конфігураційних файлів на жорсткий диск.
 * @author Коноз Андрій 
 */
public interface Writer {
	/**
	 *  Даний метод призначений для запису об'єктів в файли.
	 * @param comp об'єкт конфігурації, який необхідно записати
	 * у файл.
	 *
	 */
	public void write(CompositeComponent comp);
}
