package laba_csv;

import java.text.ParseException;

/**
 * Сообщает об исключении в процессе распознавания CSV-файла.
 * 
 * @author Шаршаков Андрей
 */
public class CSVParseException extends ParseException {
	/**
	 * Автосгенерированный UID.
	 */
	private static final long	serialVersionUID	= -8854557416849992261L;

	/**
	 * Конструктор объекта исключения с сообщением об ошибке и смещением.
	 * 
	 * @param s
	 *            сообщение об ошибке
	 * @param errorOffset
	 *            позиция, в которой возникло исключение во время распознавания
	 */
	public CSVParseException(String s, int errorOffset) {
		super(s, errorOffset);
	}
}
