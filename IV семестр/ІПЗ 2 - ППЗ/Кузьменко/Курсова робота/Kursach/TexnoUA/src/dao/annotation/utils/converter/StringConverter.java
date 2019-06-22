package dao.annotation.utils.converter;

import dao.annotation.utils.ValueConverter;
/**
 * ��������� ���������
 *
 */
public class StringConverter implements ValueConverter {
	/**
	 * ������������ �������� value � ������ � ���� T
	 * @param value ��������� ��� ������������
	 * @return �������� �������� � ���� T
	 */
	@Override
	public <T> String toString(T value) {
		if(value == null) return null;
		return "\""+((Object)value).toString()+"\"";
	}

	/**
	 * ������������ �� ���������� �������� � �������� T
	 * @param str ������ �� ������������ � �������� ���� T
	 * @return �������� ���� �
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <T> T toValue(String str) {
		if (str==null) return null;
		if(str.equals("null")) return null;
		if(str.equals("\"\"")) return (T) "";
		if(str.equals("")) return (T) "";
		return (T)str;
	}
}
