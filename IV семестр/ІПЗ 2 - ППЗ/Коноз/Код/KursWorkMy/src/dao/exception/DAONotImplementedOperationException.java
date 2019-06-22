package dao.exception;

public class DAONotImplementedOperationException extends DAOException {

	public DAONotImplementedOperationException() {
		super();
	}

	public DAONotImplementedOperationException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public DAONotImplementedOperationException(String message, Throwable cause) {
		super(message, cause);
	}

	public DAONotImplementedOperationException(String message) {
		super(message);
	}

	public DAONotImplementedOperationException(Throwable cause) {
		super(cause);
	}

}
