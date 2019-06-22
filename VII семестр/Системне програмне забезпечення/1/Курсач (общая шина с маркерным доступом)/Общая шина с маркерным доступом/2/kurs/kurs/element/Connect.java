package kurs.element;

/**
 * ����-�"������.
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class Connect {
	private Vershina _core;
	private Vershina _target;
	private int _weight;

	/**
	 * @param target �� ���� ����� ������ �"�������
	 * @param weight ���� �"�������
	 */
	public Connect(Vershina target, int weight) {
		_target = target;
		_weight = weight;
		//_core = core;
	}
	
	/**
	 * @return �������� ������� �����, �� ���� ������ ����� ��"����.
	 */
	public Vershina get_target() {
		return _target;
	}
	
	/**
	 * @return �������� ���� ���������
	 */
	public int get_weight() {
		return _weight;
	}
	
	/**
	 * @return ���, � ���� ��� ����� ��"����(������)
	 */
	public Vershina get_core() {
		return _core;
	}
}
