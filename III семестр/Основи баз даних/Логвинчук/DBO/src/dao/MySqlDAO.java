package dao;

import java.sql.*;
import java.util.ArrayList;
import java.beans.PropertyDescriptor;
import java.lang.reflect.*;

import dao.annotation.*;
import dao.util.ResultSetParser;

public class MySqlDAO implements DAOInterface {

	private static final String USER = "root";
	private static final String PASSWORD = "root";
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/mydb";
	
	private static  MySqlDAO dao = null;
	
	private MySqlDAO() throws ClassNotFoundException {
		Class.forName(DRIVER);
	}
	
	public static MySqlDAO getDAO() throws ClassNotFoundException {
		if (dao == null) {
			dao = new MySqlDAO();
		}
		return dao;
	}
	
	@Override
	public <T> void create(T instance) {
		try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
			
			Class<?> entity = instance.getClass();
			Field[] fields = entity.getDeclaredFields();
			
			StringBuilder sql = new StringBuilder("INSERT INTO ");
			StringBuilder sql1 = new StringBuilder(") VALUES (");
			
			sql.append(instance.getClass().getAnnotation(Table.class).name());
			sql.append(" (");
			
			for (Field field: fields) {
				if (field.isAnnotationPresent(Column.class) &&
						field.getAnnotation(Column.class).primaryKey() != true) {
					sql.append(field.getAnnotation(Column.class).name());
					sql.append(", ");
				}
			}
			
			for (Field field: fields) {
				if (field.isAnnotationPresent(Column.class) && 
						field.getAnnotation(Column.class).primaryKey() != true) {
					sql1.append("?,");
				}
			}
			
			sql1.setLength(sql1.length() - 1);
			sql1.append(')');
			
			sql.setLength(sql.length() - 2);
			sql.append(sql1);
			
			try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
			
				System.out.println(ps);
				int count = 1;
				
				for (Field field: fields) {
					if (field.isAnnotationPresent(Column.class) &&
							field.getAnnotation(Column.class).primaryKey() != true) {
						try {
							if (field.getAnnotation(Column.class).foreignKey() == true) {
								PropertyDescriptor pdesc = 
										new PropertyDescriptor(field.getName(), entity);
								ps.setInt(count, (int) pdesc.getReadMethod().invoke(instance));
							} else {
								PropertyDescriptor pdesc = 
										new PropertyDescriptor(field.getName(), entity);
								ps.setString(count, (String) pdesc.getReadMethod().invoke(instance)); 
							}
							count++;
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
				ps.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public <T> T retrieve(Class<?> entity, int id) {
		
		T instance = null;
		
		try (Connection conection = DriverManager.getConnection(URL, USER, PASSWORD)) {
		
			StringBuilder sql = new StringBuilder("SELECT * FROM ");
			sql.append(entity.getAnnotation(Table.class).name());
			sql.append(" WHERE ID=");
			sql.append(id);
			System.out.println(sql);
			try (Statement st = conection.createStatement()) {
				
				ResultSet rs = st.executeQuery(sql.toString());
				instance =  ResultSetParser.parseResultSet(rs, entity);

				
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return instance;
	}
	
	@Override
	public <T> ArrayList<T> retrieveAll(Class<?> entity) {
		// TODO Implement retrieving of all records in table.
		return null;
	}

	@Override
	public <T> void update(T instance) {
		try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
			
			Class<?> entity = instance.getClass();
			Field[] fields = entity.getDeclaredFields();
			
			String table = instance.getClass().getAnnotation(Table.class).name();
			StringBuilder sql = new StringBuilder("UPDATE ");
			sql.append(table);
			sql.append(" SET ");
			
			try {
				for (Field field : fields) {
					if (field.isAnnotationPresent(Column.class) &&
							field.getAnnotation(Column.class).primaryKey() != true) {
						if (field.getAnnotation(Column.class).foreignKey() == true) {
							sql.append(field.getAnnotation(Column.class).name());
							sql.append("=");
							PropertyDescriptor pdesc = 
									new PropertyDescriptor(field.getName(), entity);
							sql.append(pdesc.getReadMethod().invoke(instance));
							sql.append(", ");
						} else {
							sql.append(field.getAnnotation(Column.class).name());
							sql.append("='");
							PropertyDescriptor pdesc = new PropertyDescriptor(field.getName(), entity);
							sql.append(pdesc.getReadMethod().invoke(instance));
							sql.append("', ");
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			int id = 0;
			for (Field field : fields) {
				if (field.isAnnotationPresent(Column.class) &&
						field.getAnnotation(Column.class).primaryKey() == true) {
					try {
						PropertyDescriptor pdesc = new PropertyDescriptor(field.getName(), entity);
						id = (int) pdesc.getReadMethod().invoke(instance);
					} catch (Exception e) {
						e.printStackTrace();
					}
					break;
				}
			}
			
			sql = new StringBuilder(sql.substring(0, sql.length()- 2));
			sql.append(" WHERE ID=");
			sql.append(id);
			System.out.println(sql);
			
			try (Statement st = connection.createStatement()) {
				st.executeUpdate(sql.toString());
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public <T> void delete(T instance) {
		try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
			
			Class<?> entity = instance.getClass();
			Field[] fields = entity.getDeclaredFields();
			
			int id = 0;
			for (Field field : fields) {
				if (field.isAnnotationPresent(Column.class) &&
						field.getAnnotation(Column.class).primaryKey() == true) {
					try {
						PropertyDescriptor pdesc = new PropertyDescriptor(field.getName(), entity);
						id = (int) pdesc.getReadMethod().invoke(instance);
					} catch (Exception e) {
						e.printStackTrace();
					}
					break;
				}
			}
			
			String table = instance.getClass().getAnnotation(Table.class).name();
			StringBuilder sql = new StringBuilder("DELETE FROM ");
			
			sql.append(table);
			sql.append(" WHERE ID=?");
			
			try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
				ps.setInt(1, id);
				ps.executeUpdate();
				System.out.println(ps);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
