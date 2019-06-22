package dao.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import dao.annotation.converter.StringConverter;


/**
 *
 * ��������, ���� ������������ ����, ��������� ��� ������ � ���� �����.
 * @author ����� �����
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface Stored {
	/**
	 * @return ����� ������ �������.
	 */
	public String name();
	/**
	 * @return ���������, ���� ������� ������������ �������� ����.
	 */
	public Class converter() default StringConverter.class;
}
