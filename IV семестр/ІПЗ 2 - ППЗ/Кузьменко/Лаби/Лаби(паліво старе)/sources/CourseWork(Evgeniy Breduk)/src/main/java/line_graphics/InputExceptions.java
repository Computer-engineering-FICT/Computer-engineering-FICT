package line_graphics;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.swing.filechooser.FileFilter;
import javax.swing.table.AbstractTableModel;

/**
 * Класс исключения используемого при вводе неверного формата данных
 * @author Бредюк Егений Владимирович
 * ИО - 73
 * septemberfalltirael@yahoo.com
 *
 */
class InputException extends Exception {
	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = 165161654651L;

	/**
	 * @return выводит сообщение об ошибке
	 */
	public final String getMessage() {
		return "!!!Format of enterred Data i not available!!!";
	}
}

/**
 * Класс фильтра файлов
 * @author Бредюк Егений Владимирович
 * ИО - 73
 * septemberfalltirael@yahoo.com
 */
class ExtensionFileFilter extends FileFilter {
	/**
	 * Добавляет новое разрешение
	 * в список доступных разшерений.
	 * 
	 * @param extension
	 *            - расшерение
	 */
	public void addExtension(String extension) {
		if (!extension.startsWith("."))
			extension = "." + extension;
		extensions.add(extension.toLowerCase());
	}

	/**
	 * Устанавливает описание типов файлов
	 * 
	 * @param aDescription
	 *            - описание
	 */
	public void setDescription(String aDescription) {
		description = aDescription;
	}

	/**
	 * Возвращает описание для текущего типа файлов.
	 * @see javax.swing.filechooser.FileFilter#getDescription()
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * Описание.
	 */
	private String description = " ";

	/**
	 * Массив расширений.
	 */
	private ArrayList<String> extensions = new ArrayList<String>();

	/** 
	 * Переопределяет метод, ответветственный за приемку
	 * файла
	 * @see javax.swing.filechooser.FileFilter#accept(java.io.File)
	 */
	public boolean accept(File f) {
		if (f.isDirectory())
			return true;
		String name = f.getName().toLowerCase();
		for (int i = 0; i < extensions.size(); i++)
			if (name.endsWith((String) extensions.get(i)))
				return true;
		return false;
	}
}
