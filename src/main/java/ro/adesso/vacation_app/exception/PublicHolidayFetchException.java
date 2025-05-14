package ro.adesso.vacation_app.exception;

public class PublicHolidayFetchException extends RuntimeException {
    public PublicHolidayFetchException(String message) {
        super(message);
    }

    public PublicHolidayFetchException(String message, Throwable cause) {
        super(message, cause);
    }
}
