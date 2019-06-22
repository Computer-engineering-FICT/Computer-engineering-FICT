package dao.mysql;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import config.AppConfig;
import dao.CRUDInterface;
import dao.annotation.Stored;
import dao.annotation.utils.DAOAnnotationUtil;
import dao.annotation.utils.converter.StringConverter;
import dao.annotation.utils.converter.BooleanConverter;
import dao.annotation.utils.converter.intConverter;

/**
 * ���� �� ������ � ����� �����
 * 
 * @author Vova
 * 
 */
public class MySqlCRUD implements CRUDInterface {
	/**
	 * ��������� ��'��
	 */
	private MySqlCRUD nextCrud = null;
	/**
	 * ��*� ��������
	 */
	private StringBuffer driverName;
	/**
	 * ��'� ������
	 */
	private StringBuffer serverName;
	/**
	 * ��*� ���� �����
	 */
	private StringBuffer databaseName;
	/**
	 * url ������
	 */
	private StringBuffer url;
	/**
	 * ��'� �����������
	 */
	private StringBuffer userName;
	/**
	 * ������
	 */
	private StringBuffer password;
	/**
	 * ������ ������������. � ���� ������������ ��������� ���������� ���
	 * ������������ �'������ � ����� �����
	 */
	private AppConfig configuration;
	/**
	 * ������ �*�������
	 */
	private Connection connection;

	/**
	 * ����������� �����.
	 * 
	 * @param mySqlCRUD
	 *            ��������� ���� ��� ������ � �����.
	 */
	public MySqlCRUD(MySqlCRUD mySqlCRUD) {
		super();
		this.nextCrud = mySqlCRUD;

	}

