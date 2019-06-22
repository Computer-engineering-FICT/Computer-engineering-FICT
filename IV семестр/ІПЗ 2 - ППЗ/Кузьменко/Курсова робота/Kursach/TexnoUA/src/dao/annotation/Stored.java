package dao.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

import dao.annotation.utils.converter.*;

/**
 * �������� ��� ���������� ����-����� � �����
 * @author Vova
 *
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface Stored {
	/**
	 * ��*�
	 * @return ��������
	 */
	public String name();
	/**
	 * ��������� ��� ������ ��������, �� ������������ StringConverter.class
	 * @return ���� ����������
	 */
	@SuppressWarnings("rawtypes")
	public Class converter() default StringConverter.class;
}
