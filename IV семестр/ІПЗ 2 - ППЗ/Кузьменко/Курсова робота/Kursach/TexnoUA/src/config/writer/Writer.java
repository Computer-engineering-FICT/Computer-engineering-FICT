package config.writer;

import config.Configuration;
/**
 * інтерфейс для райтерів
 * @author Vova
 *
 */
public interface Writer {
	/**
	 * метод записує конфігурацію
	 * @param configuration сонфігурація для запису
	 */
	public void save(Configuration configuration);
}
