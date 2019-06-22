package controller.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * �������� ������ ���������� ��� ��������.
 * @author ����� ����� 
 */
@Retention (value = RetentionPolicy.RUNTIME)
@Target (value = ElementType.TYPE)

public @interface PARAMETER{
	/**
	 * @return �����.
	 */
	public String key ();
	/**
	 * @return ���.
	 */
	public Class<?> type() default Object.class;
	/**
	 * @return �������������.
	 */
	public boolean optional() default false;	
}
