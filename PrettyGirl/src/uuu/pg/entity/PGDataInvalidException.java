package uuu.pg.entity;

public class PGDataInvalidException extends RuntimeException {
	public PGDataInvalidException() {
		super();
	}

	public PGDataInvalidException(String message, Throwable cause) {
		super(message, cause);
	}

	public PGDataInvalidException(String message) {
		super(message);
	}	

}
