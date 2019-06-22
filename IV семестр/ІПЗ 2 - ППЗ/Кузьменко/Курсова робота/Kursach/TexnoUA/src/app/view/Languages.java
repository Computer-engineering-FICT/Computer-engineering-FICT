package app.view;

import config.AppConfig;

/**
 * ����-��������, ������� �� ������ �� ������ ���� ���������� ����������
 * @author Vova
 *
 */
public class Languages {

	/**
	 * ������������ ��� ������ ����
	 */
	private static AppConfig config;
	/**
	 * ����� ������� ��������, ����� ��������� ��������, �������� �� �����
	 * @param key ����
	 * @return ��������
	 */
	public static String getProperty(String key){
		if (config==null){
			AppConfig mainconfig = new AppConfig();
			mainconfig.SetAppConfig();
			config = mainconfig.getAppConfig();
			config.setPrefix("languagesUkrainian");
		}
		return config.getProperty(key);
	}
	/**
	 * ����� ���������� ���� ������ ����
	 * @param str ������ ����� �����������
	 */
	public static void setNewLanguage(String str){
		config.setPrefix(str);
		
	}
}
