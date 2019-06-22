package app.controller.command.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/**
 * �������� �������, ���������� � ���������
 * @author Vova
 *
 */
@Retention(value = RetentionPolicy.RUNTIME)
@Target(value = ElementType.TYPE)

public @interface CONTEXT {
	/**
	 * ���� ������ � ��� ������ ���������
	 * @return ������ ���������
	 */
	PARAMETER[] list();
}
