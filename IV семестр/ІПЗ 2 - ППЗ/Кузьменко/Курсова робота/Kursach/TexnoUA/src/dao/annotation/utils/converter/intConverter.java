package dao.annotation.utils.converter;

import dao.annotation.utils.ValueConverter;

/**
 * конвертер для типів з якими оперує модель даних у програмі
 * 
 * @author Vova
 * 
 */
public class intConverter implements ValueConverter {
	/**
	 * метод перетворює ціле значення у об'єкт Класу String
	 * 
	 * @param value
	 *            що перетворюємо у String
	 * @return строкове представлення value
	 */
	@Override
	public <T> String toString(T value) {
		if (value == null)
			return "null";
		return Integer.toString((Integer) value);
	}

	/**
 метод повертає значення типу Т що задани об'єктом типу String
	 * @param str
	 *            строка з якої беремо значнення
	 * @return Integer представлення строки str
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <T> T toValue(String str) {
		if (str.equals("null"))
			return null;
		return (T) new Integer(Integer.parseInt(str));
	}
}
