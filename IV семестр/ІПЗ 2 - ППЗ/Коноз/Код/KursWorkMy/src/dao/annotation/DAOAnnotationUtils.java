package dao.annotation;
import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import dao.annotation.Primary;
import dao.annotation.Stored;


/**
 * 
 * Клас містить набір статичних методів для роботи з класами, в яких
 * були використані анотації. 
 * @author Коноз Андрій
 */
public class DAOAnnotationUtils {
	
	
	/**
	 * @param c клас.
	 * @return Повертає ім'я таблиці, в яку буде записуватися даний клас.
	 */
	public static String getStorageName(Class c){
		Stored t = (Stored) c.getAnnotation(Stored.class);
		return (t!=null) ? t.name() : null;
	}
	
	
	/**
	 * @param c клас, головний ключ якого потрібно повернути.
	 * @return Повертає поле класу, яке позначено анотацією {@link Primary}.
	 */
	public static Field getPrimaryKey(Class c){
		Field[] fields = c.getDeclaredFields();
		for (Field field : fields) {
			Primary p = field.getAnnotation(Primary.class);
			if (p!=null){
				return field;
			}
		}
		return null;
	}
	
	/**
	 * @param instance об'єкт, в якому відбувається пошук.
	 * @return Повертає значення поля, яке позначене анотацією {@link Primary}.
	 */
	public static <T> int getPrimaryKeyValue(T instance){
		Field pk = getPrimaryKey(instance.getClass());
		PropertyDescriptor p;
		try {
			p = new PropertyDescriptor(pk.getName(), instance.getClass());
			return ((int) p.getReadMethod().invoke(instance,null));
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	/**
	 * Метод встановлює значення поля, яке позначене анотацією {@link Primary},
	 * об'єкта переданого методу в якості параметра. 
	 * @param instance об'єкт, якому потрібно встановити значення.
	 * @param value значення, яке потрібно встановити.
	 */
	public static <T> void setPrimaryKeyValue(T instance, int value){
		Field pk = getPrimaryKey(instance.getClass());
		PropertyDescriptor p;
		try {
			p = new PropertyDescriptor(pk.getName(), instance.getClass());
			p.getWriteMethod().invoke(instance,value);
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * @param c клас, для якого виконується дана операція.
	 * @return Повертає список всих полів класу, які позначені анотацією {@link Stored}.
	 */
	public static HashMap<String, Field> getStoredFields(Class c){
		HashMap<String, Field> res = new HashMap<String,Field>();
		Field[] fields = c.getDeclaredFields();
		for (Field field : fields) {
			Stored p = field.getAnnotation(Stored.class);
			if (p!=null){
				res.put(p.name(),field);
			}
		}
		return res;
	}
	
	
	/**
	 * @param instance клас, для якого виконується операція.
	 * @param f поле, для якого виконується операція.
	 * @return Повертає значення поля у вигляді рядка конкретного класу.
	 */
	public static <T> String getStringValue(T instance, Field f){
		try {
			PropertyDescriptor p = new PropertyDescriptor(f.getName(), instance.getClass());
			Class fieldClass = p.getPropertyType();
			if (fieldClass.getCanonicalName().equals("int")){
				return ((Integer) p.getReadMethod().invoke(instance,null)).toString();
			}
			if (fieldClass.getCanonicalName().equals("double")){
				return ((Double) p.getReadMethod().invoke(instance,null)).toString();
			}
			Object value = p.getReadMethod().invoke(instance,null);
			
			if(value==null) return "null";
			
			if (fieldClass.equals(String.class) || fieldClass.equals(UUID.class)) return "\""+value.toString()+"\"";
			
			
			
			String prefix = "";
			return	(value!=null) ? prefix+value.toString() : prefix+"NULL";
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (IntrospectionException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * @param instance клас. для якого відбувається операція.
	 * @param f поле, для якого відбувається операція.
	 * @return Повертається значення конкретного поля, конкретного класу.
	 */
	public static <T> T getFieldValue(T instance, Field f){
			PropertyDescriptor p;
			try {
				p = new PropertyDescriptor(f.getName(), instance.getClass());
				return ((T) p.getReadMethod().invoke(instance,null));
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
	 * @param instance клас, для якого відбувається операція.
	 * @return Повертає значення всих полів помічених анотацією {@link Stored}.
	 */
	public static <T> Properties  getValueList  ( T instance){
		 Properties res = new Properties();
		 Class instanceClass = instance.getClass();
		 HashMap<String, Field> storedFields= getStoredFields(instanceClass);
		 for (String storedName : storedFields.keySet()) {
			Field f = storedFields.get(storedName);
			res.setProperty(storedName, getStringValue(instance, f));
		 }
		 return res;
	}
	
	/**
	 * @param field поле, для якого відбувається операція.
	 * @return Повертає конвертер типу {@link ValueConverter} для заданого поля.
	 */
	public static <T extends ValueConverter> T getValueConverter(Field field){
		Stored s = (Stored) field.getAnnotation(Stored.class);
		Class converterClass = s.converter();
		try {
			ValueConverter res = (ValueConverter) converterClass.newInstance();
			return (T) res;
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * Перетворює об'єкт заданого типу в об'єкт типу {@link Map}.
	 * @param instance об'єкт для перетворення.
	 * @return повертає об'єкт типу {@link Map}.
	 */
	public static <T> Map entityToMap (T instance){
		
		PropertyDescriptor p;
		Map res = new HashMap<String,Object>();
		HashMap<String, Field> storedFields= getStoredFields(instance.getClass());
		try {
			for (String storedName : storedFields.keySet()) {
					Field f = storedFields.get(storedName);
					
						p = new PropertyDescriptor(f.getName(), instance.getClass());
						Class returnType = p.getReadMethod().getReturnType();
						Object value  = p.getReadMethod().invoke(instance, null);
						ValueConverter c = getValueConverter(f);
						res.put(storedName, c.toString(value));
			}
			return res;
		} catch (IntrospectionException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
					e.printStackTrace();
		}
		
		 return null;
	}
	

	/**
	 * Перетворює об'єкт типу {@link Map} в об'єкт заданого типу.
	 * @param instanceClass тип для створюваного об'єкта.
	 * @param map таблиця, з якої потрібно побудувати результат.
	 * @return повертає об'єкт заданого тиа=пу.
	 */
	public static <T> T MapToEntity (Class instanceClass, Map map){
		PropertyDescriptor p;
		HashMap<String, Field> storedFields= getStoredFields(instanceClass);
		try {
			T instance = (T) instanceClass.newInstance();
		
			for (String storedName : storedFields.keySet()) {
				Object strValue = map.get(storedName);
				Field f = storedFields.get(storedName);
				ValueConverter c = getValueConverter(f);
				p = new PropertyDescriptor(f.getName(), instanceClass);
				p.getWriteMethod().invoke(instance, c.toValue(strValue.toString()));
			}
			return instance;
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
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

	
	public DAOAnnotationUtils() {}

}
