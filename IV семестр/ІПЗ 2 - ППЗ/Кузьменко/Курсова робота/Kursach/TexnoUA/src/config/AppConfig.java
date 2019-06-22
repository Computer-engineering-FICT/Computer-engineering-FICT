package config;

import java.util.Properties;

/**
 * ���� �� �� ������ � ��� �� ������������. ����������� ����� ����������
 * ���������
 * 
 * @author Vova
 * 
 */
@SuppressWarnings("serial")
public class AppConfig extends Properties {
	/*
	 * @author Vova ���� ��� ���������� �������� ���������� ������������ ��
	 * ������������ Null
	 */
	private AppConfig appProperties = null;
	/**
	 * �������, �� ������� ������������ �볺���
	 */
	private ConfigFactory factory = new ConfigFactory();
	/**
	 * 
	 * ������ ������������
	 */
	private Configuration configuration = new Configuration();

	/**
	 * ����������� �����
	 * 
	 * @return this ������� ���� ����� �����
	 */
	public AppConfig getInstance() {
		return this;
	}

	/**
	 * ����� ������� �������� �� �����
	 * 
	 * @param key
	 *            ����
	 * @return �������� �� �����
	 */
	@Override
	public String getProperty(String key) {
		configuration = ConfigFactory.createReader().load();
		return configuration.getProperty(key);
	}

	/**
	 * ����������� �� ������������
	 */
	public AppConfig() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * ����� ��� ������������ ��������
	 * 
	 * @param key
	 *            ����
	 * @param value
	 *            ��������
	 */
	@Override
	public synchronized Object setProperty(String key, String value) {
		configuration.setProperty(key, value);
		ConfigFactory.createWriter().save(configuration);
		return null;
	}

	/**
	 * 
	 * ����� ���� �� ���������� ��������� ����� �������.
	 */
	public void SetAppConfig() {
		appProperties = new AppConfig();
	}

	/**
	 * ������� ����������� �������
	 * 
	 * @return appProperties �������
	 */
	public AppConfig getAppConfig() {
		return appProperties;
	}

	/**
	 * ����� ���������� �������. ������� ����������� ��� ���� ��� �������� �����
	 * ���� ������������.
	 * 
	 * @param prefix
	 *            - ������� ��� ������ ����� ������������
	 */
	public void setPrefix(String prefix) {
		factory.setPrefix(prefix + ".");
	}

	/**
	 * ����� ������� �������
	 */
	public void removePrefix() {
		factory.removePrefix();
	}

	/**
	 * ����� ������� �������
	 * @return  �������
	 */
	public String getPrefix() {
		return factory.getPrefix();
	}

}
