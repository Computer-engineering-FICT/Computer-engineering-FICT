package config.reader;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import config.Configuration;
/**
 * Клас для зчитування конфігурацій з XML файла
 * @author Vova
 *
 */
public class XMLReader implements Reader{
	/**
	 * адреса файла конфігурацій по замовчуванню
	 */
	private String sourse = "xml/config";
	/**
	 * конструктор класу. встановлює адресу XML-файла
	 * @param sourse адреса XML файла
	 */
	public XMLReader (String sourse){
		this.sourse = sourse;
	}
	/**
	 * пустий конструктор. Буде використовуватись адреса за замовчуванням.
	 */
	public XMLReader(){
		
	}
	/**
	 * метод завантажує файл конфігурації
	 * @return об'єкт конфігурації
	 */
	@Override
	public Configuration load() {
		try {
			InputStream is = new FileInputStream(new File (sourse));
			Properties prop = new Properties();
			prop.loadFromXML(is);
			Configuration con= new Configuration(prop);
			return con;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

}
