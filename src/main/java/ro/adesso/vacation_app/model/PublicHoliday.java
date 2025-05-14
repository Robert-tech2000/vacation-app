package ro.adesso.vacation_app.model;

import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;
import ro.adesso.vacation_app.util.AbstractEntity;

import java.time.LocalDate;

@Entity
@Getter
@Setter
public class PublicHoliday extends AbstractEntity {

    private LocalDate date;
    private String localName;
    private String name;
    private String countryCode;
}
