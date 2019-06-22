package dao.annotation.utils.converter;

import dao.annotation.utils.ValueConverter;

/**
 * ��������� ��� ���� � ����� ����� ������ ����� � �������
 * 
 * @author Vova
 * 
 */
public class intConverter implements ValueConverter {
	/**
	 * ����� ���������� ���� �������� � ��'��� ����� String
	 * 
	 * @param value
	 *            �� ������������ � String
	 * @return �������� ������������� value
	 */
	@Override
	public <T> String toString(T value) {
		if (value == null)
			return "null";
		return Integer.toString((Integer) value);
	}

	/**
 ����� ������� �������� ���� � �� ������ ��'����� ���� String
	 * @param str
	 *            ������ � ��� ������ ���������
	 * @return Integer ������������� ������ str
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <T> T toValue(String str) {
		if (str.equals("null"))
			return null;
		return (T) new Integer(Integer.parseInt(str));
	}
}
