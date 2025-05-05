package ro.adesso.vacation_app.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Lob;
import lombok.Getter;
import lombok.Setter;
import ro.adesso.vacation_app.util.AbstractEntity;

@Entity
@Getter
@Setter
public class CachedHolidayResponse extends AbstractEntity {

    private int year;
    private String countryCode;

    @Lob
    @Column(columnDefinition = "TEXT")
    private String holidaysJson;
}