	/**
	 * ����������� �����
	 * 
	 * @param config
	 *            ������������ ��� ��'������� �� ���� �����
	 */
	public MySqlCRUD(AppConfig config) {
		this.configuration = config;
		try {
			open(configuration);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param config
	 *            ������������ ��� �������� �'������� � ����� �����
	 */
	@Override
	public void open(AppConfig config) throws Exception {
		if (nextCrud != null) {
			if (config!=null)
			nextCrud.open(config);
		}
		try {
			this.driverName = new StringBuffer(config.getProperty("driverName"));
			this.databaseName = new StringBuffer(
					config.getProperty("databaseName"));
			this.serverName = new StringBuffer(config.getProperty("serverName"));
			this.url = new StringBuffer(config.getProperty("url"));
			this.userName = new StringBuffer(config.getProperty("userName"));
			this.password = new StringBuffer(config.getProperty("password"));
			this.url = url.append(serverName).append("/").append(databaseName);
			Class.forName(driverName.toString());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection = DriverManager.getConnection(url.toString(),
				userName.toString(), password.toString());
	}

	@Override
	/**
	 * ����� �� ������� �'������ � ����� �����
	 */
	public void close() throws Exception {
			if(connection!=null);
			connection.close();
		
	}

	@SuppressWarnings("unused")
	@Override
	/**
	 * ����� �� ������ ���������� � ���� �����
	 * @author Vova
	 * @param instance ���� �����, �� ����������� ������� ��� ������
	 */
	public <T> T insert(T instance) throws Exception {
		try {
			@SuppressWarnings("rawtypes")
			Class class1 = instance.getClass();
			StringBuilder str = new StringBuilder("INSERT INTO ");
			StringBuilder str1 = new StringBuilder("(");
			str.append(DAOAnnotationUtil.getStorageName(instance.getClass()));
			Field[] fields = instance.getClass().getDeclaredFields();
			str.append("(");
			for (Field field : fields) {
				if (!field.getAnnotation(Stored.class).name().equals("id")) {
					str1.append("?,");
				}
			}
			str1 = new StringBuilder(str1.substring(0, str1.length() - 1));
			str1.append(")");
			str = new StringBuilder(str.substring(0, str.length() - 1));
			str.append(" VALUES");
			str.append(str1);
			PreparedStatement p = connection.prepareStatement(str.toString(),
					Statement.RETURN_GENERATED_KEYS);

			int i = 1;
			for (Field field : fields) {

				if (!field.getAnnotation(Stored.class).name().equals("id")) {
					if (field.getAnnotation(Stored.class).converter()
							.equals(intConverter.class)) {
						p.setInt(i, (Integer) DAOAnnotationUtil.getFieldValue(
								instance, field));
					}
					if (field.getAnnotation(Stored.class).converter()
							.equals(StringConverter.class)) {
						p.setString(i, (String) DAOAnnotationUtil
								.getFieldValue(instance, field));
					}
					if (field.getAnnotation(Stored.class).converter()
							.equals(BooleanConverter.class)) {
						p.setBoolean(i, (Boolean) DAOAnnotationUtil
								.getFieldValue(instance, field));
					}
					i++;
				}
			}
			p.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * ����� �� ����� ���������� �� ���� �����
	 * 
	 * @param entityClass
	 *            ���� �� ����������� ������� � ��� ����� ������� ���
	 * @param id
	 *            ���� ��� ������
	 * @param <T>
	 *            ��� � ���� ������ �����
	 */
	@Override
	public <T> T read(@SuppressWarnings("rawtypes") Class entityClass, int id) throws Exception {
		try {
			StringBuffer sql = new StringBuffer("select * from ");
			sql.append(entityClass.getSimpleName());
			Field[] fields = entityClass.getDeclaredFields();
			sql.append(" where ");
			sql.append(fields[0].getName());
			sql.append("=");
			sql.append(id);
			Statement stm = connection.createStatement();
			ResultSet rs = stm.executeQuery(sql.toString());

			return DAOAnnotationUtil.fromResultSet(rs, entityClass);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * ����� �� �������� ��� � � ���.
	 * 
	 * @param instance
	 *            �������� �� ����� �������
	 * @param <T>
	 *            ��� ����� ��������
	 */
	@SuppressWarnings("unused")
	@Override
	public <T> void update(T instance) throws Exception {
		@SuppressWarnings("rawtypes")
		Class class1 = instance.getClass();
		StringBuffer sql = new StringBuffer("UPDATE ");
		sql.append(class1.getSimpleName());
		sql.append(" set ");
		Field[] fields = class1.getDeclaredFields();
		PropertyDescriptor p;

		for (Field field : fields) {
			sql.append(field.getName());
			sql.append("=");
			if (field.getAnnotation(Stored.class).converter()
					.equals(intConverter.class)) {
				sql.append(DAOAnnotationUtil.getFieldValue(instance, field)
						.toString());
				sql.append(", ");
			} else {
				sql.append("'");
				sql.append(DAOAnnotationUtil.getFieldValue(instance, field)
						.toString());
				sql.append("', ");

			}
		}
		sql = new StringBuffer(sql.substring(0, sql.length() - 2));
		sql.append(" where id=");
		for (Field field : fields) {
			if (field.getAnnotation(Stored.class).name().equals("1")) {
				sql.append(DAOAnnotationUtil.getFieldValue(instance, field)
						.toString());
			}
		}
		Statement stm = connection.createStatement();
		stm.executeUpdate(sql.toString());
	}

	/**
	 * ����� �� ������ ����� ��������� ���������� � ���� �����
	 * 
	 * @param instance
	 *            ��� �� ����� ��������
	 * @param <T>
	 *            ��� �����
	 */
	@Override
	public <T> void delete(T instance) throws Exception {
		@SuppressWarnings("rawtypes")
		Class class1 = instance.getClass();
		StringBuffer sql = new StringBuffer("DELETE FROM ");
		sql.append(instance.getClass().getSimpleName());
		sql.append(" WHERE id=");
		Field[] fields = class1.getDeclaredFields();
		for (Field field : fields) {
			if (field.getAnnotation(Stored.class).name().equals("1")) {
				sql.append(DAOAnnotationUtil.getFieldValue(instance, field)
						.toString());
			}
		}
		Statement stm = connection.createStatement();
		stm.execute(sql.toString());
	}

	/**
	 * ����� �� ������ ����� �� ���� �����, ��� ������� ������ �������
	 * 
	 * @param entityClass
	 *            ���� �� ���������� ������� � ��� �������� ���
	 * @param <T>
	 *            ��� ����� �� ������������ � ������
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> select(@SuppressWarnings("rawtypes") Class entityClass) throws Exception {

		StringBuffer sql = new StringBuffer("select * from ");
		sql.append(entityClass.getSimpleName());
		Statement stm = connection.createStatement();
		ResultSet rs = stm.executeQuery(sql.toString());
		ArrayList<T> list = new ArrayList<T>();
		while (rs.next()) {
			list.add((T) DAOAnnotationUtil.fromResultSetList(rs, entityClass));
		}
		return list;
	}

	@Override
	public <T> List<T> select(String SQLString) throws Exception {
		return null;
	}

}
