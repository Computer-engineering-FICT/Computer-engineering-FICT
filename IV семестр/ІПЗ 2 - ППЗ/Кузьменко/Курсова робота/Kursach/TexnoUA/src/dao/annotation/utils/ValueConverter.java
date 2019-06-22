package dao.annotation.utils;
/**
 * ��������� ��� ���������� ����
 * @author Vova
 *
 */
public interface ValueConverter {
	/**
	 * ����������� � �������� ���� � � ������
	 * @param value �������� �� �������������
	 * @return ������������� ��'���
	 */
	public <T> String toString(T value);
	/**
	 * ��������� �� ������ � �������� ���� �
	 * @param str ������ � ��� ������������
	 * @return ��������
	 */
	public <T> T toValue(String str);
}
