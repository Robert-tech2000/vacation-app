package ro.adesso.vacation_app.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ro.adesso.vacation_app.dto.PublicHolidayDT0;
import ro.adesso.vacation_app.model.CachedHolidayResponse;
import ro.adesso.vacation_app.repository.CachedHolidayResponseRepository;
import ro.adesso.vacation_app.util.PublicHolidayProvider;

import java.time.LocalDate;
import java.util.*;

@Service
public class NagerPublicHolidayService implements PublicHolidayProvider {

    @Value("${api.public-holidays.url}")
    private String nagerServiceApiURL;
    private final RestTemplate restTemplate = new RestTemplate();
    private final CachedHolidayResponseRepository cacheRepository;
    private final ObjectMapper objectMapper;

    public NagerPublicHolidayService(CachedHolidayResponseRepository cacheRepository, ObjectMapper objectMapper) {
        this.cacheRepository = cacheRepository;
        this.objectMapper = objectMapper;
    }

    @Override
    public List<PublicHolidayDT0> getHolidays(int year, String countryCode) {
        // Attempt to retrieve holidays from cache.
        Optional<CachedHolidayResponse> cachedHolidays = cacheRepository.findByCountryCodeAndYear(countryCode, year);
        if (cachedHolidays.isPresent()) {
            try {
                return Arrays.asList(objectMapper.readValue(
                        cachedHolidays.get().getHolidaysJson(), PublicHolidayDT0[].class));
            } catch (JsonProcessingException e) {
                throw new RuntimeException("Failed to parse cached holidays JSON", e);
            }
        }

        // Retrieve holidays from API .
        String url = String.format("%s/%d/%s", nagerServiceApiURL, year, countryCode);
        PublicHolidayDT0[] response = restTemplate.getForObject(url, PublicHolidayDT0[].class);

        try {
            String holidayResponseJson = objectMapper.writeValueAsString(response);

            CachedHolidayResponse holidayResponse = new CachedHolidayResponse();
            holidayResponse.setYear(year);
            holidayResponse.setCountryCode(countryCode);
            holidayResponse.setHolidaysJson(holidayResponseJson);

            cacheRepository.save(holidayResponse);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Failed to serialize holidays for caching", e);
        }

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
