package ro.adesso.vacation_app.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;
import ro.adesso.vacation_app.util.AbstractEntity;

import java.time.LocalDate;

@Entity
@Getter
@Setter
public class VacationRequest extends AbstractEntity {

    private LocalDate startDate;
    private LocalDate endDate;
    private Long duration;
    private String description;

    @Enumerated(EnumType.STRING)
    private VacationRequestType type;

    @Enumerated(EnumType.STRING)
    private VacationRequestStatus status;

    private boolean withPay;

    @ManyToOne
    @JsonIgnore
    private User user;
}
