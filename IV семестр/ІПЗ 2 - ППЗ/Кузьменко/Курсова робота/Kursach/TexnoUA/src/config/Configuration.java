package config;
import java.util.Properties;
/**
 * клас конфігурації. використовується для роботи з обєктами конфігурації у
 * програмі
 * 
 */
@SuppressWarnings("serial")
public class Configuration extends Properties {
	/**
	 * текуща конфігурація
	 */
	private Properties property = new Properties();
	/**
	 * конструктор. встановлює нові параметри для роботи з нею
	 * @param properties
	 *            нові параметри
	 */
	public Configuration(Properties properties) {
		this.property = properties;
	}

	/**
	 * пустий конструктор
	 */
	public Configuration() {

	}

	/**
	 * повертає текущі параметри за заданим ключом
	 * @param key ключ
	 */
	@Override
	public String getProperty(String key) {
		return property.getProperty(key);
	}

	/**
	 * встановлює нові параметри
	 * @param key ключ
	 * @param value значення
	 */
	@Override
	public synchronized Object setProperty(String key, String value) {
		property.setProperty(key, value);
		return null;
	}

	/**
	 * повертає всі текущі параметри
	 * @return gffhvtnhb
	 */
	public Properties getProperties() {
		return property;
	}

}
