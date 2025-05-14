package ro.adesso.vacation_app.util;

import ro.adesso.vacation_app.model.PublicHoliday;

import java.time.LocalDate;
import java.util.List;

public interface PublicHolidayProvider {
    List<PublicHoliday> getHolidays(int year, String countryCode);

    List<LocalDate> getHolidaysBetweenDates(LocalDate startDate, LocalDate endDate, String ro);
}
