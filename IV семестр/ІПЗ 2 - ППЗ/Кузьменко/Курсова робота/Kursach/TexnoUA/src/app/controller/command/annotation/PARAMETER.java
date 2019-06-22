package app.controller.command.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/**
 * анотація для кожного параметру команди
 *
 */
@Retention (value = RetentionPolicy.RUNTIME)
@Target(value = ElementType.TYPE)

public @interface PARAMETER{
	/**
	 * ключ параметру
	 * @return значення ключа
	 */
	public String key ();
	/**
	 * тип ключа параметру. По замовчуванню Object.class
	 * @return тип ключа 
	 */
	public Class<?> type() default Object.class;
	/**
	 * реалізований опціонал. По замовчуванню false
	 * @return існування реалізації
	 */
	public boolean optional() default false;	
}
