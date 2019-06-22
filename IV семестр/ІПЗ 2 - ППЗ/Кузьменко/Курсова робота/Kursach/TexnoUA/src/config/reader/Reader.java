package config.reader;
import config.Configuration;
/**
 * Інтерфейс для зчитувачів конфігурацій
 * @author Vova
 *
 */
public interface Reader {
	/**
	 * Клас-зчитувачповинен реалізовувати метод load() для зчитування конфігурації
	 * @return обєкт конфігурації
	 */
	public Configuration load();
}
