package dao.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import dao.annotation.converter.StringConverter;


/**
 *
 * Анотація, якою познначається поля, призначені для запису в базу даних.
 * @author Коноз Андрій
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface Stored {
	/**
	 * @return назва домена таблиці.
	 */
	public String name();
	/**
	 * @return конвертер, яким потрібно конвертувати значення поля.
	 */
	public Class converter() default StringConverter.class;
}
