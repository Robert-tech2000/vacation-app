package ro.adesso.vacation_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ro.adesso.vacation_app.model.PublicHoliday;

import java.time.LocalDate;
import java.util.List;

public interface PublicHolidayRepository extends JpaRepository<PublicHoliday, Long> {

    List<PublicHoliday> findByCountryCodeAndDateBetween(String countryCode, LocalDate startDate, LocalDate endDate);
}
