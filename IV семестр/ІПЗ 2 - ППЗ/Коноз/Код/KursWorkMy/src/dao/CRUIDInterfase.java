package dao;

import java.util.*;

import configuration.CompositeStructure.AppConfiguration;
import dao.exception.*;

/**
 * Інтерфейс представляє функціонал DAO для роботи з моделлю.
 * @author Коноз Андрій
 */
public interface CRUIDInterfase {
	/**
	 * Метод налаштовує з'єднання з базою даних за допомогою параметрів які
	 * зберігається в конфігураційному файлі програми.
	 * 
	 * @param configuration конфігураційний файл програми.
	 * @throws DAOException
	 */
	public void open(AppConfiguration configuration) throws DAOException;

	/**
	 * Метод який закриває встановлене з'єднання з базою даних.
	 * @throws DAOException
	 */
	public void close() throws DAOException;

	/**
	 * Метод добавляє в базу об'єкт, переданий в якості параметру.
	 * @param instance об'єкт, який потрібно добавати в базу.
	 * @return повертає об'єкт, якому був добавлений ключ, за яким
	 * він був збережений в базі.
	 * @throws DAOException
	 */
	public <T> T insert(T instance) throws DAOException;

	/**
	 * Зчитує з бази об'єкт за вказаним індексом.
	 * @param entityClass тип об'єкта, в який потрібно помістити
	 * результат.
	 * @param id ключ об'єкта в базі.
	 * @return повертає об'єкт заданого типу з бази.
	 * @throws DAOException
	 */
	public <T> T read(Class entityClass, int id) throws DAOException;

	/**
	 * Обновлює об'єкт в базі даних інформацією з об'єкта, який був
	 * переданий методу в якості параметру.
	 * @param instance об'єкт, інформацію якого потрібнооновити.
	 * @throws DAOException
	 */
	public <T> void update(T instance) throws DAOException;

	/**
	 * Видаляє з бази об'єкт, переданий в якості параметра.
	 * @param instance об'єкт, який потрібно видалити.
	 * @throws DAOException
	 */
	public <T> void delete(T instance) throws DAOException;

	/**
	 * Робить вибірку з бази даних групи об'єктів типу, який був вказаний
	 * в якості одного з параметрів методу. Вибірка складається з тих об'єктів
	 * які ззадовольнили умови фільтра.
	 * @param entityClass тип об'єктів вибірки.
	 * @param filter об'єкт типу {@link DAOFilter}, який встановлює критерій
	 * вибору об'єктів з бази даних.
	 * @return повертає список об'єктів.
	 * @throws DAOException
	 */
	public <T> List<T> select(Class entityClass, DAOFilter filter)
			throws DAOException;

	/**
	 * Повертає список об'єктів, які були вибрані з бази даних
	 * за допомогою SQL-запиту, який був переданий методу в якості 
	 * параметру.
	 * @param SQLString SQL-запит.
	 * @return Повертає список об'єктів, які були вибрані з бази даних
	 * за допомогою SQL-запиту, який був переданий методу в якості 
	 * параметру.
	 * @throws DAOException
	 */
	public <T> List<T> select(String SQLString) throws DAOException;

}
