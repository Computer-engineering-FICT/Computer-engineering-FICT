package configuration.CompositeStructure;

/**
 * Клас описує функціонал об'єкта, який буде зберігати конфігурацію
 * всієї програми. Оскільки конфігурація програми повинна завжди бути в
 * єдиному екземплярі, то при реалізації даного класу був використаний
 * паттерн Одинак. Всі конструктори були оголошені приватними.
 * @author Коноз Андрій 
 */
public class AppConfiguration extends CompositeComponent {

	/**
	 * appConfig зберігає единий екземпляр об'єкта {@link CompositeComponent}
	 */
	private static AppConfiguration appConfig;
	/**
	 * *{@value} composComp зберігає в собі корінь композитної структури, яка
	 * буде використовуватись об'єктом {@link AppConfiguration}
	 */

	private static CompositeComponent composComp;

	/**
	 * Пустий конструктор
	 */
	private AppConfiguration() {

	}

	/**
	 * Коструктор, який в якості аргументу приймає об'єкт-корінь
	 * композиту-конфігурації.
	 * 
	 * @param comp
	 *            корінь композиту-конфігурації
	 */
	private AppConfiguration(CompositeComponent comp) {
		composComp = comp;
	}

	/**
	 * Метод встановлює корінь ієрархії конфігурації. Не рекомендовано змінювати
	 * ієрархії часто.
	 * 
	 * @param comp
	 *            корінь ієрархії конфігурацій.
	 */
	public static void setAppConfiguration(CompositeComponent comp) {
		composComp = comp;
	}

	/**
	 * Статичний метод, який повертає адресу на єдиний об'єкт
	 * {@link CompositeComponent}
	 * 
	 * @return адресу на об'єкт {@link CompositeComponent}
	 */
	public static AppConfiguration getAppConfiguration() {
		if (appConfig == null) {
			appConfig = new AppConfiguration();
		}
		return appConfig;
	}

	/**
	 * Статичний метод, який приймає в якості аргументу корінь ієрархії
	 * конфігурації і повертає адресу на об'єкт типу {@link CompositeComponent},
	 * який посилається на передану ієрархію.
	 * 
	 * @param comp
	 *            корінь ієрархії конфігурацій.
	 * @return повертає об'єкт типу {@link CompositeComponent}, який посилається
	 *         на передану ієрархію.
	 */
	public static AppConfiguration getAppConfiguration(CompositeComponent comp) {
		if (appConfig == null) {
			appConfig = new AppConfiguration(comp);
		}
		setAppConfiguration(comp);
		return appConfig;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see configuration.CompositeStructure.CompositeComponent#save()
	 */
	@Override
	public void save() {
		composComp.save();

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * configuration.CompositeStructure.CompositeComponent#load(java.lang.String
	 * )
	 */
	@Override
	public void load(String savePath) {
		composComp.load(savePath);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see configuration.CompositeStructure.CompositeComponent#getPath()
	 */
	@Override
	public String getPath() {
		return composComp.getPath();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see configuration.CompositeStructure.CompositeComponent#getName()
	 */
	@Override
	public String getName() {
		return composComp.getName();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * configuration.CompositeStructure.CompositeComponent#getProperties(java
	 * .lang.String)
	 */
	@Override
	public CompositeComponent getProperties(String name) {
		return composComp.getProperties(name);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see configuration.CompositeStructure.CompositeComponent#addComponent(
	 * configuration.CompositeStructure.CompositeComponent)
	 */
	@Override
	public void addComponent(CompositeComponent comp) {
		composComp.addComponent(comp);

	}

}
