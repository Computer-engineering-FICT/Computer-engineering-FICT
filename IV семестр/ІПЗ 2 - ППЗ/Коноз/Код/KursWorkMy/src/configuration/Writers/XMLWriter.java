package configuration.Writers;

import java.io.*;
import java.util.Properties;

import configuration.CompositeStructure.CompositeComponent;

/**
 * ���� ����� ����� ��������� ���������� {@link Writer} ��� ������ �
 * �'���� ������������ � xml-�����. ���� ��� ������ � xml-�����
 *  ����������� ����������� ����� ����� {@link Properties}
 *  @author ����� ����� 
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
