package app.controller.command.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/**
 * Контекст команди, складається з параметрів
 * @author Vova
 *
 */
@Retention(value = RetentionPolicy.RUNTIME)
@Target(value = ElementType.TYPE)

public @interface CONTEXT {
	/**
	 * поле містить у собі список параметрів
	 * @return список параметрів
	 */
	PARAMETER[] list();
}
