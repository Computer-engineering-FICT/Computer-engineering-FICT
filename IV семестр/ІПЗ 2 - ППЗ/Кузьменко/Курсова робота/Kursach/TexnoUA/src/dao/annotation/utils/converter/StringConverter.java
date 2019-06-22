package dao.annotation.utils.converter;

import dao.annotation.utils.ValueConverter;
/**
 * Строковий конвертор
 *
 */
public class StringConverter implements ValueConverter {
	/**
	 * перетворення значення value у строку з типу T
	 * @param value знгачення для перетворення
	 * @return строкове значення з типу T
	 */
	@Override
	public <T> String toString(T value) {
		if(value == null) return null;
		return "\""+((Object)value).toString()+"\"";
	}

	/**
	 * перетворення із строкового значення в значення T
	 * @param str строка що перетворюємо у значення типу T
	 * @return значення типу Т
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <T> T toValue(String str) {
		if (str==null) return null;
		if(str.equals("null")) return null;
		if(str.equals("\"\"")) return (T) "";
		if(str.equals("")) return (T) "";
		return (T)str;
	}
}
