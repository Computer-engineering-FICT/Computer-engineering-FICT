package dao;

/**
 * Інтерфейс філтра, який відбирає об'єкти за певним критерієм.
 * @author Коноз Андрій
 */
public interface DAOFilter {
	/**
	 * Метод який перевіряє чи задовольняє об'єкт умови.
	 * @param entity об'єкт для перевірки.
	 * @return true якщо об'єкт задовольняє умови. В іншому разі - false.
	 */
	public <T> 	boolean accept(T entity);
}
