package csv;

import java.text.ParseException;

/**
 * Сповіщає про виключення в процесі розпізнавання CSV-файлу.
 * 
 * @author Сидора Сергій
 */
public class CSVParseException extends ParseException {
	/**
	 * Автозгенерований UID.
	 */
	private static final long	serialVersionUID	= -8854557416849992261L;

	/**
	 * Конструктор об'єкту виключення із повідомленням про помилку і зміщенням.
	 * 
	 * @param s
	 *            повідомлення про помилку
	 * @param errorOffset
	 *            позиція, в котрій виникло виключення під час розпізнавання
	 */
	public CSVParseException(String s, int errorOffset) {
		super(s, errorOffset);
	}
}

