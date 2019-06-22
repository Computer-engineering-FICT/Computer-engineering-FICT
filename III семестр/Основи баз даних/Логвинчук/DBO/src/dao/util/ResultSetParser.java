package dao.util;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.ResultSet;

import dao.annotation.Column;

public abstract class ResultSetParser {

	public static <T> T parseResultSet(ResultSet rs, Class<?> entity) {
		
		try {
			@SuppressWarnings("unchecked")
			T instance = (T) entity.newInstance();
			Field[] fields = entity.getDeclaredFields();
			
			while (rs.next()) {
				for (Field field : fields) {
					PropertyDescriptor pdesc = new PropertyDescriptor(field.getName(), entity);
					Method write = pdesc.getWriteMethod();
					if (field.isAnnotationPresent(Column.class)) {
						if (field.getAnnotation(Column.class).foreignKey() == true ||
							field.getAnnotation(Column.class).primaryKey() == true) {
							write.invoke(instance, rs.getInt(field.getAnnotation(Column.class).name()));
						} else {
							write.invoke(instance, rs.getString(field.getAnnotation(Column.class).name()));
						}
					}
				}
			}
			return instance;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
