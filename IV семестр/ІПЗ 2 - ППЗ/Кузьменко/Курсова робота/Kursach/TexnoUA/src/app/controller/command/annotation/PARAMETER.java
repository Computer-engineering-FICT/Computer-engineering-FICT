package app.controller.command.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/**
 * �������� ��� ������� ��������� �������
 *
 */
@Retention (value = RetentionPolicy.RUNTIME)
@Target(value = ElementType.TYPE)

public @interface PARAMETER{
	/**
	 * ���� ���������
	 * @return �������� �����
	 */
	public String key ();
	/**
	 * ��� ����� ���������. �� ������������ Object.class
	 * @return ��� ����� 
	 */
	public Class<?> type() default Object.class;
	/**
	 * ����������� ��������. �� ������������ false
	 * @return ��������� ���������
	 */
	public boolean optional() default false;	
}
