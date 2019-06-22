package kurs.element;

/**
 * Клас-з"єдання.
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class Connect {
	private Vershina _core;
	private Vershina _target;
	private int _weight;

	/**
	 * @param target на який вузол показує з"єднання
	 * @param weight вага з"єднання
	 */
	public Connect(Vershina target, int weight) {
		_target = target;
		_weight = weight;
		//_core = core;
	}
	
	/**
	 * @return Отримати кінцевий вузол, на який показує даний зв"язок.
	 */
	public Vershina get_target() {
		return _target;
	}
	
	/**
	 * @return отримати вагу пересилки
	 */
	public int get_weight() {
		return _weight;
	}
	
	/**
	 * @return той, з кого йде даний зв"язок(основа)
	 */
	public Vershina get_core() {
		return _core;
	}
}
