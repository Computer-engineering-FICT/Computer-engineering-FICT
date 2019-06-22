package dao;

import java.util.List;

import config.AppConfig;
/**
 * інтерфейс для класів, що будуть на пряму працювати з базою даних
 * @author Vova
 *
 */
public interface CRUDInterface {
	/**
	 * метод що відкриває з*єдання
	 * @throws Exception
	 */
	public void close() throws Exception;
	
/**
 * метод що записує інформацію в базу даних
 * @param instance значення які треба записати
 * @return Null
 * @throws Exception
 */
	public <T> T insert(T instance) throws Exception;
/**
 * метод що зчитує інформацію з бази даних
 * @param entityClass клас що представляє інформацію у моделі програми яку ми будемо зчитувати з бази даних
 * @param id ключ по якому буде робитись пошук
 * @return значення типу моделі з якою буде працювати програма
 * @throws Exception
 */
	public <T> T read(@SuppressWarnings("rawtypes") Class entityClass, int id) throws Exception;
/**
 * метод що виконує команду оновлення даних
 * @param instance дані для оновлення
 * @throws Exception
 */
	public <T> void update(T instance) throws Exception;
/**
 * метод що видаляє дані з бази даних
 * @param instance дані що треба видалити
 * @throws Exception
 */
	public <T> void delete(T instance) throws Exception;
/**
 * метод що вибирає всі дані із заданого типу моделі
 * @param entityClass клас - тип моделі
 * @return список значень моделі
 * @throws Exception
 */
	public <T> List<T> select(@SuppressWarnings("rawtypes") Class entityClass) throws Exception;

	public <T> List<T> select(String SQLString) throws Exception;
/**
 * метод що встановлює з'вязок з базою даних
 * @param config конфігурація для встановлення звязку з базою даних
 * @throws Exception
 */
	void open(AppConfig config) throws Exception;

}
