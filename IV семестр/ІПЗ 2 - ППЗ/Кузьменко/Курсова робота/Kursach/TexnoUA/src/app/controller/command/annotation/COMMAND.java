package app.controller.command.annotation;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/**
 * Анотація для команди
 *
 */
@Retention (value = RetentionPolicy.RUNTIME)
@Target(value = ElementType.TYPE)

public @interface COMMAND {
	/**
	 * поле зберігає ключ команди
	 * @return ключ команди 
	 */
	public String key();
}
