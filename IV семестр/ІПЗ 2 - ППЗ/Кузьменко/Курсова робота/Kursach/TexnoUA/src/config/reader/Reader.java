package config.reader;
import config.Configuration;
/**
 * ��������� ��� ���������� ������������
 * @author Vova
 *
 */
public interface Reader {
	/**
	 * ����-��������������� ������������ ����� load() ��� ���������� ������������
	 * @return ���� ������������
	 */
	public Configuration load();
}
