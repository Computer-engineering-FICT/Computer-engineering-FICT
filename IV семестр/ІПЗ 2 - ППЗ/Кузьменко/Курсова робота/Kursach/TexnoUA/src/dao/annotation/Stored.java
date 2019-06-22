package dao.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

import dao.annotation.utils.converter.*;

/**
 * анотація для зчитування мета-даних з моделі
 * @author Vova
 *
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface Stored {
	/**
	 * ім*я
	 * @return значення
	 */
	public String name();
	/**
	 * конвертер для даного елемента, по замовчуванню StringConverter.class
	 * @return клас конвертора
	 */
	@SuppressWarnings("rawtypes")
	public Class converter() default StringConverter.class;
}
