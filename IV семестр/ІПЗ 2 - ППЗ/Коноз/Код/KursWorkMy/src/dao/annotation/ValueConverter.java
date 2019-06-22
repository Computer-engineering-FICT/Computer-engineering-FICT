package dao.annotation;

/**
 * 
 * Інтерфейс, який поинні реалізовувати конвертери типів.
 * @author Коноз Андрій
 */
public interface ValueConverter {
	/**
	 * Переводить отримане значення в {@link String}.
	 * @param value значення для переводу.
	 * @return повертає конвертоване значеня типу {@link String}
	 */
	public <T> String toString(T value);
	/**
	 * Переводить рядок типу {@link String} в значення типу,
	 * з яким працює конвертер.
	 * @param str рядок для конвертування.
	 * @return конвертоване значення типу, з яким працює конвертер.
	 */
	public <T> T toValue(String str);
}
