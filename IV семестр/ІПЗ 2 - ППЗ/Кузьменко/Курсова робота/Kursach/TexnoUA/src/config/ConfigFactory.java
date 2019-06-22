package config;

import config.reader.Reader;
import config.reader.XMLReader;
import config.writer.Writer;
import config.writer.XMLWriter;

/**
 * ������� ������� �� �������. ����� ������� ���������� ���������
 * ������������ ������� getConfiguration()
 * 
 * 
 */
public class ConfigFactory {
	/**
	 * ������� ��� ������ ����� ������������
	 */
	private static String prefix = new String("");
	/**
	 * @author Vova ������ ������������ �� ������������
	 */
	private static String defltAddress = "xml/" + prefix + "config.xml";

	/**
	 * ������� ����������� ���� ������������
	 * @return ����������� ����
	 */
	public static AppConfig getGonfiguration() {
		return new AppConfig();
	}

	/**
	 * ��������� ������ �����
	 * 
	 * @return ����
	 */
	public static Reader createReader() {
		return new XMLReader(defltAddress);
	}

	/**
	 * ��������� ����� �������
	 * @return ������
	 */
	public static Writer createWriter() {
		return new XMLWriter(defltAddress);
	}

	/**
	 * ������������ ������ ��������
	 * @param prefix
	 *            ����� �������
	 */
	public void setPrefix(String prefix) {
		defltAddress = new String("xml/" + prefix + "config.xml");
		ConfigFactory.prefix = prefix;
	}
	public String getPrefix(){
		return ConfigFactory.prefix;
	}

	/**
	 *  ��������� �������� ��������
	 */

	public void removePrefix() {
		prefix = new String("");
		defltAddress = new String("xml/" + prefix + "config.xml");
	}

}
