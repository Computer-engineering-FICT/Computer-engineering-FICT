package dao.annotation.utils.converter;

import dao.annotation.utils.ValueConverter;
/**
 *конвертер для булевського типу
 * @author Vova
 *
 */
public class BooleanConverter implements ValueConverter {
/**
 * метод що перетворює значення value у строку
 * @param value значення що перетворюється
 * @param <T> тип значення
 */
	@Override
	public <T> String toString(T value) {
		if (value == null)
			return "null";
		if ((Boolean)value){
			return Integer.toString(1);
		}else
			return Integer.toString(0);
	}
/**
 * метод, що перетворює строку у значення типу T
 * @param str строка для перетворення
 * @param <T> тип у який теобхідно перетворити строку
 */
	@SuppressWarnings("unchecked")
	@Override
	public <T> T toValue(String str) {
		if (str.equals("null"))
			return null;
		int b = Integer.parseInt(str);
		if (b==0){
			return (T) new Boolean(false);
		}
		else return (T) new Boolean(true);
		
	}

}
