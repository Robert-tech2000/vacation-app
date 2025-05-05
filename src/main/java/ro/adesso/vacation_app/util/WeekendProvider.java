package ro.adesso.vacation_app.util;

import java.time.LocalDate;

public interface WeekendProvider {

    boolean isWeekend(LocalDate date, String countryCode);
}
