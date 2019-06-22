package configuration.Loaders;

import configuration.CompositeStructure.CompositeComponent;

/**
 * Інтерфейс повинні реалізовувати всі класи, які будуть займатися
 * реалізацією зчитування конфігурації з файла.
 * @author Коноз Андрій.
 *
 */
public interface Loader {
	/**
	 * Метод виконує зчитування файла за адресою, яка передається методу
	 * під час його виклику.
	 * @param savePath повна адреса, за якою знаходиться файл для зчитування
	 * @return повертає об'ект типу {@link CompositeComponent}
	 */
	public CompositeComponent load(String savePath);
}
