package dao.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


/**
 * 
 * Анотація, якою позначають поле, яке містить основний ключ.
 * @author Коноз Андрій
 * 
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(value=ElementType.FIELD)

public @interface Primary {
}
