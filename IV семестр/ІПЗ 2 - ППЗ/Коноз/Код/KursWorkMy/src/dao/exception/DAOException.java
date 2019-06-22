package dao.exception;

/**
 * Клас, помилки якого генеруються в об'єктах доступу до моделі.
 * @author Коноз Андрій
 */
public class DAOException extends Exception {

	public DAOException() {
		super();
	}

	public DAOException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public DAOException(String message, Throwable cause) {
		super(message, cause);
	}

	public DAOException(String message) {
		super(message);
	}

	public DAOException(Throwable cause) {
		super(cause);
	}

}
