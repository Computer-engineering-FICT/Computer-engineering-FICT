package app.view;

import config.AppConfig;

/**
 * клас-одиночка, відповідає за доступ до текущої мови графічного інтерфейсу
 * @author Vova
 *
 */
public class Languages {

	/**
	 * конфігурація для текущої мови
	 */
	private static AppConfig config;
	/**
	 * метод повертає значення, тобто відповідний переклад, елемента по ключу
	 * @param key ключ
	 * @return переклад
	 */
	public static String getProperty(String key){
		if (config==null){
			AppConfig mainconfig = new AppConfig();
			mainconfig.SetAppConfig();
			config = mainconfig.getAppConfig();
			config.setPrefix("languagesUkrainian");
		}
		return config.getProperty(key);
	}
	/**
	 * метод встановлює нову текущу мову
	 * @param str префік файла конфгурації
	 */
	public static void setNewLanguage(String str){
		config.setPrefix(str);
		
	}
}
