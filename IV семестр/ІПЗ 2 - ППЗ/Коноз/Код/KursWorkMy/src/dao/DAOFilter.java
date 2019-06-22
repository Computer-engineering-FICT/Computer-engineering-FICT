package dao;

/**
 * ��������� ������, ���� ������ ��'���� �� ������ �������.
 * @author ����� �����
 */
public interface DAOFilter {
	/**
	 * ����� ���� �������� �� ����������� ��'��� �����.
	 * @param entity ��'��� ��� ��������.
	 * @return true ���� ��'��� ����������� �����. � ������ ��� - false.
	 */
	public <T> 	boolean accept(T entity);
}
