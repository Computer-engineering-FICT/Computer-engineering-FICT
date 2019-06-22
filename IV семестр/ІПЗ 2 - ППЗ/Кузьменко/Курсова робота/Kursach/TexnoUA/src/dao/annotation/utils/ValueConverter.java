package dao.annotation.utils;
/**
 * інтерфейс для конвертерів типів
 * @author Vova
 *
 */
public interface ValueConverter {
	/**
	 * переведення зі значення типу Т у строку
	 * @param value значення що конвертуэться
	 * @return конвертований об'єкт
	 */
	public <T> String toString(T value);
	/**
	 * конвертер із строки в значення типу Т
	 * @param str строка з якої конвертувати
	 * @return значення
	 */
	public <T> T toValue(String str);
}
