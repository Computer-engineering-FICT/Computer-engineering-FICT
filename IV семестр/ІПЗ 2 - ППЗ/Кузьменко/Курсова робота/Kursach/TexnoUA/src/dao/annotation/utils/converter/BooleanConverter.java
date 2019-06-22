package dao.annotation.utils.converter;

import dao.annotation.utils.ValueConverter;
/**
 *��������� ��� ����������� ����
 * @author Vova
 *
 */
public class BooleanConverter implements ValueConverter {
/**
 * ����� �� ���������� �������� value � ������
 * @param value �������� �� ��������������
 * @param <T> ��� ��������
 */
	@Override
	public <T> String toString(T value) {
		if (value == null)
			return "null";
		if ((Boolean)value){
			return Integer.toString(1);
		}else
			return Integer.toString(0);
	}
/**
 * �����, �� ���������� ������ � �������� ���� T
 * @param str ������ ��� ������������
 * @param <T> ��� � ���� ��������� ����������� ������
 */
	@SuppressWarnings("unchecked")
	@Override
	public <T> T toValue(String str) {
		if (str.equals("null"))
			return null;
		int b = Integer.parseInt(str);
		if (b==0){
			return (T) new Boolean(false);
		}
		else return (T) new Boolean(true);
		
	}

}
