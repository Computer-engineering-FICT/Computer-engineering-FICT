package config;
import java.util.Properties;
/**
 * ���� ������������. ��������������� ��� ������ � ������� ������������ �
 * �������
 * 
 */
@SuppressWarnings("serial")
public class Configuration extends Properties {
	/**
	 * ������ ������������
	 */
	private Properties property = new Properties();
	/**
	 * �����������. ���������� ��� ��������� ��� ������ � ���
	 * @param properties
	 *            ��� ���������
	 */
	public Configuration(Properties properties) {
		this.property = properties;
	}

	/**
	 * ������ �����������
	 */
	public Configuration() {

	}

	/**
	 * ������� ������ ��������� �� ������� ������
	 * @param key ����
	 */
	@Override
	public String getProperty(String key) {
		return property.getProperty(key);
	}

	/**
	 * ���������� ��� ���������
	 * @param key ����
	 * @param value ��������
	 */
	@Override
	public synchronized Object setProperty(String key, String value) {
		property.setProperty(key, value);
		return null;
	}

	/**
	 * ������� �� ������ ���������
	 * @return gffhvtnhb
	 */
	public Properties getProperties() {
		return property;
	}

}
