package dao.annotation.converter;



import dao.annotation.ValueConverter;

/**
 * Клас який реалізовує функціонал конвертера значень цілого типу.
 * @author Коноз Андрій 
 */
public class intConverter implements ValueConverter {

	/* (non-Javadoc)
	 * @see dao.annotation.ValueConverter#toString(java.lang.Object)
	 */
	@Override
	public <T> String toString(T value) {
		if(value == null) return "null";
		return Integer.toString((Integer)value);
	}

	/* (non-Javadoc)
	 * @see dao.annotation.ValueConverter#toValue(java.lang.String)
	 */
	@Override
	public <T> T toValue(String str) {
		if(str.equals("null")) return null;
		return (T)new Integer(Integer.parseInt(str));
	}
}
