
/**
 * Sample exception class with additional information about exceptional case.
 * @author Glushko Olga
 */
public class InvalidPropertyValueException extends Exception {

	private String value;
	/**
	 * This property is required for every serializable class
	 * (though serialization isn't implemented here)
	 */
	private static final long serialVersionUID = 3594538411623417499L;
	
	/**
	 * Constructs an empty <code>InvalidPropertyValueException</code> object
	 */
	public InvalidPropertyValueException() {
		value = null;
	}
	
	/**
	 * Constructs an <code>InvalidPropertyValueException</code> object with
	 * <code>value</code> property set to value that was treated as invalid.
	 * @param value
	 */
	public InvalidPropertyValueException(String value) {
		this.value = value;
	}

	/**
	 * @return value that was treated as invalid.
	 */
	public String getValue() {
		return value;
	}
}
