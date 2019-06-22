package dao;

import java.beans.PropertyDescriptor;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.lang.reflect.Field;
import configuration.CompositeStructure.AppConfiguration;
import configuration.CompositeStructure.CompositeComponent;
import dao.annotation.DAOAnnotationUtils;
import dao.exception.*;

/**
 * Клас реалізує інтерфейс {@link CRUIDInterfase} для бази даних MySQL
 * @author Коноз Андрій
 */
public class CRUIDRealisation implements CRUIDInterfase {

	/**
	 * @param connection зберігає в собі з'єднання з базою даних.
	 */
	public java.sql.Connection connection;

	/**
	 * Пустий конструктор.
	 */
	public CRUIDRealisation() {

	}
	/* (non-Javadoc)
	 * @see dao.CRUIDInterfase#close()
	 */
	@Override
	public void close() throws DAOException {
		try{
			connection.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/* (non-Javadoc)
	 * @see dao.CRUIDInterfase#insert(java.lang.Object)
	 */
	@Override
	public <T> T insert(T instance) throws DAOException {
		Map<String, Field> table = DAOAnnotationUtils.getStoredFields(instance.getClass());
		PropertyDescriptor p;
		int id;
		
		Set<String> keys = table.keySet();
		StringBuffer request = new StringBuffer("Insert into ");
		request.append(DAOAnnotationUtils.getStorageName(instance.getClass()));
		request.append(" (");
		
		for (String key : keys){
			request.append(key);
			request.append(",");
		}
		request.delete(request.lastIndexOf(","), request.lastIndexOf(",")+1);
		Class type;
		request.append(") values (");
		try{
			for (String key : keys){
				
				p = new PropertyDescriptor(table.get(key).getName(), instance.getClass());
				type = p.getReadMethod().getReturnType();
				if (type == String.class){
					request.append("'");
					request.append(p.getReadMethod().invoke(instance));
					request.append("'");
				}else{
					request.append(p.getReadMethod().invoke(instance));
				}
				request.append(",");
			}
			request.delete(request.lastIndexOf(","), request.lastIndexOf(",")+1);
			request.append(")");
			PreparedStatement prepInsert = connection.prepareStatement(request.toString());
			prepInsert.executeUpdate();
			
			
			p = new PropertyDescriptor(DAOAnnotationUtils.getPrimaryKey(instance.getClass()).getName(), instance.getClass());
			id = getId(instance);
			p = new PropertyDescriptor(DAOAnnotationUtils.getPrimaryKey(instance.getClass()).getName(), instance.getClass());                     
			p.getWriteMethod().invoke(instance, id);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return instance;
	}
	
	/**
	 * Допоміжний метод, який допомагає отримати ключ об'єкта в таблиці бази даних, використовуючи інші поля
	 * об'єкта
	 * @param instance об'єкт, для якого потрібно отримати ключ.
	 * @return повертає ключ.
	 */
	private <T> int getId(T instance){
		int result = -1;
		Class type;
		PropertyDescriptor p;
		StringBuffer getId = new StringBuffer();
		Map<String, Field> table = DAOAnnotationUtils.getStoredFields(instance.getClass());
		Set<String> keys = table.keySet();
		keys.remove(DAOAnnotationUtils.getPrimaryKey(instance.getClass()).getName().toUpperCase());
		getId.append("Select ");
		getId.append(DAOAnnotationUtils.getStorageName(instance.getClass()));
		getId.append(".");
		getId.append(DAOAnnotationUtils.getPrimaryKey(instance.getClass()).getName());
		getId.append(" from ");
		getId.append(DAOAnnotationUtils.getStorageName(instance.getClass()));
		getId.append(" where ");
		try{
			for (String key : keys){
				getId.append(key);
				getId.append(" = ");
				p = new PropertyDescriptor(table.get(key).getName(), instance.getClass());
				type = p.getReadMethod().getReturnType();
				if (type == String.class){
					getId.append("'");
					getId.append(p.getReadMethod().invoke(instance));
					getId.append("' and ");
				}else{
					getId.append(p.getReadMethod().invoke(instance));
					getId.append(" and ");
				}
			}
			getId.delete(getId.lastIndexOf(" and "), getId.lastIndexOf(" and ")  + 10);
			PreparedStatement requestId = connection.prepareStatement(getId.toString());
			ResultSet realId = requestId.executeQuery();
			if (realId.next()) {
				result = realId.getInt(DAOAnnotationUtils.getPrimaryKey(instance.getClass()).getName());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	/* (non-Javadoc)
	 * @see dao.CRUIDInterfase#read(java.lang.Class, int)
	 */
	@Override
	public <T> T read(Class entityClass, int id) throws DAOException {
		T result = null;
		try {
			result = (T) entityClass.newInstance();
			PreparedStatement preparest = connection
					.prepareStatement("Select * from "
							+ DAOAnnotationUtils.getStorageName(entityClass)
							+ " where "+ DAOAnnotationUtils.getPrimaryKey(entityClass).getName() +" = " + id);
			ResultSet resSet = preparest.executeQuery();
			
			PropertyDescriptor p;
			Field field;
			Class type;
			if (resSet.next()) {
				Map<String, Field> table = DAOAnnotationUtils
						.getStoredFields(entityClass);
				
				for (String key : table.keySet()) {
					field = table.get(key);
					p = new PropertyDescriptor(field.getName(), result.getClass());
					type = p.getReadMethod().getReturnType();
					if(type == int.class){
						int value = resSet.getInt(key);
						p.getWriteMethod().invoke(result, value);
					}else{
						String value = resSet.getString(key);
						p.getWriteMethod().invoke(result, value);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* (non-Javadoc)
	 * @see dao.CRUIDInterfase#update(java.lang.Object)
	 */
	@Override
	public <T> void update(T instance) throws DAOException {
		StringBuffer request = new StringBuffer("update ");
		PropertyDescriptor p;
		Class type;
		Map<String, Field> table = DAOAnnotationUtils.getStoredFields(instance.getClass());
		Set<String> keys = table.keySet();
		keys.remove(DAOAnnotationUtils.getPrimaryKey(instance.getClass()).getName().toUpperCase());
		request.append(DAOAnnotationUtils.getStorageName(instance.getClass()));
		request.append(" set ");
		try{
			for(String key : table.keySet()){
				p = new PropertyDescriptor(table.get(key).getName(), instance.getClass());
				request.append(key);
				request.append(" = ");
				p = new PropertyDescriptor(table.get(key).getName(), instance.getClass());
				type = p.getReadMethod().getReturnType();
				if (type == String.class){
					request.append("'");
					request.append(p.getReadMethod().invoke(instance));
					request.append("', ");
				}else{
					request.append(p.getReadMethod().invoke(instance));
					request.append(", ");
				}
			
			}
			request.delete(request.lastIndexOf(","), request.lastIndexOf(",")+1);
			request.append(" where ");
			request.append(DAOAnnotationUtils.getPrimaryKey(instance.getClass()).getName());
			request.append(" = ");
			p = new PropertyDescriptor(DAOAnnotationUtils.getPrimaryKey(instance.getClass()).getName(), instance.getClass());
			request.append(p.getReadMethod().invoke(instance));
			PreparedStatement update = connection.prepareStatement(request.toString());
			update.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		

	}

	/* (non-Javadoc)
	 * @see dao.CRUIDInterfase#delete(java.lang.Object)
	 */
	@Override
	public <T> void delete(T instance) throws DAOException {
		StringBuffer request = new StringBuffer("delete from ");
		request.append(DAOAnnotationUtils.getStorageName(instance.getClass()));
		request.append(" where ");
		request.append(DAOAnnotationUtils.getPrimaryKey(instance.getClass()).getName());
		request.append(" = ");
		request.append(DAOAnnotationUtils.getPrimaryKeyValue(instance));

		try{
			PreparedStatement delete = connection.prepareStatement(request.toString());
			delete.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}

	}

	/* (non-Javadoc)
	 * @see dao.CRUIDInterfase#select(java.lang.Class, dao.DAOFilter)
	 */
	@Override
	public <T> List<T> select(Class entityClass, DAOFilter filter)
			throws DAOException {
		T resultItem;
		List<T> result = new LinkedList<T>();
		StringBuffer request = new StringBuffer("select * from ");
		ResultSet resultSet;
		PropertyDescriptor p;
		Field field;
		Class type;
		request.append(DAOAnnotationUtils.getStorageName(entityClass));
		
		try{
			resultItem = (T) entityClass.newInstance();
			PreparedStatement selectAll = connection.prepareStatement(request.toString());
			resultSet = selectAll.executeQuery();
			while(resultSet.next()){
				resultItem = (T) entityClass.newInstance();
				Map<String, Field> table = DAOAnnotationUtils
						.getStoredFields(entityClass);
				for (String key : table.keySet()) {
					field = table.get(key);
					p = new PropertyDescriptor(field.getName(), resultItem.getClass());
					type = p.getReadMethod().getReturnType();
					if(type == int.class){
						int value = resultSet.getInt(key);
						p.getWriteMethod().invoke(resultItem, value);
					}else{
						String value = resultSet.getString(key);
						p.getWriteMethod().invoke(resultItem, value);
					}
				}
				if (filter.accept(resultItem)){
					result.add(resultItem);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	/* (non-Javadoc)
	 * @see dao.CRUIDInterfase#select(java.lang.String)
	 */
	@Override
	public <T> List<T> select(String SQLString) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see dao.CRUIDInterfase#open(configuration.CompositeStructure.AppConfiguration)
	 */
	@Override
	public void open(AppConfiguration configuration) throws DAOException {
		CompositeComponent jdbcConfig = configuration.getProperties("Database");
		String login = jdbcConfig.getProperty("login");
		String password = jdbcConfig.getProperty("password");
		String url = jdbcConfig.getProperty("url");
		String driverName = jdbcConfig.getProperty("driverName");
		try {
			Class.forName(driverName);
			connection = DriverManager.getConnection(url + "?useUnicode=true&characterEncoding=UTF-8", login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
