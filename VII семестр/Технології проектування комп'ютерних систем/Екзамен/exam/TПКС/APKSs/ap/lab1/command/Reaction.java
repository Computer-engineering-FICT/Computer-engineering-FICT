package lab1.command;

/**
 * Класи всіх дій при реакції системи на подію повинні реалізувати даний
 * інтерфейс
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public interface Reaction {

	/**
	 * Дія, яку потрібно здійснити за потребою реакції.
	 * @throws Exception помилка при роботі системи.
	 */
	public void execute() throws Exception;

	/**
	 * @return ім"я реакції
	 */
	public String getName();
}
