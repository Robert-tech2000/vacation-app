package ro.adesso.vacation_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ro.adesso.vacation_app.model.CachedHolidayResponse;

import java.util.Optional;

public interface CachedHolidayResponseRepository extends JpaRepository<CachedHolidayResponse, Long> {
    Optional<CachedHolidayResponse> findByCountryCodeAndYear(String countryCode, int year);
}
