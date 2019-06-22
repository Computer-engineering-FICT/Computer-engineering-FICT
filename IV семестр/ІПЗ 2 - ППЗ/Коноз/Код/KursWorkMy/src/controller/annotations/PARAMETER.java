package controller.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Анотація зберігає інформацію про параметр.
 * @author Коноз Андрій 
 */
@Retention (value = RetentionPolicy.RUNTIME)
@Target (value = ElementType.TYPE)

public @interface PARAMETER{
	/**
	 * @return назва.
	 */
	public String key ();
	/**
	 * @return тип.
	 */
	public Class<?> type() default Object.class;
	/**
	 * @return опціональність.
	 */
	public boolean optional() default false;	
}
