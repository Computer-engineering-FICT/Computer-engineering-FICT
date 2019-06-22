package dao.annotation;

/**
 * 
 * ���������, ���� ����� ������������ ���������� ����.
 * @author ����� �����
 */
public interface ValueConverter {
	/**
	 * ���������� �������� �������� � {@link String}.
	 * @param value �������� ��� ��������.
	 * @return ������� ������������ ������� ���� {@link String}
	 */
	public <T> String toString(T value);
	/**
	 * ���������� ����� ���� {@link String} � �������� ����,
	 * � ���� ������ ���������.
	 * @param str ����� ��� �������������.
	 * @return ������������ �������� ����, � ���� ������ ���������.
	 */
	public <T> T toValue(String str);
}
