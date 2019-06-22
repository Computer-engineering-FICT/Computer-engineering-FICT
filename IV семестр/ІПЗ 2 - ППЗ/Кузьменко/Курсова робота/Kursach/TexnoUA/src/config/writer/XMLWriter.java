package config.writer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Properties;
import config.Configuration;
/**
 * Клас-записувач. Записує конфігурацію в XML файл
 * @author Vova
 *
 */
public class XMLWriter implements Writer {
	/**
	 * обєкт, що записується у XML файл
	 */
	private Configuration config;
	/**
	 * адреса XML файла для запису
	 */
	private String sourse = "xml/config.xml";
	/**
	 * конструктор класу. 
	 * @param sourse встановлює адресу файлу запису замість тієї, що викоритсовується по замовчуванню.
	 */
	public XMLWriter(String sourse) {
		this.sourse = sourse;
	}
	/**
	 * метод записує коннфігурацію
	 * @param configuration обєкт конфігурації для запису у XML файл
	 */
	@Override
	public void save(Configuration configuration) {
		try {
			this.config = configuration;
			Properties prop = config.getProperties();
			OutputStream os = new FileOutputStream(new File(sourse));
			prop.storeToXML(os, null, "UTF-8");
			os.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
