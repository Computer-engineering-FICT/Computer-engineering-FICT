package config.writer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Properties;
import config.Configuration;
/**
 * ����-���������. ������ ������������ � XML ����
 * @author Vova
 *
 */
public class XMLWriter implements Writer {
	/**
	 * ����, �� ���������� � XML ����
	 */
	private Configuration config;
	/**
	 * ������ XML ����� ��� ������
	 */
	private String sourse = "xml/config.xml";
	/**
	 * ����������� �����. 
	 * @param sourse ���������� ������ ����� ������ ������ 򳺿, �� ��������������� �� ������������.
	 */
	public XMLWriter(String sourse) {
		this.sourse = sourse;
	}
	/**
	 * ����� ������ �������������
	 * @param configuration ���� ������������ ��� ������ � XML ����
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
