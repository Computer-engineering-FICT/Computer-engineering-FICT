package config.writer;

import config.Configuration;
/**
 * ��������� ��� �������
 * @author Vova
 *
 */
public interface Writer {
	/**
	 * ����� ������ ������������
	 * @param configuration ������������ ��� ������
	 */
	public void save(Configuration configuration);
}
