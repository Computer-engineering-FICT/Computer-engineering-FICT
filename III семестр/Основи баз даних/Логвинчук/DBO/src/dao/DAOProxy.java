package dao;

import java.beans.IntrospectionException;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import dao.MySqlDAO;
import dao.annotation.CascadeReference;

public class DAOProxy implements DAOInterface {
	
	private static MySqlDAO dao = null;
	private static DAOProxy daoProxy = null;
	
	private static HashMap<Class<?>, HashMap> cache = null;
	
	private DAOProxy() throws ClassNotFoundException {
		dao = MySqlDAO.getDAO();
		cache = new HashMap<Class<?>, HashMap>();
	}
	
	public static DAOProxy getDAOProxy() throws ClassNotFoundException {
		if (daoProxy == null) {
			daoProxy = new DAOProxy();
		}
		return daoProxy;
	}
	

	public <T> void create(T instance) {
		dao.create(instance);
	}

	@Override
	@SuppressWarnings("unchecked")
	public <T> T retrieve(Class<?> entity, int id) {
		
		T instance = null;
		
		if (!cache.containsKey(entity)) {
			cache.put(entity, new HashMap<Integer, T>());
		}
		
		if (!cache.get(entity).containsKey(id)) {
			instance = dao.retrieve(entity, id);

			cache.get(entity).put(id, instance);
		} else {
			instance = (T) cache.get(entity).get(id);
		}

		return instance;
	}

	@Override
	public <T> void update(T instance) {
		dao.update(instance);
	}

	@Override
	public <T> void delete(T instance) {
		// TODO Auto-generated method stub

	}

	@Override
	public <T> List<T> retrieveAll(Class<?> T) {
		// TODO Auto-generated method stub
		return null;
	}

}
