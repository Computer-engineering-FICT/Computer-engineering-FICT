package config;

import config.reader.Reader;
import config.reader.XMLReader;
import config.writer.Writer;
import config.writer.XMLWriter;

/**
 * Фабрика рідерерів та райтерів. також повертає композитну структуру
 * конфігурації методом getConfiguration()
 * 
 * 
 */
public class ConfigFactory {
	/**
	 * префікс для нового файлу конфігурації
	 */
	private static String prefix = new String("");
	/**
	 * @author Vova адреса конфігурації по замовчуванню
	 */
	private static String defltAddress = "xml/" + prefix + "config.xml";

	/**
	 * повертає композитний обєкт конфігурації
	 * @return композитний обєкт
	 */
	public static AppConfig getGonfiguration() {
		return new AppConfig();
	}

	/**
	 * створення нового рідера
	 * 
	 * @return рідер
	 */
	public static Reader createReader() {
		return new XMLReader(defltAddress);
	}

	/**
	 * створення новго райтера
	 * @return райтер
	 */
	public static Writer createWriter() {
		return new XMLWriter(defltAddress);
	}

	/**
	 * встановлення нового префікса
	 * @param prefix
	 *            новий префікс
	 */
	public void setPrefix(String prefix) {
		defltAddress = new String("xml/" + prefix + "config.xml");
		ConfigFactory.prefix = prefix;
	}
	public String getPrefix(){
		return ConfigFactory.prefix;
	}

	/**
	 *  видалення текущого префікса
	 */

	public void removePrefix() {
		prefix = new String("");
		defltAddress = new String("xml/" + prefix + "config.xml");
	}

}
