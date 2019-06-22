package configuration.Loaders;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Properties;

import configuration.CompositeStructure.CompositeComponent;
import configuration.CompositeStructure.LeafProperty;

/**
 * Клас е реалізацією інтерфейса {@link Loader} для роботи з
 * xml-файлами. Для завантаження об'єкту зз файлу використовує
 * стандартні засоби класу {@link Properties}
 * @author Коноз Андрій.
 * 
 *
 */
public class XMLLoader implements Loader{

	/* (non-Javadoc)
	 * @see configuration.Loaders.Loader#load(java.lang.String)
	 */
	@Override
	public CompositeComponent load(String savePath) {
		CompositeComponent result = null;
		Properties local = new Properties();
		try{
			local.loadFromXML(new FileInputStream(new File(savePath)));
		}catch(Exception e){
			e.printStackTrace();
		}
		result = new LeafProperty();
		for(Object key : local.keySet()){
			result.put(key,  local.getProperty((String) key));
		}
		
		return result;
	}

	

}
