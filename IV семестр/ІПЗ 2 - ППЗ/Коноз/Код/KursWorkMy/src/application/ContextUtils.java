package application;

import java.beans.XMLDecoder;
import java.io.FileInputStream;
import java.util.Hashtable;

import configuration.CompositeStructure.AppConfiguration;
import configuration.CompositeStructure.CompositeComponent;

/**
 * Клас надає методи для роботи з різними мовами.
 * @author Коноз Андрій 
 */
public class ContextUtils {

	/**
	 * Метод завантажує назви елементів конкретного вікна.
	 * @param component назва вікна, для якого потрібно завантажити список
	 * @return таблицю з назвами компонентів
	 */
	public static Hashtable<String, String> loadContext(String component){
		Hashtable<String, String> result = null;
		CompositeComponent compprop = AppConfiguration.getAppConfiguration().getProperties("SelectedLanguage");
		String language =(String) compprop.get("language");
		String path = (String) AppConfiguration.getAppConfiguration().getProperties(language).get(component);
		try{
		FileInputStream fis = new FileInputStream(path);
		XMLDecoder d = new XMLDecoder(fis);
		result =(Hashtable<String, String>) d.readObject();
		d.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

}
