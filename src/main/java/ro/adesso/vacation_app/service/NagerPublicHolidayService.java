package ro.adesso.vacation_app.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import ro.adesso.vacation_app.exception.PublicHolidayFetchException;
import ro.adesso.vacation_app.model.PublicHoliday;
import ro.adesso.vacation_app.repository.PublicHolidayRepository;
import ro.adesso.vacation_app.util.PublicHolidayProvider;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class NagerPublicHolidayService implements PublicHolidayProvider {

    @Value("${api.public-holidays.url}")
    private String nagerServiceApiURL;
    private final RestTemplate restTemplate = new RestTemplate();
    private final PublicHolidayRepository publicHolidayRepository;

    public NagerPublicHolidayService(PublicHolidayRepository publicHolidayRepository) {
        this.publicHolidayRepository = publicHolidayRepository;
    }

    @Override
    @Cacheable(value = "publicHolidays", key = "#countryCode + '-' + #year")
    public List<PublicHoliday> getHolidays(int year, String countryCode) {
        //TODO: implement Local for country code

        // Attempt to retrieve holidays from DB.
        List<PublicHoliday> publicHolidays = publicHolidayRepository.findByCountryCodeAndDateBetween(
                countryCode,
                LocalDate.of(year, 1, 1),
                LocalDate.of(year, 12, 31)
        );
        if (!publicHolidays.isEmpty()) {
            return publicHolidays;
        }

        // Retrieve holidays from API .
        String url = String.format("%s/%d/%s", nagerServiceApiURL, year, countryCode);
        try {
            PublicHoliday[] response = restTemplate.getForObject(url, PublicHoliday[].class);
            if (response == null || response.length == 0) {
                throw new PublicHolidayFetchException("No public holidays returned from API for " + countryCode + " in " + year);
            }

            List<PublicHoliday> fetchedHolidays = Arrays.asList(response);
            publicHolidayRepository.saveAll(fetchedHolidays);
            return fetchedHolidays;

        } catch (RestClientException e) {
            throw new PublicHolidayFetchException("Failed to retrieve public holidays from API: " + e.getMessage(), e);
        }
    }

    @Cacheable(value = "publicHolidays", key = "#countryCode + '-' + #startDate + '-' + #endDate")
    public List<LocalDate> getHolidaysBetweenDates(LocalDate startDate, LocalDate endDate, String countryCode) {
        System.out.println("Fetching holidays from DB/API (not cache)");
        List<PublicHoliday> publicHolidays = publicHolidayRepository.findByCountryCodeAndDateBetween(countryCode, startDate, endDate);
        if (!publicHolidays.isEmpty()) {
            return publicHolidays.stream().map(PublicHoliday::getDate).collect(Collectors.toList());
        }

        Set<Integer> years = new HashSet<>();
        years.add(startDate.getYear());
        if (startDate.getYear() != endDate.getYear()) {
            years.add(endDate.getYear());
        }

        return years.stream()
                .flatMap(year -> getHolidays(year, countryCode).stream())
                .map(PublicHoliday::getDate)
                .filter(date -> !date.isBefore(startDate) && !date.isAfter(endDate))
                .toList();
    }
}
