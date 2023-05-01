package uuu.pg.entity;

public class PGException extends Exception {
	
	public PGException() {
		super();
	}

	public PGException(String message, Throwable cause) {
		super(message, cause);		
	}

	public PGException(String message) {
		super(message);		
	}

}
