package controller.annotations;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Аннотація, яка зберігає ім'я команди.
 * @author Коноз Андрій 
 */
@Retention (value = RetentionPolicy.RUNTIME)
@Target (value = ElementType.TYPE)

public @interface COMMAND {
	/**
	 * @return ім'я команди.
	 */
	public String key();
}
