package dao;

/**
 *
 *���� ���� ������ ������, ���� ������ �� ��� ���������� ��'����.
 * @author ����� �����
 */
public class FilterStub implements DAOFilter{

	/* (non-Javadoc)
	 * @see dao.DAOFilter#accept(java.lang.Object)
	 */
	@Override
	public <T> boolean accept(T entity) {
		return true;
	}

	

}
