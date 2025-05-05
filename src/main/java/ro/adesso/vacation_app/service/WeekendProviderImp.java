package ro.adesso.vacation_app.service;

import org.springframework.stereotype.Service;
import ro.adesso.vacation_app.util.WeekendProvider;

import java.time.DayOfWeek;
import java.time.LocalDate;

@Service
public class WeekendProviderImp implements WeekendProvider {

    @Override
    public boolean isWeekend(LocalDate date, String countryCode) {
        DayOfWeek day = date.getDayOfWeek();
        return day == DayOfWeek.SATURDAY || day == DayOfWeek.SUNDAY;
    }
}
