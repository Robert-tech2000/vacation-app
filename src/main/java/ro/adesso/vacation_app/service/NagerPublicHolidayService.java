package ro.adesso.vacation_app.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ro.adesso.vacation_app.dto.PublicHolidayDT0;
import ro.adesso.vacation_app.util.PublicHolidayProvider;

import java.time.LocalDate;
import java.util.*;

@Service
public class NagerPublicHolidayService implements PublicHolidayProvider {

    @Value("${api.public-holidays.url}")
    private String nagerServiceApiURL;
    private final RestTemplate restTemplate = new RestTemplate();

    @Override
    public List<PublicHolidayDT0> getHolidays(int year, String countryCode) {
        String url = String.format("%s/%d/%s", nagerServiceApiURL, year, countryCode);
        PublicHolidayDT0[] response = restTemplate.getForObject(url, PublicHolidayDT0[].class);
        return Arrays.asList(response);
    }

    public List<LocalDate> getHolidaysBetweenDates(LocalDate startDate, LocalDate endDate, String countryCode) {
        Set<Integer> years = new HashSet<>();
        years.add(startDate.getYear());
        if (startDate.getYear() != endDate.getYear()) {
            years.add(endDate.getYear());
        }

        return years.stream()
                .flatMap(year -> getHolidays(year, countryCode).stream())
                .map(holiday -> LocalDate.parse(holiday.getDate()))
                .filter(date -> !date.isBefore(startDate) && !date.isAfter(endDate))
                .toList();
    }
}
