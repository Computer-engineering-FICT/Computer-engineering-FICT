package config;

import java.util.Properties;

/**
 * клас що що містить у собі усі конфігурації. Представляє собою композитну
 * структуру
 * 
 * @author Vova
 * 
 */
@SuppressWarnings("serial")
public class AppConfig extends Properties {
	/*
	 * @author Vova Поле для збереження вкладеної рекурсивної конфігурації По
	 * замовчуванню Null
	 */
	private AppConfig appProperties = null;
	/**
	 * Фабрика, що повертає конфігурацію клієнту
	 */
	private ConfigFactory factory = new ConfigFactory();
	/**
	 * 
	 * Текуща конфігурація
	 */
	private Configuration configuration = new Configuration();

	/**
	 * конструктор класу
	 * 
	 * @return this повертає обєкт цього класу
	 */
	public AppConfig getInstance() {
		return this;
	}

	/**
	 * метод повертає значення по ключу
	 * 
	 * @param key
	 *            ключ
	 * @return значення по ключу
	 */
	@Override
	public String getProperty(String key) {
		configuration = ConfigFactory.createReader().load();
		return configuration.getProperty(key);
	}

	/**
	 * конструктор по замовчуванню
	 */
	public AppConfig() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * Метод для встановлення значення
	 * 
	 * @param key
	 *            ключ
	 * @param value
	 *            значення
	 */
	@Override
	public synchronized Object setProperty(String key, String value) {
		configuration.setProperty(key, value);
		ConfigFactory.createWriter().save(configuration);
		return null;
	}

	/**
	 * 
	 * метод додає до композитної струкрури новий елемент.
	 */
	public void SetAppConfig() {
		appProperties = new AppConfig();
	}

	/**
	 * повертає композитний елемент
	 * 
	 * @return appProperties елемент
	 */
	public AppConfig getAppConfig() {
		return appProperties;
	}

	/**
	 * метод встановлює префікс. Префікс призначений для того щоб створити новий
	 * файл конфігурації.
	 * 
	 * @param prefix
	 *            - префікс для нового файла конфігурації
	 */
	public void setPrefix(String prefix) {
		factory.setPrefix(prefix + ".");
	}

	/**
	 * метод видаляє префікс
	 */
	public void removePrefix() {
		factory.removePrefix();
	}

	/**
	 * метод повертає префікс
	 * @return  префікс
	 */
	public String getPrefix() {
		return factory.getPrefix();
	}

}
