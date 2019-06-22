package dao;

/**
 *
 *Клас який реалізує фільтр, який відбирає всі без виключення об'єкти.
 * @author Коноз Андрій
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
