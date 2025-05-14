package ro.adesso.vacation_app.exception;

public class VacationRequestException extends RuntimeException {
    public VacationRequestException(String message) {
        super(message);
    }

    public VacationRequestException(String message, Throwable cause) {
        super(message, cause);
    }
}
