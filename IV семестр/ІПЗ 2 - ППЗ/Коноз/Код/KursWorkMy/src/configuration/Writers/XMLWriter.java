package configuration.Writers;

import java.io.*;
import java.util.Properties;

import configuration.CompositeStructure.CompositeComponent;

/**
 * Клас являє собою реалізацію інтерфейсу {@link Writer} для запису о
 * б'єктів конфігурації в xml-файли. Клас для запису в xml-файли
 *  використовує стандартний метод класу {@link Properties}
 *  @author Коноз Андрій 
 */
public class XMLWriter implements Writer {

	/* (non-Javadoc)
	 * @see configuration.Writers.Writer#write(configuration.CompositeStructure.CompositeComponent)
	 */
	@Override
	public void write(CompositeComponent comp) {
		try{
			File fw = new File(comp.getPath());
			FileOutputStream foutst = new FileOutputStream(fw); 
			comp.storeToXML(foutst, null);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	

}
