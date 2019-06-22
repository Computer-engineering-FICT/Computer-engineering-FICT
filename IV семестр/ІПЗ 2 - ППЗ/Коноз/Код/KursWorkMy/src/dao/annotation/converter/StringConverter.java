package dao.annotation.converter;

import dao.annotation.ValueConverter;

/**
 * Клас який реалізує фінкціонал конвертера для значень типу {@link String}
 * @author Коноз Андрій 
 */
public class StringConverter implements ValueConverter {

	/* (non-Javadoc)
	 * @see dao.annotation.ValueConverter#toString(java.lang.Object)
	 */
	@Override
	public <T> String toString(T value) {
		if(value == null) return null;
		return "\""+((Object)value).toString()+"\"";
	}

	/* (non-Javadoc)
	 * @see dao.annotation.ValueConverter#toValue(java.lang.String)
	 */
	@Override
	public <T> T toValue(String str) {
		if (str==null) return null;
		if(str.equals("null")) return null;
		if(str.equals("\"\"")) return (T) "";
		if(str.equals("")) return (T) "";
		
		return (T)str;
	}
}
