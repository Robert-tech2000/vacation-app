package ro.adesso.vacation_app.util;

import ro.adesso.vacation_app.dto.PublicHolidayDT0;

import java.time.LocalDate;
import java.util.List;

public interface PublicHolidayUtil {
    List<PublicHolidayDT0> getHolidays(int year, String countryCode);

    List<LocalDate> getHolidaysBetweenDates(LocalDate startDate, LocalDate endDate, String ro);
}
