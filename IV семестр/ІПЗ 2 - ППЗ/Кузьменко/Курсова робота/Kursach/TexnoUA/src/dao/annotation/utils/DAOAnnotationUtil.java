package dao.annotation.utils;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.ResultSet;

import dao.annotation.Stored;
import dao.annotation.utils.converter.BooleanConverter;
import dao.annotation.utils.converter.StringConverter;
import dao.annotation.utils.converter.intConverter;

/**
 * Клас для методів що використовуються при роботі з базою данних та класоми
 * представленням моделі
 * 
 * @author Vova
 * 
 */
public class DAOAnnotationUtil {
	/**
	 * трансформування значень
	 * 
	 * @param rs
	 *            значення з бази даних
	 * @param entityClass
	 *            клас значень що відповідають моделі програми
	 * @return <T>T значення T що повертаються
	 */
	public static <T> T fromResultSet(ResultSet rs, @SuppressWarnings("rawtypes") Class entityClass) {
		try {
			@SuppressWarnings("unchecked")
			T instance = (T) entityClass.newInstance();
			Field[] fields = entityClass.getDeclaredFields();

			while (rs.next()) {
				for (Field field : fields) {
					PropertyDescriptor p = new PropertyDescriptor(
							field.getName(), entityClass);
					Method write = p.getWriteMethod();

					if (field.getAnnotation(Stored.class).converter()
							.equals(intConverter.class)) {

						String g = (field.getAnnotation(Stored.class).name());
						int i = rs.getInt(Integer.parseInt(g));
						write.invoke(instance, i);

					}
					if (field.getAnnotation(Stored.class).converter()
							.equals(StringConverter.class)) {
						String i = rs.getString(Integer.parseInt(field
								.getAnnotation(Stored.class).name()));
						write.invoke(instance, i);
					}
					if (field.getAnnotation(Stored.class).converter()
							.equals(BooleanConverter.class)) {

						String g = (field.getAnnotation(Stored.class).name());
						Boolean i = rs.getBoolean(Integer.parseInt(g));
						write.invoke(instance, i);

					}

				}
			}
			return instance;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * пперетворення списку значень у дані для моделі
	 * 
	 * @param <T> тип що повертаємо
	 * 
	 * @param rs
	 *            значення що передаються з бази даних
	 * @param entityClass
	 *            клас що відповідає типу даних що повертаються з моделі

	 * @return список значень
	 */
	@SuppressWarnings("unchecked")
	public static <T> T fromResultSetList(ResultSet rs, @SuppressWarnings("rawtypes") Class entityClass) {

		try {
			Field[] fields = entityClass.getDeclaredFields();
			T instance = (T) entityClass.newInstance();

			for (Field field : fields) {
				PropertyDescriptor p = new PropertyDescriptor(field.getName(),
						entityClass);
				Method write = p.getWriteMethod();

				if (field.getAnnotation(Stored.class).converter()
						.equals(intConverter.class)) {

					String g = (field.getAnnotation(Stored.class).name());
					int i = rs.getInt(Integer.parseInt(g));
					write.invoke(instance, i);
				}
				if (field.getAnnotation(Stored.class).converter()
						.equals(StringConverter.class)) {
					String str = rs.getString(Integer.parseInt(field
							.getAnnotation(Stored.class).name()));
					write.invoke(instance, str);
				}
				if (field.getAnnotation(Stored.class).converter()
						.equals(BooleanConverter.class)) {

					String g = (field.getAnnotation(Stored.class).name());
					Boolean i = rs.getBoolean(Integer.parseInt(g));
					write.invoke(instance, i);

				}
			}
			return (T) instance;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		// return null;
	}

	/**
	 * повертає значення поля
	 * 
	 * @param instance
	 *            змінна, значення поля якої треба повернути
	 * @param f
	 *            поле, значення якого треба повернути
	 * @return значення що повертається
	 */
	@SuppressWarnings("unchecked")
	public static <T> T getFieldValue(T instance, Field f) {
		PropertyDescriptor p;
		try {
			p = new PropertyDescriptor(f.getName(), instance.getClass());
			if (f.getAnnotation(Stored.class).converter().equals(BooleanConverter.class)){
				BooleanConverter converter = new BooleanConverter();
				return (T) converter.toString(p.getReadMethod().invoke(instance, null));
			}else
			return ((T) p.getReadMethod().invoke(instance, null));
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return null;

	}

	/**
	 * метод що повератє назву класу за анотацією Stored
	 * 
	 * @param c
	 *            клас назву якого треба повернут
	 * @return строка зназвоюи
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static String getStorageName(Class c) {
		Stored t = (Stored) c.getAnnotation(Stored.class);
		return (t != null) ? t.name() : null;
	}
}
