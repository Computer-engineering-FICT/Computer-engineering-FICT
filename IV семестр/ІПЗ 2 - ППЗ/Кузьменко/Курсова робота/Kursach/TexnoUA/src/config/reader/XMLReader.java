package config.reader;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import config.Configuration;
/**
 * ���� ��� ���������� ������������ � XML �����
 * @author Vova
 *
 */
public class XMLReader implements Reader{
	/**
	 * ������ ����� ������������ �� ������������
	 */
	private String sourse = "xml/config";
	/**
	 * ����������� �����. ���������� ������ XML-�����
	 * @param sourse ������ XML �����
	 */
	public XMLReader (String sourse){
		this.sourse = sourse;
	}
	/**
	 * ������ �����������. ���� ����������������� ������ �� �������������.
	 */
	public XMLReader(){
		
	}
	/**
	 * ����� ��������� ���� ������������
	 * @return ��'��� ������������
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
