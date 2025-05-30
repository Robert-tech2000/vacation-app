package ro.adesso.vacation_app.dto;

import lombok.Getter;
import lombok.Setter;
import ro.adesso.vacation_app.util.AbstractEntity;

import java.time.LocalDate;

@Getter
@Setter
public class PublicHolidayDT0 extends AbstractEntity {

    private LocalDate date;
    private String localName;
    private String name;
    private String countryCode;
}
